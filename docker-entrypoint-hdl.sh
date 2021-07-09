#!/bin/bash
set -e

# Copy read-only folder(s) into readable folder(s)
if [ -d "/mlhspro" ]; then
  echo "Adding HSP files"
  cp -r /mlhspro /mlhsp
else
  echo "/mlhsp folder does not exist"
fi

if [ -d "/root/.Xilinxro" ]; then
  echo "Adding Xilinx dot files"
  cp -r /root/.Xilinxro /root/.Xilinx
else
  echo ".Xilinxro folder does not exist"
fi

if [ -d "/root/.matlabro" ]; then
  echo "Adding MATLAB dot files"
  cp -r /root/.matlabro /root/.matlab
else
  echo ".matlabro folder does not exist"
fi
  
