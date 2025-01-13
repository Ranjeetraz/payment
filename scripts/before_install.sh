#!/usr/bin/env bash

# Variables
PYTHON_VERSION="3.12.6"
REGION="ap-southeast-2"  # Update to your region

# Clean up old CodeDeploy files
sudo rm -rf /home/ubuntu/install

# Install CodeDeploy agent
sudo apt-get -y update
sudo apt-get -y install ruby wget
cd /home/ubuntu
wget https://aws-codedeploy-$REGION.s3.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto

# Update OS and install required dependencies
sudo apt-get -y update
sudo apt-get -y install build-essential zlib1g-dev libffi-dev libssl-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncurses5-dev libncursesw5-dev xz-utils tk-dev libgdbm-dev libc6-dev liblzma-dev

# Download and install Python
cd /usr/src
sudo wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
sudo tar xzf Python-$PYTHON_VERSION.tgz
cd Python-$PYTHON_VERSION
sudo ./configure --enable-optimizations
sudo make -j "$(nproc)"
sudo make altinstall

# Verify Python installation
python3.12 --version

# Install pip and virtualenv
python3.12 -m ensurepip --upgrade
python3.12 -m pip install --upgrade pip
python3.12 -m pip install virtualenv

# Clean up old app files (if needed)
sudo rm -rf /home/ubuntu/django-aws_cicd

echo "Setup completed successfully."
