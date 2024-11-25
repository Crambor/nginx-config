#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <site-directory>"
    exit 1
fi

INPUT_DIR="$1"
if [ ! -d "$INPUT_DIR" ]; then
    echo "Error: Directory '$INPUT_DIR' does not exist."
    exit 1
fi

git pull

echo "Copying 'defaults' to /etc/nginx/..."
sudo cp -r defaults/* /etc/nginx/

echo "Copying '$INPUT_DIR' to /etc/nginx/..."
sudo cp -r "$INPUT_DIR"/* /etc/nginx/

echo "Sync complete."
