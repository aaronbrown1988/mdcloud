FROM ubuntu:latest
RUN apt-get update && apt-get install -yq tzdata &&  ln -fs /usr/share/zoneinfo/Australia/Sydney /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
ENV TZ="Australia/Sydney"
RUN apt-get install -y gfortran libopenmpi3 libopenmpi-dev openmpi-bin build-essential make zip awscli git cmake
RUN mkdir /build 
WORKDIR /build 
RUN git clone --recurse-submodules https://github.com/geoschem/GCClassic.git GCClassic
WORKDIR /build/GCClassic
ADD gcclassic.gnu.env /root/gnu.env 
RUN mkdir /run_dirs

