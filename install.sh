#!/bin/bash

# Build the Docker image
docker build -t script1 . || { echo "Docker build failed"; exit 1; }

# Define the alias string
ALIAS="alias testscript='docker run --rm -v .:/app/data script1'"

# Check if the alias already exists in the current session
if alias testscript >/dev/null 2>&1; then
    echo "Alias 'testscript' already exists in the current session."
    exit 1  # Or exit 0 if this isn’t an error
fi

# Check if the alias is already in ~/.bash_profile to avoid duplicates
if ! grep -q "alias testscript=" ~/.bash_profile; then
    echo "$ALIAS" >> ~/.bash_profile
    echo "Added alias to ~/.bash_profile."
else
    echo "Alias 'testscript' already exists in ~/.bash_profile."
fi

# Source the profile to apply the alias to the current session
source ~/.bash_profile
echo "Alias 'testscript' is now available."
