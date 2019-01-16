#!/bin/bash

nasm BSF.asm -o BSF.bin -f bin &&
nasm newboot.asm -o newboot.bin -f bin &&
cat newboot.bin >> BSF.bin &&
rm newboot.bin &&
mkdir tmp &&
mv BSF.bin tmp/ &&
genisoimage -no-emul-boot -b BSF.bin -o BSF.iso tmp/ &&
rm -rf tmp/
