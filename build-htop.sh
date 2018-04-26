export PATH=/home/test/android-ndk-r10e/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin:$PATH  
  
SYSROOT=/home/test/android-ndk-r10e/platforms/android-21/arch-arm/  
  
./configure \  
  CC=arm-linux-androideabi-gcc \  
  --prefix=$PWD/system \  
  --bindir=$PWD/system/bin \  
  CFLAGS=" -I$PWD/../ncurses-6.0/system/include -I$PWD/../ncurses-6.0/system/include/ncurses --sysroot=$SYSROOT -fPIE -pie" \  
  LDFLAGS=" -L$PWD/../ncurses-6.0/system/lib" \  
  --host=arm-linux-androideabi \  
  --disable-unicode  
  
make  
  
make install  
