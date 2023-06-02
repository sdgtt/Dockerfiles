#!/bin/bash
git clone -b 'master' --single-branch --depth 1 https://github.com/sdgtt/telemetry.git
cd telemetry
pip install -r requirements.txt
python setup.py install
cd ..