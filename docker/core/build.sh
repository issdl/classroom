#!/usr/bin/env bash

wget -c -O anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
wget -c -O bazel.sh https://github.com/bazelbuild/bazel/releases/download/0.21.0/bazel-0.21.0-installer-linux-x86_64.sh

docker build --build-arg all_proxy=${all_proxy} \
             --build-arg ftp_proxy=${ftp_proxy} \
             --build-arg http_proxy=${http_proxy} \
             --build-arg https_proxy=${https_proxy} \
             --build-arg no_proxy=${no_proxy} \
             --build-arg socks_proxy=${socks_proxy} \
             -t issdl/classroom/core:2019 .
