#!/bin/bash

# pull code
git clone https://github.com/akaraspt/deepsleepnet.git ./github_code

# pull dataset
cd github_code/data
chmod +x download_physionet.sh
bash download_physionet.sh