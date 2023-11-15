#!/bin/bash
git clone https://github.com/analogdevicesinc/aditof_sdk.git
cd aditof_sdk
mkdir build && cd build
cmake -DWITH_EXAMPLES=on -DCMAKE_PREFIX_PATH="/opt/glog;/opt/protobuf;/opt/websockets" ..
make -j4
cd ../..