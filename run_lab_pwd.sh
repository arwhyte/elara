#!/bin/bash

# User-supplied values
PORT=$1
# VOLUME=$2
NAME=$3

docker run \
  -it \
  --rm \
  -p ${PORT}:8888 \
  -e JUPYTER_ENABLE_LAB=yes \
  -v ${PWD}:/home/jovyan/work \
  --name ${NAME} elara