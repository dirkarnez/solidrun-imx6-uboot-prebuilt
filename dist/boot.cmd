echo "hello!"

load mmc 0:1 ${fdt_addr_r} imx6q-hummingboard-emmc-som-v15.dtb
load mmc 0:1 ${kernel_addr_r} zImage
load mmc 0:1 ${ramdisk_addr_r} init.cpio
setenv bootargs console=ttymxc0,115200n8 earlycon earlyprintk debug root=/dev/mmcblk0p2 rootfstype=ext4 rootwait
bootz ${kernel_addr_r} ${ramdisk_addr_r}:${filesize} ${fdt_addr_r}
