#!/usr/bin/env bash

ROOT_DIR=/data/issdl
HOST_HOME_DIR=$ROOT_DIR/home
CORE_DIR=$ROOT_DIR/core
SHARED_DIR=$ROOT_DIR/shared

mkdir -p $HOST_HOME_DIR $CORE_DIR

cp ~/students.txt $CORE_DIR/
cp ~/speakers.txt $CORE_DIR/
cp ~/speaker_lectures_map.txt $CORE_DIR/

docker run \
  --hostname=issdl_classroom_dev \
  -v $CORE_DIR:/core/ \
  -v $HOST_HOME_DIR:/home/
  -v $SHARED_DIR:/shared/:ro \
  -p 7000:7000 \
  -ti issdl/classroom:2019-dev $@

