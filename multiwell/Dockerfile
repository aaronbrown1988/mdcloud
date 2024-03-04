FROM ubuntu:latest
RUN apt-get update && apt-get install -yq tzdata &&  ln -fs /usr/share/zoneinfo/Australia/Sydney /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
ENV TZ="Australia/Sydney"
RUN apt-get install -y gfortran libopenmpi3 libopenmpi-dev openmpi-bin build-essential make zip awscli
RUN mkdir /build 
WORKDIR /build 
ADD multiwell-2023.1-u.zip /build/
RUN unzip multiwell-2023.1-u.zip
WORKDIR /build/multiwell-2023.1
RUN make -j4
ENV OMPI_ALLOW_RUN_AS_ROOT=1
ENV OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1

# TODO
# - Add in helperscript to grab the input and output from S3
# - make this a multi-stage container



