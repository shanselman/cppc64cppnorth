# Makefile for C64 CPP North application

CC65 = cl65
TARGET = c64
CFLAGS = -t $(TARGET) -O
LDFLAGS = -t $(TARGET) -m cppnorth.map

SOURCES = c64_main.c
PROGRAM = cppnorth.prg
ENHANCED_SOURCES = c64_main_enhanced.c
ENHANCED_PROGRAM = cppnorth_enhanced.prg

all: $(PROGRAM) $(ENHANCED_PROGRAM)

$(PROGRAM): $(SOURCES)
	$(CC65) $(CFLAGS) $(LDFLAGS) -o $@ $(SOURCES)

$(ENHANCED_PROGRAM): $(ENHANCED_SOURCES)
	$(CC65) $(CFLAGS) -m cppnorth_enhanced.map -o $@ $(ENHANCED_SOURCES)

clean:
	rm -f *.o *.map $(PROGRAM) $(ENHANCED_PROGRAM)

run: $(PROGRAM)
	x64sc $(PROGRAM)

.PHONY: all clean run