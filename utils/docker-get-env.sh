#!/bin/bash -x

docker run -p 8000:8000 -ti issdl/classroom conda env export --name base > environment.yml
