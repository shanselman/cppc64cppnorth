# Makefile for C64 CPP North application

CC65 = cl65
TARGET = c64
CFLAGS = -t $(TARGET) -O
LDFLAGS = -t $(TARGET) -m cppnorth.map

SOURCES = c64_main.c
PROGRAM = cppnorth.prg
DELUXE_SOURCES = c64_main_deluxe.c
DELUXE_PROGRAM = cppnorth_deluxe.prg

all: $(PROGRAM) $(DELUXE_PROGRAM)

$(PROGRAM): $(SOURCES)
	$(CC65) $(CFLAGS) $(LDFLAGS) -o $@ $(SOURCES)

$(DELUXE_PROGRAM): $(DELUXE_SOURCES)
	$(CC65) $(CFLAGS) -m cppnorth_deluxe.map -o $@ $(DELUXE_SOURCES)

clean:
	rm -f *.o *.map $(PROGRAM) $(DELUXE_PROGRAM)

run: $(PROGRAM)
	x64sc $(PROGRAM)

deluxe: $(DELUXE_PROGRAM)

run-deluxe: $(DELUXE_PROGRAM)
	x64sc $(DELUXE_PROGRAM)

.PHONY: all clean run deluxe run-deluxe