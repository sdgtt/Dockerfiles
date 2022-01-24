#!/bin/bash

# Build cores
/usr/local/MATLAB/R2021a/bin/matlab -nodesktop -nodisplay -nosplash -r 'setupzynqradiorepositories();exit(0);'

# Build container
mkdir -p mlhsp
mount --bind /mlhsp mlhsp

docker build -f Dockerfile-ml -t tfcollins/hdl-ci:latest .

umount mlhsp
