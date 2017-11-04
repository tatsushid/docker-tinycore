#!/bin/sh

apk add --no-cache curl squashfs-tools >/dev/null

if [ ! -f squashfs-tools.tcz ]; then
    curl -SLO http://tinycorelinux.net/8.x/x86_64/tcz/squashfs-tools.tcz >/dev/null
fi

[ -d /mnt ] || mkdir /mnt
unsquashfs -f -d /mnt squashfs-tools.tcz >/dev/null
tar cf - -C /mnt . | gzip -c
