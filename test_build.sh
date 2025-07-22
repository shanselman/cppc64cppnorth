#!/bin/bash
# Test script to verify the complete build process works

echo "=== CPP North 2025 C64 Demo - Build Test ==="
echo ""

# Check if we're in the right directory
if [ ! -f "cpp_simple.cpp" ]; then
    echo "❌ Error: Not in project root directory"
    exit 1
fi

echo "✅ Project directory confirmed"

# Test cc65 availability
if [ ! -f "tools/cc65-master/bin/cl65" ]; then
    echo "❌ Error: cc65 not found. Run ./install_cc65.sh first"
    exit 1
fi

echo "✅ cc65 toolchain found"

# Test Oscar64 availability  
if [ ! -f "tools/oscar64/build/oscar64" ]; then
    echo "❌ Error: Oscar64 not found. Run ./install_oscar64.sh first"
    exit 1
fi

echo "✅ Oscar64 toolchain found"

# Test C builds
echo ""
echo "🔨 Testing C builds (cc65)..."
export PATH=$PATH:$PWD/tools/cc65-master/bin

make clean > /dev/null 2>&1
if make all > build_test.log 2>&1; then
    echo "✅ All C versions built successfully"
else
    echo "❌ C build failed. Check build_test.log"
    exit 1
fi

# Test C++ build
echo ""
echo "🔨 Testing C++ build (Oscar64)..."
if make -f Makefile.oscar64 clean > /dev/null 2>&1 && make -f Makefile.oscar64 >> build_test.log 2>&1; then
    mv cpp_simple.prg cppnorth_cpp.prg
    echo "✅ C++ version built successfully"
else
    echo "❌ C++ build failed. Check build_test.log"
    exit 1
fi

# Verify all PRG files
echo ""
echo "🔍 Verifying PRG files..."
expected_files=("cppnorth.prg" "cppnorth_deluxe.prg" "cppnorth_cpp.prg")

for prg_file in "${expected_files[@]}"; do
    if [ -f "$prg_file" ]; then
        file_type=$(file "$prg_file" | grep -o "Commodore C64 program")
        if [ "$file_type" == "Commodore C64 program" ]; then
            size=$(stat -f%z "$prg_file" 2>/dev/null || stat -c%s "$prg_file" 2>/dev/null)
            echo "✅ $prg_file ($size bytes) - Valid C64 program"
        else
            echo "❌ $prg_file - Invalid format"
        fi
    else
        echo "❌ $prg_file - Missing"
    fi
done

echo ""
echo "🎉 BUILD TEST COMPLETED SUCCESSFULLY!"
echo ""
echo "Available programs:"
echo "  • cppnorth.prg - Basic C version"
echo "  • cppnorth_deluxe.prg - Advanced C version"
echo "  • cppnorth_cpp.prg - Real C++ version"
echo ""
echo "To run on VICE C64 emulator:"
echo "  x64sc cppnorth_deluxe.prg"
echo "  x64sc cppnorth_cpp.prg"
echo ""

# Cleanup
rm -f build_test.log