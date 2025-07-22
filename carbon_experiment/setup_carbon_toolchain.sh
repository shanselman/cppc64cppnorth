#!/bin/bash
# Carbon Language to C64 Toolchain Setup Script
# Downloads and installs Carbon compiler and LLVM-MOS for C64 development

set -e

echo "🎯 Carbon Language to C64 Toolchain Setup"
echo "========================================="
echo ""

# Check if Docker is available
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is required but not installed."
    echo "Please install Docker first: https://docs.docker.com/get-docker/"
    exit 1
fi

echo "✅ Docker found"

# Check if we're on ARM (Apple Silicon, etc.)
ARCH=$(uname -m)
if [[ "$ARCH" == "arm64" || "$ARCH" == "aarch64" ]]; then
    echo "🔧 ARM architecture detected - will use x86-64 emulation"
    PLATFORM_FLAG="--platform linux/amd64"
else
    echo "🔧 x86-64 architecture detected"
    PLATFORM_FLAG=""
fi

echo ""
echo "📦 Step 1: Setting up Ubuntu container with toolchains..."

# Create a persistent container setup script
cat > setup_container.sh << 'EOF'
#!/bin/bash
set -e

echo "🔧 Installing system dependencies..."
apt-get update
apt-get install -y wget curl build-essential

echo "🔧 Downloading Carbon compiler..."
if [ ! -d "/work/carbon_toolchain-0.0.0-0.nightly.2025.01.22" ]; then
    cd /work
    wget -q https://github.com/carbon-language/carbon-lang/releases/download/nightly-2025.01.22/carbon_toolchain-0.0.0-0.nightly.2025.01.22-linux-amd64.tar.gz
    tar -xzf carbon_toolchain-0.0.0-0.nightly.2025.01.22-linux-amd64.tar.gz
    rm carbon_toolchain-0.0.0-0.nightly.2025.01.22-linux-amd64.tar.gz
    echo "✅ Carbon compiler installed"
else
    echo "✅ Carbon compiler already present"
fi

echo "🔧 Downloading LLVM-MOS compiler..."
if [ ! -d "/work/llvm-mos" ]; then
    cd /work
    wget -q https://github.com/llvm-mos/llvm-mos/releases/download/llvm-mos-linux-main-20250117-f598b09/llvm-mos-linux-main-20250117-f598b09.tar.xz
    tar -xf llvm-mos-linux-main-20250117-f598b09.tar.xz
    mv llvm-mos-linux-main-20250117-f598b09 llvm-mos
    rm llvm-mos-linux-main-20250117-f598b09.tar.xz
    echo "✅ LLVM-MOS compiler installed"
else
    echo "✅ LLVM-MOS compiler already present"
fi

echo "🔧 Testing Carbon compiler..."
./carbon_toolchain-0.0.0-0.nightly.2025.01.22/bin/carbon --version

echo "🔧 Testing LLVM-MOS compiler..."
./llvm-mos/bin/mos-c64-clang --version

echo ""
echo "🎯 Toolchain setup complete!"
echo "=========================="
echo "📁 Carbon: /work/carbon_toolchain-0.0.0-0.nightly.2025.01.22/"
echo "📁 LLVM-MOS: /work/llvm-mos/"
EOF

chmod +x setup_container.sh

# Run the setup in Docker
echo "🔧 Running toolchain setup in Docker container..."
docker run $PLATFORM_FLAG --rm -v $(pwd):/work -w /work ubuntu:22.04 ./setup_container.sh

# Clean up the setup script
rm setup_container.sh

echo ""
echo "✅ Toolchain setup successful!"
echo ""
echo "🎯 What was installed:"
echo "====================="
echo "📦 Carbon Language Compiler (nightly 2025.01.22)"
echo "📦 LLVM-MOS C64 Compiler (main 2025.01.17)"
echo "🐳 Everything runs in Docker containers"
echo ""
echo "🚀 You can now compile Carbon to C64:"
echo "   ./compile_carbon_to_c64.sh your_program.carbon"
echo ""
echo "📄 The toolchains are stored locally and will persist between runs"
echo "💡 No internet required after initial setup (unless you delete the toolchain folders)"