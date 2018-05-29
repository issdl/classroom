#!/bin/bash -x

docker run -v $(pwd):/opt/core/:ro -v /opt/data:/opt/data:ro -v /opt/classes:/opt/classes:ro -ti issdl/classroom conda env export --name base > environment.yml
