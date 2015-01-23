FROM busybox

RUN wget http://tinycorelinux.net/6.x/x86_64/release/distribution_files/rootfs64.gz \
    && mkdir rootfs64 \
    && cd rootfs64 \
    && gzip -dc ../rootfs64.gz | cpio -id \
    && rm -f ../rootfs64.gz \
    && tar cf - . | gzip -c > /tmp/rootfs64.tar.gz \
    && cd .. \
    && rm -rf rootfs64

CMD ["/bin/true"]
