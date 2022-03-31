#!/bin/bash

# User-supplied values
PORT=$1
# VOLUME=$2
NAME=$2

docker run \
  --rm \
  -it \
  -p ${PORT}:8888 \
  -e JUPYTER_ENABLE_LAB=yes \
  -v ${PWD}:/home/jovyan/work \
  --name ${NAME} elara