#!/bin/bash -x

wget -c https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh -O packages/anaconda.sh
sudo docker build -t issdl/classroom .

# Update environment.yml file to match current version
./utils/docker-get-env.sh
