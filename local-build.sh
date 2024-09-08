# git clone --branch v2018.01-solidrun-imx6 https://github.com/SolidRun/u-boot.git u-boot-imx6

export PATH="/mingw64/bin:/usr/local/bin:/usr/bin:/bin"
export PATH="$PATH:$(cygpath -u $USERPROFILE)/Downloads/arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-aarch64-none-elf/arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-aarch64-none-elf/bin:$(cygpath -u $USERPROFILE)/Downloads/x86_64-8.1.0-release-posix-seh-rt_v6-rev0/mingw64/bin"

export HOSTCC="gcc"
export CROSS_COMPILE="aarch64-none-elf-"
cd u-boot-imx6 &&
mingw32-make


