#!/bin/bash

# Build cores
/opt/MATLAB/MATLAB/$1/bin/matlab -nodesktop -nodisplay -nosplash -r "hdlsetuptoolpath('ToolName','Xilinx Vivado','ToolPath','/opt/Xilinx/Vivado/${2}/bin/vivado');setupzynqradiorepositories();exit(0);"

# Build container
#mkdir -p mlhsp
#mount --bind /mlhsp mlhsp

docker build -f Dockerfile-ml -t tfcollins/hdl-ci:latest .

#umount mlhsp
