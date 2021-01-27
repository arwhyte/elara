#!/bin/bash

# User-supplied values
PORT=$1
VOLUME=$2

docker run \
  --rm \
  -p ${PORT}:8888 \
  -v ${VOLUME}:/home/jovyan/work \
  -e JUPYTER_ENABLE_LAB=yes \
  --name lab elara