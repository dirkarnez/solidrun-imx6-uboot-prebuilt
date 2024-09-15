#!/bin/bash

echo 'User: $(whoami) UID: $(id -u) GID: $(id -g)'

# an echo that will stand out in the logs
function announce () {
    echo "##########################################################################################"
    echo "##############################  $*  ######################################################"
    echo "##########################################################################################"
}

set -e

cd /opt; \
   wget https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz; \
   tar xvfJ gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz; \
   rm gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz

export PATH=/opt/gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf/bin:$PATH

cd /workspace/u-boot-imx6
export CROSS_COMPILE="arm-none-linux-gnueabihf-"
export UBOOT_CONFIG="mx6cuboxi_defconfig"

uname -m
file arm-none-linux-gnueabihf-gcc

# which cc
announce "Building u-boot"
make CC=arm-none-linux-gnueabihf-gcc "$UBOOT_CONFIG"
make 
announce "image build appears to have been successful"
