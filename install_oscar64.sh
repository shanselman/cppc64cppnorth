#!/bin/bash
# Script to download and install Oscar64 C++ compiler

echo "Installing Oscar64 C++ compiler for C64..."

# Create tools directory if it doesn't exist
mkdir -p tools
cd tools

# Clone Oscar64 repository
echo "Cloning Oscar64 repository..."
git clone https://github.com/drmortalwombat/oscar64.git

cd oscar64

# Build Oscar64
echo "Building Oscar64..."
mkdir -p build
cd build
cmake ..
make -j4
cd ..

# Add to PATH
echo "Adding Oscar64 to PATH..."
export OSCAR64_HOME=$(pwd)
echo "export PATH=\$PATH:$OSCAR64_HOME/bin" >> ~/.bashrc

echo "Oscar64 installed successfully!"
echo "Please run: source ~/.bashrc"