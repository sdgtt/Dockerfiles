#!/bin/bash
git clone -b 'main' --single-branch --depth 1 https://github.com/analogdevicesinc/pyadi-iio.git
cd pyadi-iio
pip3 install -r requirements.txt
pip3 install -r requirements_dev.txt
cd ..