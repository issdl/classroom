#!/bin/bash -x

mkdir -p docker/packages/
wget -c https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh -O docker/packages/anaconda.sh
sudo docker build -t issdl/classroom docker/

# Update environment.yml file to match current version
./utils/docker-get-env.sh
