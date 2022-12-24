FROM ubuntu:20.04

LABEL org.opencontainers.image.source https://github.com/su2code/Docker-Builds

ENV LANG C.UTF-8
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime
RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y \
    apt-utils \
    python3 \
    pkg-config \
    python3-pip \
    git \
    build-essential \
    cmake \
    python3-numpy \
    python3-scipy \
    python3-mpi4py \
    swig \
    libopenmpi-dev \
    libopenblas-dev \
    openmpi-bin \
    ccache \
 && rm -rf /var/lib/apt/lists/* \
 && update-alternatives --install /usr/bin/python python /usr/bin/python3 10 \
 && /usr/sbin/update-ccache-symlinks \
 && echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a ~/.bashrc 

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY compileSU2.sh /compileSU2.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/compileSU2.sh"]
