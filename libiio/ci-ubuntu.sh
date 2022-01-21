#!/bin/bash
set -x
uname -a
DEBIAN_FRONTEND=noninteractive apt update
DEBIAN_FRONTEND=noninteractive apt -y upgrade
DEBIAN_FRONTEND=noninteractive apt install -y bison flex cmake git build-essential libxml2-dev doxygen
DEBIAN_FRONTEND=noninteractive apt install -y libaio-dev libusb-1.0-0-dev
DEBIAN_FRONTEND=noninteractive apt install -y libserialport-dev libavahi-client-dev
DEBIAN_FRONTEND=noninteractive apt install -y python3 python3-sphinx python3-setuptools
