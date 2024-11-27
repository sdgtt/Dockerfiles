#!/bin/bash
#install pyewmh
git clone https://github.com/kimpaller/pyewmh.git
cd pyewmh
pip3 install .
cd ..

#install pyguit
git clone -b main https://github.com/sdgtt/gui-testing.git
cd gui-testing
pip3 install -r requirements_linux.txt
pip3 install .
cd ..