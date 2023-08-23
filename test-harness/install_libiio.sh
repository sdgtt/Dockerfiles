#!/bin/bash
git clone -b 'v0.25' --single-branch --depth 1 https://github.com/analogdevicesinc/libiio.git
cd libiio
mkdir build
cd build
cmake .. -DPYTHON_BINDINGS=ON -DWITH_SERIAL_BACKEND=ON -DHAVE_DNS_SD=OFF
make
sudo make install
ldconfig
cd bindings/python
python3 setup.py install