#!/bin/bash
set -x
uname -a
DEBIAN_FRONTEND=noninteractive apt update
DEBIAN_FRONTEND=noninteractive apt -y upgrade
DEBIAN_FRONTEND=noninteractive apt install -y git sudo wget libssl-dev
DEBIAN_FRONTEND=noninteractive apt install -y bison flex cmake git build-essential libxml2-dev doxygen
DEBIAN_FRONTEND=noninteractive apt install -y libaio-dev libusb-1.0-0-dev
DEBIAN_FRONTEND=noninteractive apt install -y libserialport-dev libavahi-client-dev
DEBIAN_FRONTEND=noninteractive apt install -y python3 python3-sphinx python3-setuptools

# If armv7l install cmake from source
if [ "$(uname -m)" == "armv7l" ]; then
    DEBIAN_FRONTEND=noninteractive apt remove -y cmake
    wget --no-check-certificate https://github.com/Kitware/CMake/releases/download/v3.23.2/cmake-3.23.2.tar.gz
    tar xf cmake-3.23.2.tar.gz
    cd cmake-3.23.2
    ./bootstrap
    make -j
    make install
    ldconfig
fi
