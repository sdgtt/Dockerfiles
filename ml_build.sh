#!/bin/bash
set -xe

# Assumptions
# 1. HSP folder is located in /scratch/HSPs/<ML Release>
# 2. From VNC MATLAB runs: matlabshared.supportpkg.setSupportPackageRoot('/scratch/HSPs/${1}') 

# Create tmp HSP folder
#rm -rf /scratch/HSPs
#cp -r /opt/MATLAB/HSPs /scratch/
ls /scratch/HSPs

# Build cores
export DISPLAY_ID=:$(shuf -i 10-1000 -n 1)
Xvfb $DISPLAY_ID &
sleep 5
XVFB_PID=$!
sleep 5
export DISPLAY=$DISPLAY_ID
#/opt/MATLAB/$1/bin/matlab -nodesktop -nodisplay -nosplash -r "matlabshared.supportpkg.setSupportPackageRoot('/opt/MATLAB/HSPs/${1}');exit(0);"
/opt/MATLAB/$1/bin/matlab -nodesktop -nodisplay -nosplash -r "hdlsetuptoolpath('ToolName','Xilinx Vivado','ToolPath','/opt/Xilinx/Vivado/${2}/bin/vivado');setupzynqradiorepositories();pause(5);exit(0);"
kill -9 $XVFB_PID || true

# Build container
#mkdir -p mlhsp
#mount --bind /mlhsp mlhsp

rm -rf .matlab || true
cp -r /home/tcollins/.matlab .
cp -r /scratch/HSPs .

wget https://raw.githubusercontent.com/mathworks-ref-arch/container-images/refs/heads/main/matlab-deps/r2023b/ubuntu20.04/base-dependencies.txt
docker build -f Dockerfile-ml -t tfcollins/hdl-ci:latest .

export DISPLAY_ID=:$(shuf -i 10-1000 -n 1)
Xvfb $DISPLAY_ID &
sleep 5
XVFB_PID=$!
sleep 5
export DISPLAY=$DISPLAY_ID
#docker run -v /opt/MATLAB:/opt/MATLAB:ro --name temp-ci -d tfcollins/hdl-ci:latest tail -f /dev/null
#docker exec temp-ci /bin/bash -c '/opt/MATLAB/R2023b/bin/matlab -nodesktop -nodisplay -nosplash -r "disp(matlabshared.supportpkg.setSupportPackageRoot( \"/HSPs/R2023b\"));exit(0);"'
#docker commit temp-ci tfcollins/hdl-ci:latest
#docker rm -f temp-ci

# Check
docker run -v /opt/MATLAB:/opt/MATLAB:ro tfcollins/hdl-ci:latest  /bin/bash -c '/opt/MATLAB/R2023b/bin/matlab -nodesktop -nodisplay -nosplash -r "disp(matlabshared.supportpkg.getSupportPackageRoot());pause(5);exit(0);"'
kill -9 $XVFB_PID || true

#umount mlhsp
