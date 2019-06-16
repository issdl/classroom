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
    conda create -n venv python=3.5 --no-default-packages && \
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
    future>=0.17.1 && \
    \
    pip install -U --user --no-deps \
    keras_applications==1.0.6 \
    keras_preprocessing==1.0.5

# BAZEL
ADD bazel.sh /packages/bazel.sh
RUN chmod +x /packages/bazel.sh && \
    /packages/bazel.sh --user && \
    rm /packages/bazel.sh
ENV PATH /root/bin/:$PATH

# NGRAPH / TENSORFLOW
RUN git clone https://github.com/tensorflow/ngraph-bridge.git -b v0.14.1 /packages/ngraph-bridge/
WORKDIR /packages/ngraph-bridge/
RUN python build_ngtf.py && \
    pip install \
        /packages/ngraph-bridge/build_cmake/artifacts/tensorflow/tensorflow-1.13.1-cp35-cp35m-linux_x86_64.whl \
        /packages/ngraph-bridge/build_cmake/artifacts/ngraph_tensorflow_bridge-0.14.1-py2.py3-none-manylinux1_x86_64.whl && \
    rm -rf /packages/ngraph-bridge/
WORKDIR /root/

# USER PACKAGES
RUN pip install \
    jdc==0.0.8 \
    jupyter==1.0.0 \
    && \
    conda install -c pytorch -n venv \
    pytorch-cpu \
    torchvision-cpu

EXPOSE 8000

CMD ["python", "-m", "jupyter", "notebook", "--ip=0.0.0.0", "--port=8000", "--allow-root", "--NotebookApp.token=''"]

