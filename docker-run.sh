#!/bin/bash -x

mkdir -p /opt/issdl/students/ /opt/issdl/core/ /opt/issdl/data/ /opt/issdl/classes/

docker run -p 8000:8000 -v /opt/issdl/students/:/home/:rw -v $(pwd):/opt/issdl/core/:ro -v /opt/issdl/data:/opt/data:ro -v /opt/issdl/classes:/opt/classes:ro -ti issdl/classroom /opt/issdl/core/startup.sh
