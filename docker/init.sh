#!/bin/bash
#初始化 gcc from docker 环境

IMAGE_NAME="gcc:11.2.0"
IMAGE_FILE="gcc@11_2_0.tar"
IMAGE_RE="gcc.*11.2.0"

bHasGcc=`docker images | grep $IMAGE_RE`
if [ -n "${bHasGcc}" ]; then
    echo "DOCKER EXIST:" ${bHasGcc}
else
    if [ -f ${IMAGE_FILE} ]; then
        echo "DOCKER LOAD:" $IMAGE_FILE
        docker load -i $IMAGE_FILE
    else
        echo "DOCKER PULL:" $IMAGE_NAME
        docker pull $IMAGE_NAME
    fi
fi
