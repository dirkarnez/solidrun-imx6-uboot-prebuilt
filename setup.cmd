@REM run as Administrator
@echo off

if not exist "%USERPROFILE%\Downloads\PortableGit" (
cd /d "%TEMP%" && ^
%SystemRoot%\System32\curl.exe https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.2/PortableGit-2.42.0.2-64-bit.7z.exe -L -O -J  && ^
C:\PROGRA~1\7-Zip\7z.exe x PortableGit-2.42.0.2-64-bit.7z.exe -o"%USERPROFILE%\Downloads\PortableGit"  && ^
del PortableGit-2.42.0.2-64-bit.7z.exe
)

if not exist "%USERPROFILE%\Downloads\x86_64-8.1.0-release-posix-seh-rt_v6-rev0" (
cd /d "%TEMP%" && ^
%SystemRoot%\System32\curl.exe "https://github.com/dirkarnez/cpp-tools/raw/main/x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z" -L -O -J && ^
C:\PROGRA~1\7-Zip\7z.exe x x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z -o"%USERPROFILE%\Downloads\x86_64-8.1.0-release-posix-seh-rt_v6-rev0" && ^
del x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z
)

if not exist "%USERPROFILE%\Downloads\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-aarch64-none-elf\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-aarch64-none-elf\bin" (
cd /d "%TEMP%" && ^
%SystemRoot%\System32\curl.exe "https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-aarch64-none-elf.zip" -L -O -J && ^
C:\PROGRA~1\7-Zip\7z.exe x arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-aarch64-none-elf.zip -o"%USERPROFILE%\Downloads\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-aarch64-none-elf" && ^
del arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-aarch64-none-elf.zip
)


pause
