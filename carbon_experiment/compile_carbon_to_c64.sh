#!/bin/bash
# Carbon Language to C64 Compiler Script
# Compiles .carbon files directly to C64 .prg files

set -e

if [ $# -eq 0 ]; then
    echo "Usage: $0 <carbon_file.carbon> [output.prg]"
    echo "Example: $0 hello.carbon hello.prg"
    exit 1
fi

CARBON_FILE="$1"
OUTPUT_NAME="${2:-${CARBON_FILE%.carbon}.prg}"

echo "🎯 Carbon Language to C64 Compiler"
echo "=================================="
echo "📄 Input: $CARBON_FILE"
echo "💾 Output: $OUTPUT_NAME"
echo ""

# Check if Carbon file exists
if [ ! -f "$CARBON_FILE" ]; then
    echo "❌ Error: Carbon file '$CARBON_FILE' not found"
    exit 1
fi

echo "🔧 Step 1: Compiling Carbon to LLVM IR..."
docker run --platform linux/amd64 -v $(pwd):/work -w /work ubuntu:22.04 \
  ./carbon_toolchain-0.0.0-0.nightly.2025.01.22/bin/carbon compile \
  --dump-llvm-ir "$CARBON_FILE" > temp_full.ll 2>&1

if [ $? -ne 0 ]; then
    echo "❌ Carbon compilation failed:"
    cat temp_full.ll
    rm -f temp_full.ll
    exit 1
fi

echo "✅ Carbon compilation successful"

echo "🔧 Step 2: Extracting main function from LLVM IR..."
# Extract the main function and required declarations, removing debug metadata
awk '
    /^define.*_CMain\./ { 
        in_main=1; 
        gsub(/_CMain\.[^(]*/, "main"); 
        gsub(/ !dbg ![0-9]+/, ""); 
        print; 
        next 
    }
    in_main && /^}/ { print; in_main=0; next }
    in_main { 
        gsub(/, !dbg ![0-9]+/, ""); 
        print; 
        next 
    }
    /^declare.*@putchar/ { print; next }
    /^source_filename/ { print; next }
' temp_full.ll > temp_main.ll

echo "✅ Main function extracted"

echo "🔧 Step 3: Compiling LLVM IR to C64 binary..."
docker run --platform linux/amd64 -v $(pwd):/work -w /work ubuntu:22.04 \
  ./llvm-mos/bin/mos-c64-clang temp_main.ll -o "$OUTPUT_NAME" 2>&1

if [ $? -ne 0 ]; then
    echo "❌ C64 compilation failed"
    rm -f temp_full.ll temp_main.ll
    exit 1
fi

echo "✅ C64 compilation successful"

# Clean up temp files
rm -f temp_full.ll temp_main.ll

echo ""
echo "🎯 SUCCESS!"
echo "==========="
echo "📄 Carbon source: $CARBON_FILE"
echo "💾 C64 binary: $OUTPUT_NAME"
echo "📊 Size: $(stat -c%s "$OUTPUT_NAME") bytes"
echo "🔍 Type: $(file "$OUTPUT_NAME")"
echo ""
echo "🎮 To test in emulator:"
echo "   x64sc $OUTPUT_NAME"
echo ""
echo "🚀 Carbon Language successfully compiled to Commodore 64!"