set -x -v 
export ANDROID_NDK_HOME=/home/itri-android/android-ndk-r16b

export ANDROID_STANDALONE_TOOLCHAIN_HOME=/opt/toolchain/android-toolchain-x86_64-4.9-android-24_r17
export SYSROOT=$ANDROID_STANDALONE_TOOLCHAIN_HOME/sysroot



# User specific environment and startup programs
PATH=${ANDROID_NDK_HOME}
PATH=$PATH:${ANDROID_SDK_HOME}/tools:${ANDROID_SDK_HOME}/platform-tools
PATH=$PATH:${ANDROID_STANDALONE_TOOLCHAIN_HOME}/bin:/usr/local/sbin:/usr/local/bin
PATH=$PATH:/usr/sbin:/usr/bin:/sbin:/bin
export PATH=$PATH

# Tell configure what flags Android requires.
export CFLAGS="-fPIE -fPIC --sysroot=$SYSROOT"
export LDFLAGS="-pie"

# SELinux specifics
BASEDIR=$(pwd)
export ANDROID_LIBS="$BASEDIR/../lxc/android-libs/x86_64"
export CFLAGS="$CFLAGS -I$ANDROID_LIBS/include"
export LDFLAGS="$LDFLAGS -L$ANDROID_LIBS/lib"

export BUILD_TARGET_HOST=x86_64-linux-android 
export LSOF_CC="$BUILD_TARGET_HOST-clang $CFLAGS $LDFLAGS "
export LSOF_HOST=$BUILD_TARGET_HOST
export LSOF_CFGF='-O -DHAS_STRFTIME -DHASNORPC_H -DGLIBCV'  




cd lsof-4.89
 
./Configure -n linux  
  
make 

echo "*********************dynamic link version bulding finished***************"
echo "**********************start building static link version*****************"

export export LSOF_CC="$BUILD_TARGET_HOST-clang --sysroot=$SYSROOT -I$ANDROID_LIBS/include -L$ANDROID_LIBS/lib"

#export export LSOF_CC="$BUILD_TARGET_HOST-clang --sysroot=$SYSROOT"

$LSOF_CC -o lsof -static dfile.o dmnt.o dnode.o dproc.o dsock.o dstore.o arg.o main.o misc.o node.o print.o proc.o store.o usage.o util.o  -L./lib -llsof -lselinux 
