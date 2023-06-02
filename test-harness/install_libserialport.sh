#!/bin/bash 
git clone -b 'master' --single-branch --depth 1 https://github.com/sigrokproject/libserialport.git
cd libserialport
./autogen.sh
./configure --prefix=/usr/sp
make
make install
cp -r /usr/sp/lib/* /usr/lib/x86_64-linux-gnu/
cp /usr/sp/include/* /usr/include/
cd ..