#!/bin/bash

# Check if container already there
CONTAINER_NAME="bme4030-project-cpu"

if [ `docker container ls -a | grep ${CONTAINER_NAME} | wc -l` -ge 1 ]; then
  echo "There is a contianer. Reattach by default"
  docker start $CONTAINER_NAME
  docker attach $CONTAINER_NAME
  exit;
else
  echo "Container ${CONTAINER_NAME} not found. Will create a new one."
fi

# Open port for Jupyter. Default is 8888.
docker run --gpus all -it -p 8888:8888 -v `pwd`:/home/root/workspace --user "$(id -u):$(id -g)" --name $CONTAINER_NAME --network=host khjtony/bme4030-project-cpu:dev bash
