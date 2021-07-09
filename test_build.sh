#/bin/bash

git clone https://github.com/analogdevicesinc/libiio.git
cd libiio
git checkout tags/v0.21
mkdir build
cd build
cmake ..
make
make install
ldconfig
cd ../..
iio_info -s
