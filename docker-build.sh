#!/bin/bash -x

docker build -t issdl/classroom docker/

# Update environment.yml file to match current version
./utils/docker-get-env.sh
