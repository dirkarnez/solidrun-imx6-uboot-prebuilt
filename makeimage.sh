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
# boot from sd card
# echo "CONFIG_SPL_BOOT_DEVICE_SDHC=y" >> .config

# export UBOOT_CONFIG="mx6cuboxi_defconfig"
which cc
announce "Building u-boot"
# make mrproper
make mx6cuboxi_defconfig
echo "CONFIG_SPL_BOOT_DEVICE_SDHC=y" >> .config
# echo "CONFIG_STANDALONE_LOAD_ADDR=0x280000" >> .config
# echo "CONFIG_STANDALONE_LOAD_ADDR=0x12000000" >> .config
# echo "CONFIG_EXAMPLES=y" >> .config
# echo "CONFIG_USE_BOOTCOMMAND=y" >> .config
# echo "CONFIG_BOOTCOMMAND=\"load mmc 0:1 \${fdt_addr_r} imx6q-hummingboard-emmc-som-v15.dtb; load mmc 0:1 \${kernel_addr_r} zImage; load mmc 0:1 \${ramdisk_addr_r} init.cpio; setenv bootargs console=ttymxc0,115200n8 root=/dev/mmcblk0p1 rootfstype=auto rootwait; bootz \${kernel_addr_r} \${ramdisk_addr_r}:\${filesize} \${fdt_addr_r}\"" >> .config
# make CONFIG_STANDALONE_LOAD_ADDR=0x12000000 -j8
make -j8
./tools/mkimage -C none -A arm -T script -d ../boot.cmd /dist/boot.scr
announce "image build appears to have been successful"
announce "copying files"
ls
install -v -m644 -D ./SPL /dist/SPL
install -v -m644 -D ./u-boot.img /dist/u-boot.img
install -v -m644 -D ./examples/standalone/hello_world.bin /dist/hello_world.bin
announce "files copied"
read -p "ok"
