#!/bin/bash

# User-supplied values
PORT=$1
VOLUME=$2
NAME=$3

docker run \
  --rm \
  -it \
  -p ${PORT}:8888 \
  -v ${VOLUME}:/home/jovyan/work \
  --name ${NAME} elara