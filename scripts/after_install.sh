#!/usr/bin/env bash

# kill any servers that may be running in the background 
sudo pkill -f runserver

# kill frontend servers if you are deploying any frontend
# sudo pkill -f tailwind
# sudo pkill -f node

cd /home/ubuntu/django-aws_cicd/

# activate virtual environment with Python 3.12
python3.12 -m venv venv
source venv/bin/activate

# install requirements
pip install -r /home/ubuntu/django-aws_cicd/requirements.txt

# run server
screen -d -m python3.12 manage.py runserver 0:8000



