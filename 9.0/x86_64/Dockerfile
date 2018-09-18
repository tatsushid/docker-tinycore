FROM scratch
ADD rootfs64.tar.gz /
ADD squashfs-tools.tar.gz /

RUN mkdir -p /tmp/tce/optional \
    && chown -R root:staff /tmp/tce /usr/local/tce.installed \
    && chmod -R g+w /tmp/tce \
    && $(cd etc/sysconfig; ln -s ../../tmp/tce tcedir) \
    && echo -n tc > etc/sysconfig/tcuser \
    && . /etc/init.d/tc-functions \
    && ldconfig \
    && setupHome

USER tc
CMD ["/bin/sh"]
