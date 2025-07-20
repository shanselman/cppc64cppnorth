# Makefile for C64 CPP North application

CC65 = cl65
TARGET = c64
CFLAGS = -t $(TARGET) -O
LDFLAGS = -t $(TARGET) -m cppnorth.map

SOURCES = c64_main.c
PROGRAM = cppnorth.prg

all: $(PROGRAM)

$(PROGRAM): $(SOURCES)
	$(CC65) $(CFLAGS) $(LDFLAGS) -o $@ $(SOURCES)

clean:
	rm -f *.o *.map $(PROGRAM)

run: $(PROGRAM)
	x64sc $(PROGRAM)

.PHONY: all clean run