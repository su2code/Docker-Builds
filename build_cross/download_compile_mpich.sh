#!/bin/sh


if [ ! -d "mpich-$1" ]; then
  # Download
  wget http://www.mpich.org/static/downloads/$1/mpich-$1.tar.gz

  # Unpack archive
  tar -xvf mpich-$1.tar.gz

  # Delete archive
  rm mpich-$1.tar.gz

fi

cd mpich-$1

# Configure
./configure --host=$2 --enable-static --disable-shared --disable-fortran --prefix=/mpich-$2 --disable-opencl

# Compile and install
make install -j4 

# clean
make clean
