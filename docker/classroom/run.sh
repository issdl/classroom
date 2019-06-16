#!/usr/bin/env bash

docker run --hostname=issdl_classroom -p 8000:8000 -p 9000-9500:9000-9500 -ti issdl/classroom:2019 $@
