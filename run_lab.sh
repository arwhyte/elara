#!/bin/bash

docker run \
  --rm
  -p 8888:8888
  -v /Users/arwhyte/Development/jupyter:/home/jovyan/work
  -e JUPYTER_ENABLE_LAB=yes
  --name jupyter_lab jpyedu-scipy