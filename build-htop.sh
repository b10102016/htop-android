
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
export CFLAGS="$CFLAGS -I$ANDROID_LIBS/include -I/odm/include "
export LDFLAGS="$LDFLAGS -L$ANDROID_LIBS/lib -L/odm/lib "

export BUILD_TARGET_HOST=x86_64-linux-android
export ODMDIR=/odm
export CBA_HOME=$ODMDIR
export PREFIX=$CBA_HOME

export CC=$BUILD_TARGET_HOST-clang

cd htop

make distclean


./autogen.sh  



CPPFLAGS="$CPPFLAGS $CFLAGS" \
CFLAGS=$CFLAGS \
LDFLAGS=$LDFLAGS \
#ac_cv_func_malloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes ac_cv_file__proc_stat=yes ac_cv_file__proc_meminfo=yes \
./configure   --prefix=$PREFIX   --bindir=$PREFIX/bin  --host=$BUILD_TARGET_HOST --disable-unicode  

make dist-clean
  
make  
  
make install  
