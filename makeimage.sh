#!/bin/bash

# an echo that will stand out in the logs
function announce () {
    echo "##########################################################################################"
    echo "##############################  $*  #######################################"
    echo "##########################################################################################"
}

set -e


export PATH=/opt/gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf/bin:$PATH

cd /workspace/u-boot-imx6
export CROSS_COMPILE="arm-none-linux-gnueabihf-"
UBOOT_CONFIG="mx6cuboxi_defconfig"
which cc
announce "Building u-boot"
make CC=arm-none-linux-gnueabihf-gcc "$UBOOT_CONFIG"
make 
announce "image build appears to have been successful"
read -p ""