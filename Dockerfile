FROM ubuntu:16.04
MAINTAINER Soichi Hayashi <hayashis@iu.edu>

#extra things we need
RUN apt-get update && apt-get install -y wget git bzip2

#install miniconda
RUN wget -q -O install.sh https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && chmod +x install.sh && ./install.sh -b -p /conda
ENV PATH=$PATH:/conda/bin

#install dipy and spams (and deps)
RUN conda install -y -c conda-forge dipy python-spams

#install amico (via pip)
RUN git clone https://github.com/daducci/AMICO.git && cd AMICO && pip install .

#make it work under singularity
RUN ldconfig && mkdir -p /N/u /N/home /N/dc2 /N/soft

#https://wiki.ubuntu.com/DashAsBinSh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
