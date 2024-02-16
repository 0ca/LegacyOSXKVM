#!/bin/bash
qemu-img create -f qcow2 harddrives/panther.img 40G

qemu-system-ppc -L pc-bios \
-name "Mac OS X Puma" \
-uuid 3159DCE2-A537-47C1-B2C6-FFB44069788C \
-smp 1,cores=1 \
-boot d \
-M mac99 \
-m 2048 \
-device ide-cd,bus=ide.0,drive=OSXInstaller \
-drive "if=none,format=raw,media=disk,id=OSXInstaller,file=osxinstaller/MacOSX10.3.0_Disk1.iso,discard=unmap,detect-zeroes=unmap" \
-device ide-hd,bus=ide.1,drive=HardDrives \
-drive "if=none,format=qcow2,media=disk,id=HardDrives,file=harddrives/panther.img,discard=unmap,detect-zeroes=unmap" \
