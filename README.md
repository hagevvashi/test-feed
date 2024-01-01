# test-feed
test

## メモ

docker imageの作成

```shell
$ IMAGE_NAME=rust-test TAG=$(date "+%Y%m%d%H%M%S"); echo "IMAGE_NAME: ${IMAGE_NAME}, TAG: ${TAG}";docker build --build-arg UID=$(id -u ${USER}) --build-arg GID=$(id -g ${USER}) --build-arg UNAME=${USER} --build-arg GNAME=$(id -n -g ${USER}) --build-arg RUST_VERSION=stable -t ${IMAGE_NAME}:${TAG} .
...省略

$ docker images
REPOSITORY   TAG              IMAGE ID       CREATED          SIZE
rust-test    20231230224255   9087bb29f34a   13 minutes ago   97.7MB
```

docker container作成

```shell
$ docker run -it --rm --mount type=bind,source=./,target=/home/${USER}/project -w /home/${USER}/project rust-test:20231230224255 /usr/bin/env bash
```
