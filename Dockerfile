FROM ubuntu:latest

# Install dependencies from apt

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y --no-install-recommends --allow-unauthenticated install \
   build-essential \
   git \
   zip \
   unzip \
   xz-utils \
   wget \
   curl \
   ca-certificates \
   make \
   bash

RUN apt-get install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu && \
   ln -f -s /usr/aarch64-linux-gnu/lib/ld-linux-aarch64.so.1 /lib && \
   ln -f -s /usr/aarch64-linux-gnu/lib/libc.so.6 /lib && \
   ln -f -s /usr/aarch64-linux-gnu/lib/libdl.so.2 /lib && \
   ln -f -s /usr/aarch64-linux-gnu/lib/libm.so.6 /lib
   
RUN cd /opt; \
   wget https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz; \
   tar xvfJ gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz; \
   rm gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz

RUN mkdir /workspace
COPY . /workspace

WORKDIR /workspace
VOLUME /workspace

CMD /workspace/

CMD ls && \
   ./makeimage.sh