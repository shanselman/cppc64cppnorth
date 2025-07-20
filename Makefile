# Makefile for C64 CPP North application

CC65 = cl65
TARGET = c64
CFLAGS = -t $(TARGET) -O
LDFLAGS = -t $(TARGET) -m cppnorth.map

SOURCES = c64_main.c
PROGRAM = cppnorth.prg
ENHANCED_SOURCES = c64_main_enhanced.c
ENHANCED_PROGRAM = cppnorth_enhanced.prg
FIXED_SOURCES = c64_main_fixed.c
FIXED_PROGRAM = cppnorth_fixed.prg
DELUXE_SOURCES = c64_main_deluxe.c
DELUXE_PROGRAM = cppnorth_deluxe.prg

all: $(PROGRAM) $(FIXED_PROGRAM) $(DELUXE_PROGRAM)

$(PROGRAM): $(SOURCES)
	$(CC65) $(CFLAGS) $(LDFLAGS) -o $@ $(SOURCES)

$(ENHANCED_PROGRAM): $(ENHANCED_SOURCES)
	$(CC65) $(CFLAGS) -m cppnorth_enhanced.map -o $@ $(ENHANCED_SOURCES)

$(FIXED_PROGRAM): $(FIXED_SOURCES)
	$(CC65) $(CFLAGS) -m cppnorth_fixed.map -o $@ $(FIXED_SOURCES)

$(DELUXE_PROGRAM): $(DELUXE_SOURCES)
	$(CC65) $(CFLAGS) -m cppnorth_deluxe.map -o $@ $(DELUXE_SOURCES)

clean:
	rm -f *.o *.map $(PROGRAM) $(ENHANCED_PROGRAM) $(FIXED_PROGRAM) $(DELUXE_PROGRAM)

run: $(PROGRAM)
	x64sc $(PROGRAM)

.PHONY: all clean run