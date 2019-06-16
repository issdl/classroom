#!/usr/bin/env bash

docker run --hostname=issdl_classroom_core -p 8000:8000 -ti issdl/classroom/core:2019 $@
