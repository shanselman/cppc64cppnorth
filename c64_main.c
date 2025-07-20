// C64 version of our CPP North application
// This will be compiled with cc65

#include <conio.h>
#include <c64.h>
#include <string.h>

// PETSCII codes for drawing
#define PETSCII_RED 28
#define PETSCII_BLACK 144
#define PETSCII_CLEAR 147

// Simple maple leaf using PETSCII characters
void draw_maple_leaf(unsigned char x, unsigned char y) {
    textcolor(COLOR_RED);
    
    // Simple maple leaf representation using PETSCII
    gotoxy(x+3, y);
    cputc('*');
    
    gotoxy(x+1, y+1);
    cputs("* * *");
    
    gotoxy(x, y+2);
    cputs("*******");
    
    gotoxy(x+1, y+3);
    cputs("*****");
    
    gotoxy(x+2, y+4);
    cputs("***");
    
    gotoxy(x+3, y+5);
    cputc('|');
}

void main(void) {
    // Clear screen
    clrscr();
    
    // Set border and background colors
    bordercolor(COLOR_WHITE);
    bgcolor(COLOR_WHITE);
    
    // Draw maple leaf
    draw_maple_leaf(17, 5);
    
    // Draw CPP North text
    gotoxy(14, 13);
    textcolor(COLOR_RED);
    cputs("CPP");
    
    textcolor(COLOR_BLACK);
    cputs(" NORTH");
    
    // Position cursor at bottom
    gotoxy(0, 24);
    textcolor(COLOR_BLACK);
    cputs("Press any key to exit...");
    
    // Wait for keypress
    cgetc();
}