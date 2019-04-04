FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential autoconf automake cmake git libfftw3-dev libfftw3-3 wget
RUN mkdir build output input
RUN git clone https://charm.cs.illinois.edu/gerrit/namd.git namd
RUN git clone https://charm.cs.illinois.edu/gerrit/charm charm
RUN cd charm && ./build charm++ netlrts-linux-x86_64 --with-production  && cd netlrts-linux-x86_64/tests/charm++/megatest && make pgm && ./charmrun ++local +p4 ./pgm  && cd ../../../../..
WORKDIR /namd
RUN wget http://www.ks.uiuc.edu/Research/namd/libraries/fftw-linux-x86_64.tar.gz && tar xzf fftw-linux-x86_64.tar.gz
RUN  mv linux-x86_64 fftw && wget http://www.ks.uiuc.edu/Research/namd/libraries/tcl8.5.9-linux-x86_64.tar.gz
RUN wget http://www.ks.uiuc.edu/Research/namd/libraries/tcl8.5.9-linux-x86_64-threaded.tar.gz && tar xzf tcl8.5.9-linux-x86_64.tar.gz
RUN tar xzf tcl8.5.9-linux-x86_64-threaded.tar.gz &&  mv tcl8.5.9-linux-x86_64 tcl &&  mv tcl8.5.9-linux-x86_64-threaded tcl-threaded
RUN sed -ie 's#CHARMBASE.*#CHARMBASE=/charm/#' Make.charm
RUN sed -ie 's#Projects/namd2#namd#' arch/Linux-x86_64.fftw
RUN sed -ie 's#Projects/namd2#namd#' arch/Linux-x86_64.tcl
RUN ./config Linux-x86_64-g++ --charm-arch netlrts-linux-x86_64
WORKDIR /namd/Linux-x86_64-g++
RUN make -j4