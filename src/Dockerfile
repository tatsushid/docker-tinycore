FROM busybox

RUN wget http://tinycorelinux.net/6.x/x86/release/distribution_files/rootfs.gz \
    && mkdir rootfs \
    && cd rootfs \
    && gzip -dc ../rootfs.gz | cpio -id \
    && rm -f ../rootfs.gz \
    && tar cf - . | gzip -c > /tmp/rootfs.tar.gz \
    && cd .. \
    && rm -rf rootfs

CMD ["/bin/true"]
