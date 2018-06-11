#!/bin/bash -x

mkdir -p /opt/issdl/students/ /opt/issdl/core/ /opt/issdl/data/ /opt/issdl/classes/

docker run -p 8000:8000 -v /opt/issdl/users/:/home/:rw -v $(pwd):/root/core/:ro -v /opt/issdl/data:/opt/issdl/data:ro -v /opt/issdl/classes:/opt/issdl/classes:rw -ti issdl/classroom /root/core/startup.sh
