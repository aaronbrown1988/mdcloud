FROM ubuntu:latest
RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential cmake git libfftw3-dev libfftw3-3
RUN git clone git://git.gromacs.org/gromacs.git gromacs
RUN mkdir build output input
WORKDIR /build
RUN cmake ../gromacs
RUN make -j4
WORKDIR /output



