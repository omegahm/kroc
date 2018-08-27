FROM i386/ubuntu:12.04
LABEL maintainer.name="Mads Ohm Larsen" \
      maintainer.email="<mads.ohm@gmail.com>" \
      version="1.0" \
      last_updated="2018-08-27"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -qq -y build-essential \
                           bash \
                           gcc \
                           binutils \
                           gawk \
                           make \
                           automake \
                           autoconf \
                           pkg-config \
                           libc6-dev \
                           libsdl1.2-dev \
                           libsdl-sound1.2-dev \
                           libgl1-mesa-dev \
                           libmysqlclient15-dev \
                           libpng12-dev \
                           libxmu-dev \
                           libxi-dev \
                           libplayercore2-dev \
                           libplayerc2-dev \
                           libltdl3-dev \
                           perl \
                           python \
                           xsltproc \
                           git \
                           libtool \
                           vim

WORKDIR /root
ADD https://github.com/concurrency/kroc/archive/kroc-1.6.0.tar.gz .
RUN tar -zxf kroc-1.6.0.tar.gz
WORKDIR /root/kroc-kroc-1.6.0
RUN autoreconf -vfi
RUN ./configure --prefix=/usr/local/kroc --with-toolchain=kroc
RUN make -j4
RUN make -j4 install
RUN cat /usr/local/kroc/bin/kroc-setup.sh >> ~/.bashrc
CMD ["make", "check"]
