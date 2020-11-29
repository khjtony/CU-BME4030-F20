#!/bin/bash
if [[ $1 = "gpu" ]]; then
  base_image="nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04"
  image_name="khjtony/bme4030-project-gpu:dev"
elif [[ $1 = "cpu" ]]; then
  base_image="ubuntu:18.04"
  image_name="khjtony/bme4030-project-cpu:dev"
else
  echo Please specify cpu or gpu
  exit;
fi

docker build -t $image_name \
  --build-arg BASE_IMAGE=${base_image} \
  -f docker/Dockerfile .
