#!/bin/bash
git clone -b 'main' --single-branch --depth 1 https://github.com/sdgtt/nebula.git
cd nebula
pip3 install -r requirements.txt
pip3 install .
cd ..