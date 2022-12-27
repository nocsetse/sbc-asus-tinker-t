#!/bin/bash

# devsecfranklin@duck.com

sudo apt-get update
sudo apt-get install cmake gcc g++  libxml2 libxml2-* leveldb*
sudo apt-get install python3-setuptools python3-dev

#import nltk
#nltk.download()
#quit()
#sudo python -m textblob.download_corpora


function tensorFlow() {
  get https://github.com/samjabrahams/tensorflow-on-raspberry-pi/releases/download/v1.0.1/tensorflow-1.0.1...
    sudo pip3 install tensorflow-1.0.1-cp34-cp34m-linux_arm7l.whl
}

function py27 () {
sudo pip uninstall mock
sudo pip install mock
}


function py34() {
sudo pip3 uninstall mock
sudo pip3 install mock
sudo apt-get install git
git clone https://github.com/tensorflow/tensorflow.git
}

function paho_for_mqtt() {
pip install paho-mqtt 
}

function main() {
  tensorFlow
  py34
  paho_for_mqtt
}

main
