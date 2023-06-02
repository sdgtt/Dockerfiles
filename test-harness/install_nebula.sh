#!/bin/bash
git clone -b 'master' --single-branch --depth 1 https://github.com/sdgtt/nebula.git
cd nebula
pip3 install -r requirements.txt
python3 setup.py install
cd ..