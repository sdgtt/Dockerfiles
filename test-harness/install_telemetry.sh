#!/bin/bash
git clone -b 'master' --single-branch --depth 1 https://github.com/sdgtt/telemetry.git
cd telemetry
pip3 install -r requirements.txt
pip3 install .
cd ..