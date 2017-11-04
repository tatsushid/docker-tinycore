IMAGE_NAME := tinycore
IMAGE_TAG := 8.2-x86_64
TMP_IMAGE_NAME := $(IMAGE_NAME)-tar-builder
TMP_CONTAINER_NAME := $(IMAGE_NAME)-tar-exporter

.PHONY: all build stop clean

all: build

build: rootfs64.tar.gz
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

rootfs64.tar.gz: squashfs-tools.tar.gz
	docker build -t $(TMP_IMAGE_NAME) src
	docker run --name $(TMP_CONTAINER_NAME) $(TMP_IMAGE_NAME)
	docker wait $(TMP_CONTAINER_NAME)
	docker cp $(TMP_CONTAINER_NAME):/tmp/rootfs64.tar.gz ./
	docker rm $(TMP_CONTAINER_NAME)
	docker rmi $(TMP_IMAGE_NAME)

squashfs-tools.tar.gz:
	docker run -d --privileged --name $(TMP_CONTAINER_NAME) alpine sleep 180
	docker start $(TMP_CONTAINER_NAME)
	docker exec -i $(TMP_CONTAINER_NAME) /bin/sh -c 'cat > /tmp/build_squashfs_tools.sh; /bin/sh /tmp/build_squashfs_tools.sh' < src/build_squashfs_tools.sh > squashfs-tools.tar.gz
	docker kill $(TMP_CONTAINER_NAME)
	docker rm $(TMP_CONTAINER_NAME)

clean:
	docker ps | grep -q $(TMP_CONTAINER_NAME) && docker stop $(TMP_CONTAINER_NAME) || true
	docker ps -a | grep -q $(TMP_CONTAINER_NAME) && docker rm $(TMP_CONTAINER_NAME) || true
	docker images $(IMAGE_NAME) | grep -q $(IMAGE_TAG) && docker rmi $(IMAGE_NAME):$(IMAGE_TAG) || true
	docker images | grep -q $(TMP_IMAGE_NAME) && docker rmi $(TMP_IMAGE_NAME) || true
