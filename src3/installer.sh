#!/bin/bash

git clone --recurse-submodules https://github.com/google-coral/pycoral
scripts/build.sh
make wheel
pip3 install $(ls dist/*.whl)
#python3 -m pip install tflite-runtime
sudo apt install -y libedgetpu-dev python3-pycoral python3-tflite-runtime
