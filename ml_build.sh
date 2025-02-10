#!/bin/bash
set -xe

# Create tmp HSP folder
cp -r /opt/MATLAB/HSPs /scratch/

# Build cores
/opt/MATLAB/$1/bin/matlab -nodesktop -nodisplay -nosplash -r "matlabshared.supportpkg.setSupportPackageRoot('/scratch/HSPs/${1}/');exit(0);"
/opt/MATLAB/$1/bin/matlab -nodesktop -nodisplay -nosplash -r "hdlsetuptoolpath('ToolName','Xilinx Vivado','ToolPath','/opt/Xilinx/Vivado/${2}/bin/vivado');setupzynqradiorepositories();exit(0);"

# Build container
#mkdir -p mlhsp
#mount --bind /mlhsp mlhsp

cp -r /home/tcollins/.matlab .
cp -r /scratch/HSPs .

docker build -f Dockerfile-ml -t tfcollins/hdl-ci:latest .

#umount mlhsp
