FROM ubuntu:16.04
MAINTAINER Maciej Szankin <maciej@szankin.pl>

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade

RUN apt-get -y install \
    bzip2 \
    curl \
    tmux \
    wget \
    vim

RUN mkdir /packages/
RUN wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh -O /packages/anaconda.sh
RUN chmod +x /packages/anaconda.sh
RUN bash /packages/anaconda.sh -b -p /opt/anaconda

ENV PATH /opt/anaconda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN conda update -y conda
RUN conda config --add channels intel
RUN conda update -y conda
RUN conda install -y caffe
RUN conda install -y tensorflow

########## USERS ##########
RUN PASSWORD=test; NUMBER_OF_USERS=10; for n in `seq -f "%02g" 1 $NUMBER_OF_USERS`; do echo creating user training$n; echo training$n:$PASSWORD::::/home/training$n:/bin/bash | newusers; done;

########## JUPYTERHUB ##########
RUN conda install -c conda-forge jupyterhub
RUN conda install jupyterhub
RUN conda install notebook

########## NEON ##########
RUN apt-get -y install \
    gcc
RUN pip install nervananeon
