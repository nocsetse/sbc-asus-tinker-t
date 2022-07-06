if [ ! -f "/etc/apt/sources.list.d/multistrap-edgetpu.list" ]; then
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | sudo tee /etc/apt/sources.list.d/coral-edgetpu.list
fi

sudo apt-get update
sudo apt-get install edgetpu-compiler python3-dev python3-venv python3-scipy python3-pycoral \
  libblas3 liblapack3 liblapack-dev libblas-dev gfortran libatlas-base-dev 
