export PATH=/home/test/android-ndk-r10e/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin:$PATH  
  
SYSROOT=/home/test/android-ndk-r10e/platforms/android-21/arch-arm/  
  
./configure \  
  CC=arm-linux-androideabi-gcc \  
  --prefix=$PWD/system \  
  CFLAGS=" -I../ncurses -I../progs --sysroot=$SYSROOT" \  
  --host=arm-linux-androideabi \  
  --with-shared \  
  
make  
  
make install  
