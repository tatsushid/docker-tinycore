#!/bin/sh

if [ ! -f squashfs-tools.tcz ]; then
    wget http://tinycorelinux.net/7.x/x86_64/tcz/squashfs-tools.tcz
fi

mount -t squashfs -o loop,ro,bs=4096 squashfs-tools.tcz /mnt
tar cf - -C /mnt . | gzip -c
