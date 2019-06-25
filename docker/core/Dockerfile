FROM ubuntu:16.04

# PROXY SETTINGS
ARG all_proxy
ARG ftp_proxy
ARG http_proxy
ARG https_proxy
ARG no_proxy
ARG socks_proxy

ENV all_proxy $all_proxy
ENV ftp_proxy $ftp_proxy
ENV http_proxy $http_proxy
ENV https_proxy $https_proxy
ENV no_proxy $no_proxy
ENV socks_proxy $socks_proxy

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y dist-upgrade && \
    apt-get -y autoremove

RUN apt-get -y install \
    bzip2=1.0.6-8 \
    build-essential=12.1ubuntu2 \
    cmake=3.5.1-1ubuntu3 \
    curl=7.47.0-1ubuntu2.13 \
    gcc=4:5.3.1-1ubuntu1 \
    g++=4:5.3.1-1ubuntu1 \
    git=1:2.7.4-0ubuntu1.6 \
    rsync=3.1.1-3ubuntu1.2 \
    unzip=6.0-20ubuntu1 \
    vim=2:7.4.1689-3ubuntu1.3

RUN mkdir /packages/

# ANACONDA
ADD anaconda.sh /packages/anaconda.sh
RUN chmod +x /packages/anaconda.sh && \
    bash /packages/anaconda.sh -b -p /opt/anaconda && \
    rm /packages/anaconda.sh
ENV PATH /opt/anaconda/bin:$PATH
RUN conda init bash && \
    conda create -n venv python=3.7 --no-default-packages && \
    echo "source activate venv" >> ~/.bashrc && \
    ln -s /opt/anaconda/envs/venv/bin/python /usr/bin/python
ENV PATH /opt/anaconda/envs/venv/bin:$PATH

RUN pip install \
    virtualenv==16.0.0 \
    six==1.12.0 \
    numpy==1.16.4 \
    wheel==0.33.4 \
    pip==19.1.1 \
    setuptools==41.0.1 \
    mock==3.0.5 \
    future>=0.17.1

RUN git clone https://github.com/keras-team/keras.git -b 1.0.6 /packages/keras && \
    cd /packages/keras && \
    python setup.py install

# BAZEL
ADD bazel.sh /packages/bazel.sh
RUN chmod +x /packages/bazel.sh && \
    /packages/bazel.sh --user && \
    rm /packages/bazel.sh
ENV PATH /root/bin/:$PATH

# NGRAPH / TENSORFLOW
RUN git clone https://github.com/NervanaSystems/ngraph.git /root/ngraph/ && \
    cd /root/ngraph && \
    git checkout ecd63cfa3feb149ee2e32829642420c6e6fbeb43 && \
    git clone https://github.com/tensorflow/ngraph-bridge.git -b v0.14.1 /packages/ngraph-bridge/ && \
    cd /packages/ngraph-bridge/ && \
    python build_ngtf.py --ngraph_src_dir /root/ngraph/ --build_plaidml_backend
RUN pip install \
        /packages/ngraph-bridge/build_cmake/artifacts/tensorflow/tensorflow-1.13.1-cp37-cp37m-linux_x86_64.whl \
        /packages/ngraph-bridge/build_cmake/artifacts/ngraph_tensorflow_bridge-0.14.1-py2.py3-none-manylinux1_x86_64.whl && \
    rm -rf /packages/ngraph/ && \
    rm -rf /packages/ngraph-bridge/ && \
    rm -Rf /root/.cache/bazel/
WORKDIR /root/

# USER PACKAGES
RUN pip install \
    jdc==0.0.8 \
    jupyter==1.0.0 \
    matplotlib==3.0.3 \
    tensorflow-datasets==1.0.2 \
    https://download.pytorch.org/whl/cpu/torch-1.1.0-cp37-cp37m-linux_x86_64.whl \
    https://download.pytorch.org/whl/cpu/torchvision-0.3.0-cp37-cp37m-linux_x86_64.whl
RUN apt-get -y install \
    graphviz

# OPENCV
WORKDIR /root/
RUN apt-get -y install \
    wget
RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/4.0.0.zip
RUN wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.0.0.zip
RUN unzip opencv.zip
RUN unzip opencv_contrib.zip
RUN mv opencv-4.0.0 opencv
RUN mv opencv_contrib-4.0.0 opencv_contrib
RUN apt-get install -y \
    pkg-config \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libv4l-dev \
    libxvidcore-dev \
    libx264-dev \
    libatlas-base-dev\
    gfortran
RUN wget https://github.com/facebook/zstd/releases/download/v1.3.7/zstd-1.3.7.tar.gz \
    && tar xzf zstd-1.3.7.tar.gz \
    && cd zstd-1.3.7 \
    && make install \
    && ldconfig
RUN mkdir /root/opencv/build
WORKDIR /root/opencv/build
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=/root/opencv_contrib/modules \
    -D PYTHON3_LIBRARY=/opt/anaconda/envs/venv/lib/libpython3.7m.so \
    -D PYTHON3_INCLUDE_DIR=/opt/anaconda/envs/venv/include/python3.7m \
    -D PYTHON3_EXECUTABLE=/opt/anaconda/envs/venv/bin/python \
    -D PYTHON3_PACKAGES_PATH=/opt/anaconda/envs/venv/lib/python3.7/site-packages \
    -D BUILD_opencv_python2=OFF \
    -D BUILD_opencv_python3=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D BUILD_EXAMPLES=ON ..

RUN make -j$(nproc) \
    && make install && ldconfig \
    && ln -s /usr/local/python/cv2 /opt/anaconda/envs/venv/lib/python3.7/cv2 \
    && rm -Rf /root/opencv /root/opencv_contrib /root/*.zip

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN pip install \
    import-ipynb==0.1.3 \
    plaidbench==0.6.0 \
    plaidml==0.6.0 \
    plaidml-keras==0.6.0

# CLEANUP
RUN rm -Rf /root/ngraph/ /root/opencv/ /root/zstd-1.3.7/ /root/zstd-1.3.7.tar.gz

RUN mkdir /vol/
WORKDIR /vol/
EXPOSE 7000

CMD ["/usr/bin/python", "-m", "jupyter", "notebook", "--ip=0.0.0.0", "--port=7000", "--allow-root", "--NotebookApp.token=''"]

