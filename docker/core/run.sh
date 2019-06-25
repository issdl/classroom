#!/usr/bin/env bash

mkdir -p vol/ && \
docker run -v $(pwd)/vol:/vol/ --hostname=issdl_classroom_core -p 7000:7000 -ti issdl/core:2019 $@
