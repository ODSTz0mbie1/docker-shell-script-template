#!/bin/bash

docker build -t script1 .

ALIAS="testscript='docker run -v $(pwd):/app/data -w /app/data script1'"
if bash -c "alias" | grep "$ALIAS"; then
    echo "Alias already exists"
    source ~/.bash_profile
    exit 1
fi
echo "alias $ALIAS" >> ~/.bash_profile
source ~/.bash_profile