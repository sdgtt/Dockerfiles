#!/bin/bash
git clone -b 'master' --single-branch --depth 1 https://github.com/analogdevicesinc/libiio.git
cd libiio
cmake . -DHAVE_DNS_SD=OFF
make
sudo make install
cd ..
