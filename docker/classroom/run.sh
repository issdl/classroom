#!/usr/bin/env bash

ROOT_DIR=/data/issdl
HOST_HOME_DIR=$ROOT_DIR/home
CORE_DIR=$ROOT_DIR/core

cp ~/students.txt $CORE_DIR/
cp ~/speakers.txt $CORE_DIR/

mkdir -p $HOST_HOME_DIR

docker run --hostname=issdl_classroom -v $CORE_DIR:/core/ -v $HOST_HOME_DIR:/home/ -p 8000:8000 -p 9000-9500:9000-9500 -ti issdl/classroom:2019 $@

