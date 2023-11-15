#!/bin/bash
#install glog v0.3.5
git clone --branch v0.3.5 --depth 1 https://github.com/google/glog
cd glog
mkdir build && cd build
cmake .. -DWITH_GFLAGS=off -DCMAKE_INSTALL_PREFIX=/opt/glog
make -j4 && make install
cd ../..

#install protobuf v3.9.0
git clone --branch v3.9.0 --depth 1 https://github.com/protocolbuffers/protobuf
cd protobuf
mkdir build && cd build
cmake ../cmake/ -Dprotobuf_BUILD_TESTS=OFF -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DCMAKE_INSTALL_PREFIX=/opt/protobuf
make -j4 && make install
cd ../..

#install libwebsockets v3.2.3
git clone --branch v3.2.3 --depth 1 https://github.com/warmcat/libwebsockets
cd libwebsockets
mkdir build && cd build
cmake .. -DLWS_STATIC_PIC=ON -DCMAKE_INSTALL_PREFIX=/opt/libwebsockets
make -j4 && make install
cd ../..

