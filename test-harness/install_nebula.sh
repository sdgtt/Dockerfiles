#!/bin/bash
git clone -b 'master' --single-branch --depth 1 https://github.com/sdgtt/nebula.git
cd nebula
pip install -r requirements.txt -y
python setup.py install
cd ..