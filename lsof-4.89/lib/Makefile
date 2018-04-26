# linux Makefile for lsof revision 4.89

CC=	x86_64-linux-android-clang -fPIE -fPIC --sysroot=/opt/toolchain/android-toolchain-x86_64-4.9-android-24/sysroot -I/home/itri-android/cba/htop-android/../lxc/android-libs/x86_64/include -pie -L/home/itri-android/cba/htop-android/../lxc/android-libs/x86_64/lib

LIB=	lib/liblsof.a

CFGF=	-O -DHAS_STRFTIME -DHASNORPC_H -DGLIBCV -DLINUXV=44117 -DHASIPv6 -DNEEDS_NETINET_TCPH -DHASSELINUX -DHASUXSOCKEPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.4.117\"

CFGL=	 -L./lib -llsof  -lselinux

DEBUG=	-O

AR=	ar cr ${LIB} ${OBJ}

RANLIB=	ranlib ${LIB}

CFLAGS=	${CDEFS} ${INCL} ${DEBUG}

# Lsof library Makefile skeleton
#
# This skeleton is added to definitions established by Configure.
#
# $Id: Makefile.skel,v 1.13 2001/02/13 02:12:16 abe Exp $

LIB=	liblsof.a

CDEF=	${RC_CFLAGS}
CDEFS=	${CDEF} ${CFGF}
INCL=	${DINC}

HDR=	../lsof.h ../proto.h ../dlsof.h ../dproto.h ../machine.h

SRC=	ckkv.c cvfs.c dvch.c fino.c isfn.c lkud.c pdvn.c prfp.c \
	ptti.c rdev.c regex.c rmnt.c rnam.c rnch.c rnmh.c snpf.c

OBJ=	ckkv.o cvfs.o dvch.o fino.o isfn.o lkud.o pdvn.o prfp.o \
	ptti.o rdev.o regex.o rmnt.o rnam.o rnch.o rnmh.o snpf.o

all:	${LIB}

${LIB}:	${OBJ}
	${AR}
	${RANLIB}

clean:	FRC
	rm -f ${LIB} ${OBJ} errs Makefile.bak a.out core

FRC:

ckkv.o: ${HDR} ckkv.c

cvfs.o: ${HDR} cvfs.c

dvch.o: ${HDR} dvch.c

fino.o: ${HDR} fino.c

isfn.o: ${HDR} isfn.c

lkud.o: ${HDR} lkud.c

pdvn.o: ${HDR} pdvn.c

prfp.o: ${HDR} prfp.c

ptti.o:	${HDR} ptti.c

rdev.o: ${HDR} rdev.c

regex.o: ${HDR} ../regex.h regex.c

rmnt.o: ${HDR} rmnt.c

rnam.o: ${HDR} rnam.c

rnch.o: ${HDR} rnch.c

rnmh.o: ${HDR} rnmh.c

snpf.o: ${HDR} snpf.c
