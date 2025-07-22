# CPP North C64 Demo

A collection of Commodore 64 applications for the CPP North 2025 keynote, featuring both C and C++ implementations that display a red maple leaf and the CPP North branding.

## Overview

This project demonstrates cross-compilation from modern systems to the Commodore 64, including:
- Traditional C programming with cc65
- Modern C++ programming with Oscar64 (featuring classes, RAII, and namespaces on 8-bit hardware)
- Professional graphics using reverse video blocks
- PETSCII character set handling

## Build Requirements

The repository is self-contained and includes all necessary build tools:
- `tools/cc65-master/` - cc65 compiler suite (C to 6502 assembly)
- `tools/oscar64-master/` - Oscar64 C++ compiler (C++ to 6502 assembly)
- VICE emulator (for testing) - install separately with `sudo apt install vice`

## Quick Start

1. Clone this repository:
```bash
git clone <repository-url>
cd cppc64cppnorth
```

2. Build all versions:
```bash
make all
```

3. Test all builds:
```bash
./test_build.sh
```

4. Run the C++ version:
```bash
make run-cpp
```

## Available Builds

The project creates three different PRG files showing progression from basic C to real C++:

1. **cppnorth.prg** - Basic C version with simple PETSCII maple leaf
2. **cppnorth_deluxe.prg** - Advanced C version with reverse video blocks and decorative frame
3. **cppnorth_cpp.prg** - Real C++ version with classes, RAII, and namespaces

## Build Instructions

### Build All Versions
```bash
make all
```

### Build Individual Versions
```bash
# C versions (using cc65)
make               # Basic version
make deluxe        # Advanced version

# C++ version (using Oscar64)
make cpp
```

### Run Individual Versions
```bash
make run           # Run basic C version
make run-deluxe    # Run advanced C version
make run-cpp       # Run C++ version
```

### Clean Build Files
```bash
make clean         # Clean build artifacts
make clean-tools   # Clean and rebuild toolchains
```

## Toolchain Setup

The toolchains are included and built automatically. To manually rebuild:

### cc65 (C Compiler)
```bash
./install_cc65.sh
```

### Oscar64 (C++ Compiler)
```bash
./install_oscar64.sh
```

## Technical Details

### C Versions (cc65)
- **Compiler**: cc65 (C to 6502 assembly)
- **Target**: Commodore 64 with 64KB memory
- **Features**: PETSCII graphics, color control, input handling
- **Size**: ~3KB compiled

### C++ Version (Oscar64)
- **Compiler**: Oscar64 (C++ to 6502 assembly)
- **Language**: Modern C++ with classes, RAII, namespaces
- **Features**: Object-oriented design on 8-bit hardware
- **Classes**: `Screen`, `MapleLeaf`, `Frame`, `Conference`
- **Memory Management**: RAII for automatic cleanup
- **Size**: ~4KB compiled

### Memory Layout
All versions target the standard C64 memory layout:
- **Load Address**: $0801 (2049 decimal)
- **Program Space**: $0801-$CFFF
- **Code Size**: ~3-4KB per program

## File Structure

```
cppc64cppnorth/
├── c64_main.c              # Basic C version
├── c64_main_deluxe.c       # Advanced C version  
├── cpp_simple.cpp          # Real C++ version
├── Makefile                # cc65 build configuration
├── Makefile.oscar64        # Oscar64 build configuration
├── install_cc65.sh         # cc65 toolchain installer
├── install_oscar64.sh      # Oscar64 toolchain installer
├── test_build.sh           # Automated build tester
├── *.prg                   # Compiled C64 programs
├── *.map                   # Linker maps
└── tools/                  # Build toolchains
    ├── cc65-master/        # cc65 compiler suite
    └── oscar64-master/     # Oscar64 C++ compiler
```

## Development Notes

### C++ on Commodore 64
This project demonstrates that modern C++ features can run on 8-bit hardware:
- **RAII**: Automatic resource management with constructors/destructors
- **Classes**: Object-oriented programming on the 6502 processor
- **Namespaces**: Code organization and scoping
- **Composition**: Building complex objects from simpler ones

### Cross-Platform Development
- Modern development environment (Linux/macOS/Windows)
- Cross-compilation to 6502 assembly
- Testing on VICE emulator
- Professional CI/CD compatible build system

## Troubleshooting

### Build Issues
- Ensure you have build-essential installed: `sudo apt install build-essential`
- For permission issues: `chmod +x *.sh`
- For missing dependencies: `sudo apt install git make`

### VICE Emulator
- Install: `sudo apt install vice`
- Alternative: Download from [VICE website](https://vice-emu.sourceforge.io/)

### Testing
Use the automated test script to verify all builds:
```bash
./test_build.sh
```

## License

This project is created for educational purposes demonstrating C and C++ cross-compilation to vintage hardware.