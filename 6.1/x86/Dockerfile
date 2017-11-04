FROM scratch
ADD rootfs.tar.gz /
ADD squashfs-tools.tar.gz /

RUN mkdir -p /tmp/tce/optional \
    && chown -R root:staff /tmp/tce /usr/local/tce.installed \
    && chmod -R g+w /tmp/tce \
    && $(cd etc/sysconfig; ln -s ../../tmp/tce tcedir) \
    && echo -n > etc/sysconfig/tcuser \
    && mkdir /home/tc \
    && chown tc:staff /home/tc

USER tc
CMD ["/bin/sh"]
