#!/bin/bash
wget --timeout=5 https://raw.githubusercontent.com/analogdevicesinc/pyadi-iio/main/requirements.txt
wget --timeout=5 https://raw.githubusercontent.com/analogdevicesinc/pyadi-iio/main/requirements_dev.txt
pip3 install -r requirements.txt
pip3 install -r requirements_dev.txt