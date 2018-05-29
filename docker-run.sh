#!/bin/bash -x

docker run -p 8000:8000 -v $(pwd):/opt/core/:ro -v /opt/data:/opt/data:ro -v /opt/classes:/opt/classes:ro -ti issdl/classroom /opt/core/startup.sh
