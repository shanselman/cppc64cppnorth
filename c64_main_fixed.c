// Fixed C64 version with better maple leaf
// This will be compiled with cc65

#include <conio.h>
#include <c64.h>
#include <string.h>

// PETSCII codes for graphics
#define PETSCII_BALL 0x51      // Filled circle character
#define PETSCII_DIAMOND 0x5A   // Diamond shape
#define PETSCII_HEART 0x53     // Heart shape
#define PETSCII_CLUB 0x58      // Club shape

// Draw a maple leaf using PETSCII block graphics
void draw_maple_leaf(unsigned char x, unsigned char y) {
    textcolor(COLOR_RED);
    
    // Row 1 - tip
    gotoxy(x+4, y);
    cputc('*');
    
    // Row 2
    gotoxy(x+3, y+1);
    cputs("***");
    
    // Row 3
    gotoxy(x+2, y+2);
    cputc('*');
    gotoxy(x+4, y+2);
    cputc('*');
    gotoxy(x+6, y+2);
    cputc('*');
    
    // Row 4 - widest part
    gotoxy(x, y+3);
    cputs("*********");
    
    // Row 5
    gotoxy(x+1, y+4);
    cputs("*******");
    
    // Row 6
    gotoxy(x+2, y+5);
    cputs("*****");
    
    // Row 7
    gotoxy(x+3, y+6);
    cputs("***");
    
    // Row 8 - stem
    gotoxy(x+4, y+7);
    cputc('|');
    gotoxy(x+4, y+8);
    cputc('|');
}

void main(void) {
    // Clear screen with white background
    bordercolor(COLOR_WHITE);
    bgcolor(COLOR_WHITE);
    clrscr();
    
    // Draw maple leaf
    draw_maple_leaf(16, 4);
    
    // Draw CPP NORTH text with proper spacing
    gotoxy(13, 15);
    textcolor(COLOR_RED);
    cputs("C P P");
    
    gotoxy(19, 15);
    textcolor(COLOR_BLACK);
    cputs("   N O R T H");
    
    // Add decorative border
    textcolor(COLOR_RED);
    
    // Top border
    gotoxy(10, 2);
    cputs("********************");
    
    // Bottom border
    gotoxy(10, 18);
    cputs("********************");
    
    // Subtitle
    gotoxy(9, 20);
    textcolor(COLOR_GRAY2);
    cputs("Canadian C++ Conference");
    
    // Footer
    gotoxy(8, 23);
    textcolor(COLOR_BLACK);
    cputs("Press any key to exit...");
    
    // Wait for keypress
    cgetc();
}