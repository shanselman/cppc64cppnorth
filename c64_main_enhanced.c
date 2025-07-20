// Enhanced C64 version with better maple leaf
// This will be compiled with cc65

#include <conio.h>
#include <c64.h>
#include <string.h>
#include <peekpoke.h>

// Screen memory locations
#define SCREEN_RAM  0x0400
#define COLOR_RAM   0xD800

// Custom character data for maple leaf (8x8 pixels each)
// We'll use characters 64-67 (@ A B C) to create a 2x2 maple leaf
unsigned char maple_leaf_chars[4][8] = {
    // Top-left (char 64)
    {
        0b00001000,
        0b00011100,
        0b00111110,
        0b01111111,
        0b11111111,
        0b11111111,
        0b11111111,
        0b01111111
    },
    // Top-right (char 65)
    {
        0b00010000,
        0b00111000,
        0b01111100,
        0b11111110,
        0b11111111,
        0b11111111,
        0b11111111,
        0b11111110
    },
    // Bottom-left (char 66)
    {
        0b00111110,
        0b00011100,
        0b00001000,
        0b00001000,
        0b00001000,
        0b00000000,
        0b00000000,
        0b00000000
    },
    // Bottom-right (char 67)
    {
        0b01111100,
        0b00111000,
        0b00010000,
        0b00010000,
        0b00010000,
        0b00000000,
        0b00000000,
        0b00000000
    }
};

void setup_custom_chars(void) {
    unsigned char i, j;
    unsigned int char_base = 0x3000; // Custom character set location
    
    // Copy character ROM to RAM
    POKE(0x01, PEEK(0x01) & 0xFB); // Enable character ROM
    
    // Copy standard charset
    for (i = 0; i < 128; ++i) {
        for (j = 0; j < 8; ++j) {
            POKE(char_base + i*8 + j, PEEK(0xD000 + i*8 + j));
        }
    }
    
    // Add our custom maple leaf characters
    for (i = 0; i < 4; ++i) {
        for (j = 0; j < 8; ++j) {
            POKE(char_base + (64+i)*8 + j, maple_leaf_chars[i][j]);
        }
    }
    
    POKE(0x01, PEEK(0x01) | 0x04); // Disable character ROM
    
    // Point to our custom character set
    POKE(0xD018, (PEEK(0xD018) & 0xF1) | 0x0C);
}

void draw_big_maple_leaf(unsigned char x, unsigned char y) {
    unsigned int pos;
    
    // Draw the 2x2 maple leaf
    pos = y * 40 + x;
    POKE(SCREEN_RAM + pos, 64);     // Top-left
    POKE(COLOR_RAM + pos, COLOR_RED);
    
    POKE(SCREEN_RAM + pos + 1, 65); // Top-right
    POKE(COLOR_RAM + pos + 1, COLOR_RED);
    
    pos += 40; // Next row
    POKE(SCREEN_RAM + pos, 66);     // Bottom-left
    POKE(COLOR_RAM + pos, COLOR_RED);
    
    POKE(SCREEN_RAM + pos + 1, 67); // Bottom-right
    POKE(COLOR_RAM + pos + 1, COLOR_RED);
}

void main(void) {
    // Setup custom characters
    setup_custom_chars();
    
    // Clear screen with white background
    clrscr();
    bordercolor(COLOR_WHITE);
    bgcolor(COLOR_WHITE);
    
    // Draw large maple leaf
    draw_big_maple_leaf(19, 8);
    
    // Draw CPP NORTH text
    gotoxy(15, 12);
    textcolor(COLOR_RED);
    cputs("C P P");
    
    textcolor(COLOR_BLACK);
    cputs("  N O R T H");
    
    // Add subtitle
    gotoxy(12, 14);
    textcolor(COLOR_GRAY2);
    cputs("Canadian C++ Conference");
    
    // Footer
    gotoxy(0, 24);
    textcolor(COLOR_BLACK);
    cputs("Press any key to exit...");
    
    // Wait for keypress
    cgetc();
    
    // Reset to default charset before exit
    POKE(0xD018, PEEK(0xD018) & 0xF1);
}