git clone https://github.com/libusb/hidapi.git ~/.mcuflash/hidapi &&
pushd ~/.mcuflash/hidapi &&
./bootstrap &&
./configure &&
make SHELL='sh' -j$HALF_CORES &&
sudo -S make install &&
sudo -S ldconfig &&
popd

git clone --recursive -b 0.12.0-1.0.0 https://github.com/analogdevicesinc/openocd.git ~/.mcuflash/maxim/openocd &&
pushd ~/.mcuflash/maxim/openocd &&
./bootstrap &&
./configure --enable-cmsis-dap &&
make SHELL='sh' -j$HALF_CORES &&
popd