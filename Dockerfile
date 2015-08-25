FROM ubuntu:14.04

RUN apt-get update && \\
    apt-get install -y 
       gawk \\
       git \\
       build-essential \\
       autoconf \\
       automake \\
       libtool \\
       libncurses5 \\
       libncurses5-dev \\
       gawk \\
       libjpeg-dev \\
       libz-dev \\
       pkg-config \\
       sqlite3 \\
       libsqlite3-dev \\
       libcurl3 \\
       libcurl3-dev \\
       libpcre++0 \\
       libpcre3-dev \\
       libspeex-dev \\
       speex \\
       libspeexdsp-dev \\
       libedit-dev \\
       libldns-dev \\
       python \\
       erlang \\
       wget \\
       gcj-jdk && \\
    update-alternatives --set awk /usr/bin/gawk &&

RUN mkdir /opt/freeswitch && \\
    cd /usr/src && \\
    git clone https://freeswitch.org/stash/scm/fs/freeswitch.git && \\
    git checkout tags/v1.4.20

COPY modules.conf /usr/src/freeswitch

RUN ./bootstrap.sh && \\
    ./configure --prefix=/opt/freeswitch --with-java=/usr/java/jdk1.6.0_16/include/ && \\
    make -j 12 && \\
    make install 
