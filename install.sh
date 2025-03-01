#!/bin/bash

# Define the alias
ALIAS="alias pytest='/usr/bin/python3 $(pwd)/main.py'"

# Check if the alias already exists in ~/.bash_profile
if ! grep -Fxq "$ALIAS" ~/.bash_profile; then
    # Add alias to ~/.bash_profile
    echo "$ALIAS" >> ~/.bash_profile
fi

# Reload the profile to apply the changes
source ~/.bash_profile
