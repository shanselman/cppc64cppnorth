#!/bin/bash
# Script to download and install cc65

echo "Installing cc65..."

# Create a tools directory
mkdir -p tools
cd tools

# Download cc65 (using the snapshot version)
wget https://github.com/cc65/cc65/archive/refs/heads/master.zip -O cc65-master.zip
unzip cc65-master.zip
cd cc65-master

# Build cc65
make -j4

# Add to PATH
echo "export PATH=\$PATH:$(pwd)/bin" >> ~/.bashrc

echo "cc65 installed successfully!"
echo "Please run: source ~/.bashrc"