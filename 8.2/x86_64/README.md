Tiny Core Linux x86\_64 Docker Image Builder
============================================

Dockerfile and helper scripts for building a very small CLI system image based
on Tiny Core Linux developed at [The Core Project](http://tinycorelinux.net).
It builds Core 8.2 x86\_64 image by using following packages which were
converted those archive type from The Core Project packages.

- rootfs64.tar.gz: contains base system binaries and a file system layout
- squashfs-tools.tar.gz: contains a squashfs builder and expander

Those original packages are found under http://tinycorelinux.net/8.x/x86_64

## How to build the image

Just run

```bash
make
```

To clean up the directory, run

```bash
make clean
```

## License

rootfs64.tar.gz, squashfs-tools.tar.gz and tce-load.patch are under
[GPLv2](http://www.gnu.org/licenses/gpl-2.0.html). The other build scripts are
under [MIT](LICENSE).
