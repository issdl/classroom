FROM ubuntu:16.04
MAINTAINER Maciej Szankin <maciej@szankin.pl>

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade

RUN apt-get -y install \
    bzip2 \
    curl \
    gcc \
    git \
    libjpeg9 \
    libjpeg62 \
    libjpeg-dev \
    libgflags-dev \
    rsync \
    tmux \
    wget \
    vim \
    pkg-config zip g++ zlib1g-dev unzip python software-properties-common

RUN mkdir /packages/

########## ANACONDA ##########
COPY packages/ /packages/
RUN chmod +x /packages/anaconda.sh
RUN bash /packages/anaconda.sh -b -p /opt/anaconda
ENV PATH /opt/anaconda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

########## ANACONDA INTEL CHANNEL ##########
RUN conda update -y conda
RUN conda config --add channels intel
RUN conda update -y conda

########## TENSORFLOW ##########
RUN pip install --ignore-installed --upgrade /packages/tensorflow-1.8.0_830fps_-cp36-cp36m-linux_x86_64.whl

########## CAFFE ##########
RUN conda install -y caffe

########## JUPYTERHUB ##########
RUN conda install -y tornado=4.5.3
RUN conda install -c conda-forge jupyterhub
RUN conda install jupyterhub
RUN conda install notebook

########## NEON ##########
RUN pip install nervananeon

########## CLASSES ##########
RUN mkdir -p /opt/issdl/

