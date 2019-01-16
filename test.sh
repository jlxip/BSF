#!/bin/bash
./makeISO.sh > /dev/null &&
cat /dev/zero | head -c 512 > HDD &&
qemu-system-i386 -cdrom BSF.iso -hda HDD &&
qemu-system-i386 -cdrom BSF.iso -hda HDD &&
rm BSF.iso HDD
