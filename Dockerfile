FROM ubuntu:18.04 

MAINTAINER Soichi Hayashi <hayashis@iu.edu>

RUN apt-get update && apt-get install -y wget git bzip2 jq vim python3 python3-pip python3-numpy liblas-dev

RUN pip3 install dipy==1.1.1 spams==2.6.1

RUN git clone https://github.com/daducci/AMICO.git && cd AMICO && pip3 install .

RUN ldconfig && mkdir -p /N/u /N/home /N/dc2 /N/soft
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
