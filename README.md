Tiny Core Linux Docker Image Builder
====================================

Dockerfile and helper scripts for building a very small CLI system image based
on Tiny Core Linux developed at [The Core Project](http://tinycorelinux.net).
It builds Core 6.0 x86\_64 image by using following packages which were
converted those archive type from The Core Project packages.

- rootfs64.tar.gz: contains base system binaries and a file system layout
- squashfs-tools.tar.gz: contains a squashfs builder and expander

Those original packages are found under http://tinycorelinux.net/6.x/x86_64

## Installation

The easiest way to install the image is pulling it from
[Docker Hub repositories](https://registry.hub.docker.com/) like following

```bash
docker pull tatsushid/tinycore
```

You can also build it locally. Modify the image name in `Makefile` and run

```bash
make
```

## Usage

Just run

```bash
docker run -it tatsushid/tinycore
```

To install tcz packages into the container and use them, please run `tce-load`
command in it like following

```bash
sudo -u tc tce-load -wic bash.tcz
```

or run the container with privilege mode like following

```bash
docker run -it --privileged tatsushid/tinycore
```

Once it starts with privilege mode, you can run the package manager like

```bash
sudo -u tc tce-ab
```

## Building an image based on this image

Now Docker doesn't support privilege mode at image building so please use
`unsquashfs` command to expand package files downloaded by `tce-load` etc.
instead of installing them by those tools directly.

## License

This builder scripts except rootfs64.tar.gz and squashfs-tools.tar.gz binaries
are under MIT License. See the [LICENSE](./LICENSE) file for details. The
binaries are under [GPLv2](http://www.gnu.org/licenses/gpl-2.0.html)
