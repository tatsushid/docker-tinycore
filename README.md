Tiny Core Linux Docker Image
============================

This provides a very small CLI system image based on Tiny Core Linux developed
at [The Core Project](http://tinycorelinux.net). It contains following Core
x86/x86\_64 packages

- rootfs.gz (or rootfs64.gz): contains base system binaries and a file system
  layout
- squashfs-tools.tcz: contains a squashfs builder and expander

These original packages are found under

 - http://tinycorelinux.net/9.x/
 - http://tinycorelinux.net/8.x/
 - http://tinycorelinux.net/7.x/
 - http://tinycorelinux.net/6.x/

and Dockerfile of these images are found at

- [`9.0-x86`, `latest` (9.0/x86/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/9.0/x86/Dockerfile)
- [`9.0-x86_64` (9.0/x86\_64/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/9.0/x86_64/Dockerfile)
- [`8.2-x86` (8.2/x86/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/8.2/x86/Dockerfile)
- [`8.2-x86_64` (8.2/x86\_64/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/8.2/x86_64/Dockerfile)
- [`8.1-x86` (8.1/x86/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/8.1/x86/Dockerfile)
- [`8.1-x86_64` (8.1/x86\_64/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/8.1/x86_64/Dockerfile)
- [`8.0-x86` (8.0/x86/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/8.0/x86/Dockerfile)
- [`8.0-x86_64` (8.0/x86\_64/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/8.0/x86_64/Dockerfile)
- [`7.2-x86` (7.2/x86/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/7.2/x86/Dockerfile)
- [`7.2-x86_64` (7.2/x86\_64/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/7.2/x86_64/Dockerfile)
- [`7.1-x86` (7.1/x86/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/7.1/x86/Dockerfile)
- [`7.1-x86_64` (7.1/x86\_64/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/7.1/x86_64/Dockerfile)
- [`7.0-x86` (7.0/x86/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/7.0/x86/Dockerfile)
- [`7.0-x86_64` (7.0/x86\_64/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/7.0/x86_64/Dockerfile)
- [`6.4-x86` (6.4/x86/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/6.4/x86/Dockerfile)
- [`6.4-x86_64` (6.4/x86\_64/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/6.4/x86_64/Dockerfile)
- [`6.3-x86` (6.3/x86/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/6.3/x86/Dockerfile)
- [`6.3-x86_64` (6.3/x86\_64/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/6.3/x86_64/Dockerfile)
- [`6.2-x86` (6.2/x86/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/6.2/x86/Dockerfile)
- [`6.2-x86_64` (6.2/x86\_64/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/6.2/x86_64/Dockerfile)
- [`6.1-x86` (6.1/x86/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/6.1/x86/Dockerfile)
- [`6.1-x86_64` (6.1/x86\_64/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/6.1/x86_64/Dockerfile)
- [`6.0-x86` (6.0/x86/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/6.0/x86/Dockerfile)
- [`6.0-x86_64` (6.0/x86\_64/Dockerfile)](https://github.com/tatsushid/docker-tinycore/blob/master/6.0/x86_64/Dockerfile)

## Installation

The easiest way to install the image is pulling it from
[Docker Hub repositories](https://registry.hub.docker.com/) like following

```bash
docker pull tatsushid/tinycore:9.0-x86
```

or

```bash
docker pull tatsushid/tinycore:9.0-x86_64
```

## Usage

Just run

```bash
docker run -it tatsushid/tinycore:9.0-x86
```

or

```bash
docker run -it tatsushid/tinycore:9.0-x86_64
```

To install tcz packages into the container and use them, please run `tce-load`
command in it like following

```bash
tce-load -wic bash.tcz
```

or run the container with privilege mode like following

```bash
docker run -it --privileged tatsushid/tinycore:9.0-x86
```

Once it starts with privilege mode, you can run the package manager like

```bash
tce-ab
```

## Building an image based on this image

Now Docker doesn't support privilege mode at image building but this image
includes patched `tce-load` which works without privilege mode by using
`unsquashfs` internally instead of mounting squashfs on a loop back device so
to install packages, please use `tce-load` with `-c` option

If you need an example, please see my
[tinycore-ruby](https://github.com/tatsushid/docker-tinycore-ruby) or
[tinycore-python](https://github.com/tatsushid/docker-tinycore-python)
Dockerfile
