# CPP North 2025 C64 Demo - Build Process

## Overview

This project creates Commodore 64 applications for the CPP North 2025 keynote, demonstrating both C and C++ code running on vintage 1982 hardware.

## Build Tools Included

### 1. **cc65 Cross-Compiler Suite**
- **Location**: `tools/cc65-master/`
- **Purpose**: Compiles C code to 6502 assembly for C64
- **Language**: C only (ANSI C compatible)
- **Output**: Highly optimized assembly code

### 2. **Oscar64 C++ Cross-Compiler**
- **Location**: `tools/oscar64/`
- **Purpose**: Compiles C++ code to 6502 assembly for C64
- **Language**: C++ with modern features (classes, templates, namespaces, RAII)
- **Output**: Optimized code ~25% smaller than cc65

## Build Process

### For C Versions (using cc65)
```bash
# Simple version
make cppnorth.prg

# Enhanced version with borders
make cppnorth_fixed.prg

# Professional version with PETSCII graphics
make cppnorth_deluxe.prg

# Build all C versions
make all
```

### For C++ Version (using Oscar64)
```bash
# Build C++ version with real C++ features
make -f Makefile.oscar64

# This creates: cppnorth_cpp.prg
```

## Step-by-Step Build Process

### 1. **Source Code Compilation**
```
Source File (.c/.cpp) → Intermediate Code → 6502 Assembly → Machine Code → PRG File
```

### 2. **C Build Process (cc65)**
```bash
# Example for cppnorth_deluxe.prg
cl65 -t c64 -O -m cppnorth_deluxe.map -o cppnorth_deluxe.prg c64_main_deluxe.c
```

**Steps:**
1. **Preprocessing**: Handle `#include` and `#define` directives
2. **Compilation**: Convert C to intermediate code
3. **Assembly**: Generate 6502 assembly language
4. **Linking**: Link with C64 runtime libraries
5. **Output**: Create `.prg` file ready for C64

### 3. **C++ Build Process (Oscar64)**
```bash
# Example for cppnorth_cpp.prg
tools/oscar64/build/oscar64 cpp_simple.cpp -O3 -n
```

**Steps:**
1. **C++ Parsing**: Parse classes, constructors, namespaces
2. **Object Model**: Handle virtual functions, inheritance
3. **Template Expansion**: Expand C++ templates
4. **Optimization**: Apply C++ specific optimizations
5. **Code Generation**: Generate optimized 6502 assembly
6. **Linking**: Link with Oscar64 C++ runtime
7. **Output**: Create `.prg` file with C++ features

## Build Artifacts

### Generated Files
- **`.prg`** - Commodore 64 program files (ready to run)
- **`.map`** - Memory map showing code layout
- **`.lbl`** - Label file for debugging
- **`.asm`** - Generated assembly code (Oscar64 only)

### File Sizes
- `cppnorth.prg` - 879 bytes (simple C)
- `cppnorth_fixed.prg` - 1,116 bytes (enhanced C)
- `cppnorth_deluxe.prg` - 1,398 bytes (professional C)
- `cppnorth_cpp.prg` - 5,833 bytes (C++ with full runtime)

## Running the Programs

### On VICE C64 Emulator
```bash
# Install VICE emulator
x64sc cppnorth_deluxe.prg
x64sc cppnorth_cpp.prg
```

### On Real Hardware
1. Transfer `.prg` files to C64 via:
   - SD2IEC device
   - 1541 Ultimate
   - Floppy disk
2. Load and run: `LOAD "FILENAME",8,1` then `RUN`

## Cross-Platform Compatibility

### Build Requirements
- **Linux/WSL**: cmake, build-essential, git
- **macOS**: Xcode command line tools
- **Windows**: Visual Studio or MinGW

### Installation Scripts
- `install_cc65.sh` - Builds cc65 from source
- `install_oscar64.sh` - Builds Oscar64 from source

## Technical Details

### Memory Layout (C64)
- **$0801-$9FFF**: Program memory (38KB)
- **$A000-$BFFF**: BASIC ROM (not used)
- **$C000-$CFFF**: RAM available
- **$D000-$DFFF**: I/O area (VIC, SID, CIA)

### Optimization Levels
- **cc65**: `-O` standard optimization
- **Oscar64**: `-O3` aggressive optimization, `-n` no line info

### Libraries Used
- **cc65**: `conio.h`, `c64.h` for hardware access
- **Oscar64**: `c64/vic.h`, `conio.h`, `stdio.h` for C++ features

## What Makes This Special

1. **Real C++ on C64**: Actual classes, constructors, destructors
2. **RAII Pattern**: Automatic resource management on 8-bit hardware
3. **Modern Toolchain**: Up-to-date compilers targeting vintage hardware
4. **Educational Value**: Shows evolution from C to C++
5. **Conference Demo**: Perfect for CPP North 2025 keynote

## Troubleshooting

### Common Issues
- **"oscar64 not found"**: Run `make -f Makefile.oscar64` from project root
- **"Permission denied"**: Make scripts executable with `chmod +x *.sh`
- **"cmake not found"**: Install cmake and build-essential

### Verification
```bash
# Check if PRG files are valid C64 programs
file *.prg
# Should show: "Commodore C64 program"

# Check file sizes
ls -la *.prg
```

## Future Enhancements

Potential additions:
- **Sound**: SID chip music and sound effects
- **Graphics**: Sprites and custom character sets
- **Input**: Joystick control
- **Disk I/O**: Save/load functionality
- **More C++ Features**: STL-like containers, exceptions

---

*This build system demonstrates that C++ has been powerful and versatile since the early days - capable of running on hardware from 1982 while providing modern programming paradigms!*