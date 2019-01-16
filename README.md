# BSF
_Boot Sector Fucker_

## Introduction
**BSF** is a really simple bootloader which overwrites the MBR of all the connected hard disks to any of your choice. By default, `newboot.asm` is used, which just shows the message: `This hard disk is fucked.` when the computer is turned on.

## Dependencies to assemble
- Nasm
- Genisoimage
- Qemu (if you want to try it out)

## How to use
Modify `newboot.asm` if you want, and just run `makeISO.sh`. This will create `BSF.iso`, which is ready to use. You can also download it [https://github.com/jlxip/BSF/releases](here). A testing script is provided, `test.sh`, which creates an empty virtual HDD, and executes qemu twice. Once to modify the MBR, and another time to show the result. You can use it in VirtualBox or create a LiveCD/USB as well.
