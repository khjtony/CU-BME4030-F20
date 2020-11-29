# CU-BME4030-F20
This is git repo for the BME4030 class in Fall 2020. 
Team for final project:
- Weijia Zhang
- Yuming Ye
- Hengjiu Kang

This final project is used to replicate a research from https://github.com/akaraspt/deepsleepnet
# Prerequisite
You need you install docker. 
MacOS: https://hub.docker.com/editions/community/docker-ce-desktop-mac/
Linux: https://docs.docker.com/engine/install/ubuntu/
Linux with CUDA support: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker

# Quick start
* Pull this repo to your local directory: `$git clone --recurse-submodules https://github.com/khjtony/CU-BME4030-F20.git ./cu-bme4030-f20`
* Install docker community environment
* workspace is in the final_project folder, so: `$cd final_project`
* Run/Retach to a previously created container by `$bash ./scripts/run_container.sh run`
* If you have Nvidia GPU and Nvidia docker installed then you can `$bash ./scripts/run_container.sh run --gpu`
* Now you should be in the docker environment.
* If you encounter problems relating to the environment and want to recreate the container, then `$bash ./scripts/run_container.sh delete`
