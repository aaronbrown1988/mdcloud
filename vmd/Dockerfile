FROM ubuntu:latest
RUN apt-get update && apt-get install -y make libgl1 libxinerama1 libxi6
ADD  vmd-1.9.3.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz /opt/
WORKDIR /opt/vmd-1.9.3
RUN ./configure && cd src && make install
WORKDIR /media
CMD ["/usr/local/bin/vmd"]

