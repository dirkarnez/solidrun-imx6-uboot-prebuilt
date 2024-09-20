#!/bin/bash

echo "User: $(whoami) UID: $(id -u) GID: $(id -g)"
gcc --version
# an echo that will stand out in the logs
function announce () {
    echo "##########################################################################################"
    echo "##############################  $*  #################################"
    echo "##########################################################################################"
}

set -e

export PATH=/opt/gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf/bin:$PATH
#  CC=arm-none-linux-gnueabihf-gcc
cd /workspace/u-boot-imx6
export CROSS_COMPILE="arm-none-linux-gnueabihf-"
# export UBOOT_CONFIG="mx6cuboxi_defconfig"
which cc
announce "Building u-boot"
# make mrproper
make mx6cuboxi_defconfig
echo "CONFIG_SPL_BOOT_DEVICE_SDHC=y" >> .config # boot from sd card
make -j8
announce "image build appears to have been successful"
announce "copying files"
install -v -m644 -D ./SPL /dist/SPL
install -v -m644 -D ./u-boot.img /dist/u-boot.img
announce "files copied"


