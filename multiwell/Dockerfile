FROM ubuntu:latest
RUN apt-get update && apt-get install -y gfortran libopenmpi3 libopenmpi-dev openmpi-bin build-essential make 
RUN apt-get install -y zip awscli
RUN mkdir /build 
WORKDIR /build 
ADD multiwell-2023.1-u.zip /build/
RUN unzip multiwell-2023.1-u.zip
WORKDIR /build/multiwell-2023.1-u
RUN make -j4
ENV OMPI_ALLOW_RUN_AS_ROOT=1
ENV OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1



