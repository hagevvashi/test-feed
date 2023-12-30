# test-feed
test

## メモ

docker imageの作成

```shell
$ IMAGE_NAME=rust-test TAG=$(date "+%Y%m%d%H%M%S"); echo "IMAGE_NAME: ${IMAGE_NAME}, TAG: ${TAG}";docker build -t ${IMAGE_NAME}:${TAG} .
IMAGE_NAME: rust-test, TAG: 20231230224255
...省略

$ docker images
REPOSITORY   TAG              IMAGE ID       CREATED          SIZE
rust-test    20231230224255   9087bb29f34a   13 minutes ago   97.7MB
```

docker container作成

```shell
$ docker run -it --rm -e UID=$(id -u ${USER}) -e GID=$(id -g ${USER}) -e UNAME=${USER} -e GNAME=$(id -n -g ${USER}) --mount type=bind,source=./,target=/home/${USER}/project -w /home/${USER}/project rust-test:20231230224255 /usr/bin/env bash
```
