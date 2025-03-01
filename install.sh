#!/bin/bash

# Create a virtual environment in the 'venv' directory
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Ensure the virtual environment is deactivated upon script exit
trap "deactivate" EXIT

# Upgrade pip and install required packages
pip install --upgrade pip
pip install -r requirements.txt

# Define the alias
ALIAS="testscript='source $(pwd)/venv/bin/activate && python3 $(pwd)/main.py'"

# Check if the alias already exists in ~/.bash_profile
if ! grep -Fxq "$ALIAS" ~/.bash_profile; then
    # Add alias to ~/.bash_profile
    echo "$ALIAS" >> ~/.bash_profile
fi

# Reload the profile to apply the changes
source ~/.bash_profile