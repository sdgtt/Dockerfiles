#!/bin/bash
set -xe

# Create tmp HSP folder
rm -rf /scratch/HSPs
cp -r /opt/MATLAB/HSPs /scratch/
ls /scratch/HSPs

# Build cores
export DISPLAY_ID=:$(shuf -i 10-1000 -n 1)
Xvfb $DISPLAY_ID &
XVFB_PID=$!
export DISPLAY=$DISPLAY_ID
/opt/MATLAB/$1/bin/matlab -nodesktop -nodisplay -nosplash -r "matlabshared.supportpkg.setSupportPackageRoot('/scratch/HSPs/${1}/');exit(0);"
/opt/MATLAB/$1/bin/matlab -nodesktop -nodisplay -nosplash -r "hdlsetuptoolpath('ToolName','Xilinx Vivado','ToolPath','/opt/Xilinx/Vivado/${2}/bin/vivado');setupzynqradiorepositories();exit(0);"
kill -9 $XVFB_PID || true

# Build container
#mkdir -p mlhsp
#mount --bind /mlhsp mlhsp

cp -r /home/tcollins/.matlab .
cp -r /scratch/HSPs .

docker build -f Dockerfile-ml -t tfcollins/hdl-ci:latest .
docker run -it tfcollins/hdl-ci:latest  /bin/bash -c '/opt/MATLAB/${1}/bin/matlab -nodesktop -nodisplay -nosplash -r "disp(matlabshared.supportpkg.getSupportPackageRoot());exit(0);"'


#umount mlhsp
