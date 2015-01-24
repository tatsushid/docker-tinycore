FROM scratch
ADD rootfs.tar.gz /
ADD squashfs-tools.tar.gz /

RUN mkdir -p /tmp/tce/optional \
    && chown -R root:50 /tmp/tce \
    && chmod -R g+w /tmp/tce \
    && $(cd etc/sysconfig; ln -s ../../tmp/tce tcedir) \
    && echo -n > etc/sysconfig/tcuser

CMD ["/bin/sh"]
