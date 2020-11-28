# CU-BME4030-F20
This is git repo for the BME4030 class in Fall 2020. 
Team for final project:
- Weijia Zhang
- Yuming Ye
- Hengjiu Kang

This final project is used to replicate a research from https://github.com/akaraspt/deepsleepnet
# Quick start
* Pull this repo to your local directory: `$git clone --recurse-submodules https://github.com/khjtony/CU-BME4030-F20.git ./cu-bme4030-f20`
* Install docker community environment
* workspace is in the final_project folder, so: `$cd final_project`
* `$bash ./scripts/run_cpu_container.sh`
* If you have Nvidia GPU then you can `$bash ./scripts/run_gpu_container.sh` 
* Now you should be in the docker environment.
* In the docker, `#bash ./script/pull_code_and_dataset.sh`
