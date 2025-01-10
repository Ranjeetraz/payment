#!/usr/bin/env bash

# Clean CodeDeploy-agent files for a fresh install
sudo rm -rf /home/ubuntu/install

# Install CodeDeploy agent
sudo apt-get -y update
sudo apt-get -y install ruby
sudo apt-get -y install wget
cd /home/ubuntu
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
sudo chmod +x ./install 
sudo ./install auto

# Update OS and dependencies
sudo apt-get -y update
sudo apt-get -y upgrade

# Install prerequisites for Python build
sudo apt-get install -y build-essential zlib1g-dev libffi-dev libssl-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncurses5-dev libncursesw5-dev xz-utils tk-dev libgdbm-dev libc6-dev liblzma-dev

# Download and install Python 3.12.6
PYTHON_VERSION="3.12.6"
cd /usr/src
sudo wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
sudo tar xzf Python-$PYTHON_VERSION.tgz
cd Python-$PYTHON_VERSION
sudo ./configure --enable-optimizations
sudo make -j "$(nproc)"
sudo make altinstall

# Verify Python installation
python3.12 --version

# Install pip and virtualenv for Python 3.12
python3.12 -m ensurepip --upgrade
python3.12 -m pip install --upgrade pip
python3.12 -m pip install --user --upgrade virtualenv

# Delete previous app files
sudo rm -rf /home/ubuntu/django-aws_cicd
