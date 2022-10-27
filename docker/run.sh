#!/bin/bash
#使用 gcc from docker 执行命令
#see test/...

IMAGE_NAME="gcc:11.2.0"
WORK_DIR="/opt/wy-algorithms"

# 源文件目录 & 执行命令
SRC=$PWD
CMD=$1
echo -e "[PARAMS]: <${SRC}> <${CMD}>\n"

# 创建容器
CONTAINER_ID=`docker run -itd ${IMAGE_NAME}`
echo -e "[RUN]: <${CONTAINER_ID}>\n"

# 拷贝运行目录文件
docker cp ${SRC} ${CONTAINER_ID}:${WORK_DIR}
echo -e "[COPY]: <${SRC}> --> <Container:${WORK_DIR}>\n"

# 执行命令
echo -e "[EXEC]:"
docker exec -w ${WORK_DIR} ${CONTAINER_ID} bash -c "${CMD}"
echo -e "\n"

# 删除容器
echo -e "[REMOVE]: <`docker rm -f ${CONTAINER_ID}`>\n"
