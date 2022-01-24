#!/bin/bash

mkdir -p mlhsp
mount --bind /mlhsp mlhsp

docker build -f Dockerfile-ml -t tfcollins/hdl-ci:latest .

umount mlhsp
