#!/bin/bash


# 
# devsecfranklin@duck.com
# Dec 27 2022
#

sudo apt-get update
sudo apt-get install cmake gcc g++  libxml2 libxml2-* leveldb* git
sudo apt-get install python3-setuptools python3-dev

python3 -m textblob.download_corpora
python3 -m spacy.en.download all

function tensorFlow() {
  get https://github.com/samjabrahams/tensorflow-on-raspberry-pi/releases/download/v1.0.1/tensorflow-1.0.1...
  python3 -m pip install tensorflow-1.0.1-cp34-cp34m-linux_arm7l.whl
}

function py34() {
  python3 -m textblob.download_corpora
  python3 -m spacy.en.download all
  python3 -m pip uninstall mock
  python3 -m pip install mock
}

function paho_for_mqtt() {
  python3 -m pip install paho-mqtt 
}

function main() {
  git clone https://github.com/tensorflow/tensorflow.git
  tensorFlow
  py34
  paho_for_mqtt
}

main
