#!/bin/bash

cd $HOME
mkdir workspace
mkdir Downloads

# install mongodb
cd Downloads
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
apt-get update
# One line to install tzdata
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
apt-get install -y mongodb-org
systemctl daemon-reload
systemctl enable mongod
systemctl start mongod

# install minicomda in silent mode from ~
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/Downloads/miniconda.sh
chmod +x ~/Downloads/miniconda.sh
echo "yes" | ~/Downloads/miniconda.sh -b -p ~/miniconda
~/miniconda/bin/conda env create -f /docker/environment.yml

# replace .bashrc
mv /docker/.bashrc ~/.bashrc