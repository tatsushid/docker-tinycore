#!/bin/sh

apk add --no-cache squashfs-tools

if [ ! -f squashfs-tools.tcz ]; then
    wget http://tinycorelinux.net/8.x/x86_64/tcz/squashfs-tools.tcz
fi

[ -d /mnt ] || mkdir /mnt
unsquashfs -f -d /mnt squashfs-tools.tcz
tar cf - -C /mnt . | gzip -c
