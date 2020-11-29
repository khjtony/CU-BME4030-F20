#!/bin/bash

# Constant
kUsage="
Usage: $(basename $0) [OPTIONS] \n

Options: \n
  run \t\t Run the container. If not exist, create first. If exitsted, reattach. \n
  delete \t Delete current container in order to create a new one. Use it when you encounter some problems. ATTENTION: data written to places other then the workspace folder will be deleted! \n"

# arguments
opt_run=false
opt_delete=false
if [[ $# -gt 0 ]]; then
  if [[ $1 = "run" ]]; then
    opt_run=true
  elif [[ $1 == "delete" ]]; then
    opt_delete=true
  fi
else
  echo -e $kUsage
  exit;
fi

# Check if container already there
CONTAINER_NAME="bme4030-project-gpu"

if [ `docker container ls -a | grep ${CONTAINER_NAME} | wc -l` -ge 1 ]; then
  if $opt_run ; then
    echo "There is a container. Reattach by default"
    docker start $CONTAINER_NAME
    docker attach $CONTAINER_NAME
    exit;
  elif $opt_delete ; then
    echo "Delete current container. You need to run a new one"
    docker container ls -a | grep ${CONTAINER_NAME} | cut -d' ' -f1 | xargs -I {} docker container rm {}
    exit;
  fi
else
  if $opt_run ; then
    echo "Container ${CONTAINER_NAME} not found. Will create a new one."
  elif $opt_delete ; then
    echo "Container ${CONTAINER_NAME} not found. Will do nothing."
    exit;
  fi
fi

# Open port for Jupyter. Default is 8888.
docker run --gpus all -it -p 8888:8888 -v `pwd`:/home/root/workspace --name $CONTAINER_NAME --network=host khjtony/bme4030-project-gpu:dev bash