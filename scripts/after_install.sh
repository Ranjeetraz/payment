#!/usr/bin/env bash

# Kill any running Django development servers
sudo pkill -f runserver

# Kill frontend servers if deploying any (uncomment if necessary)
# sudo pkill -f tailwind
# sudo pkill -f node

cd /home/ubuntu/django-aws_cicd/

# Check if virtual environment exists, create if it doesn't
if [ ! -d "venv" ]; then
  echo "Creating virtual environment..."
  python3.12 -m venv venv
else
  echo "Virtual environment already exists."
fi

# Activate virtual environment
source venv/bin/activate

# Install dependencies from requirements.txt
echo "Installing dependencies..."
pip install -r /home/ubuntu/django-aws_cicd/requirements.txt

# Run the Django development server in the background using screen
echo "Running the server..."
screen -d -m python3 manage.py runserver 0:8000


