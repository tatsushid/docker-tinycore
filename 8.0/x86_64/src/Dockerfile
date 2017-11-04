FROM alpine

ADD tce-load.patch /tmp/
RUN apk add --no-cache curl \
    && curl -SLO http://www.tinycorelinux.net/8.x/x86_64/release/distribution_files/rootfs64.gz \
    && mkdir rootfs64 \
    && cd rootfs64 \
    && gzip -dc ../rootfs64.gz | cpio -id \
    && rm -f ../rootfs64.gz \
    && cd usr/bin \
    && patch < /tmp/tce-load.patch \
    && cd ../.. \
    && rm -f /tmp/tce-load.patch \
    && tar cf - . | gzip -c > /tmp/rootfs64.tar.gz \
    && cd .. \
    && rm -rf rootfs64

CMD ["/bin/true"]
