#!/usr/bin/env bash

# clean codedeploy-agent files for a fresh install
sudo rm -rf /home/ubuntu/install

# install CodeDeploy agent
sudo apt-get -y update
sudo apt-get -y install ruby
sudo apt-get -y install wget
cd /home/ubuntu
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
sudo chmod +x ./install 
sudo ./install auto

# update os & install Python 3.12.6
sudo apt-get update
sudo apt-get install -y python3.12 python3.12-dev python3.12-pip python3.12-venv

# upgrade virtualenv for Python 3.12
python3.12 -m pip install --user --upgrade virtualenv

# delete app
sudo rm -rf /home/ubuntu/django-aws_cicd
