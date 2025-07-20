#!/bin/sh
../../bin/oscar64 largemem.c
../../bin/oscar64 allmem.c
../../bin/oscar64 charsetlo.c
../../bin/oscar64 charsethi.c
../../bin/oscar64 charsetcopy.c
../../bin/oscar64 charsetexpand.c
../../bin/oscar64 charsetload.c -d64=charsetload.d64 -fz=../resources/charset.bin
../../bin/oscar64 easyflash.c -n -tf=crt
../../bin/oscar64 easyflashreloc.c -n -tf=crt
../../bin/oscar64 easyflashshared.c -n -tf=crt
../../bin/oscar64 easyflashcall.cpp -n -tf=crt
../../bin/oscar64 tsr.c -n -dNOFLOAT -dNOLONG
../../bin/oscar64 overlay.c -n -d64=overlay.d64
