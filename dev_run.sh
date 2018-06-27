#!/bin/bash -x

mkdir -p /opt/issdl/students/ /opt/issdl/core/ /opt/issdl/data/ /opt/issdl/classes/

docker run -p 7000:8000 -v $(pwd):/root/core/:ro -ti issdl/classroom bash
