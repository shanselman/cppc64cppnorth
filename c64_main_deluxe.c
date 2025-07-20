// Deluxe C64 version with correct PETSCII block graphics
// This will be compiled with cc65

#include <conio.h>
#include <c64.h>
#include <string.h>

// Correct PETSCII block graphics characters
#define BLOCK_FULL 160      // Reversed space (full block)
#define BLOCK_TOP 163       // Top half block
#define BLOCK_BOTTOM 164    // Bottom half block
#define BLOCK_LEFT 165      // Left half block
#define BLOCK_RIGHT 182     // Right half block
#define BLOCK_CHECK1 166    // Checkered pattern 1
#define BLOCK_CHECK2 167    // Checkered pattern 2
#define BLOCK_VERT 221      // Vertical bar
#define BLOCK_HORIZ 192     // Horizontal bar

// PETSCII line drawing characters
#define LINE_HORIZ 96       // Horizontal line
#define LINE_VERT 125       // Vertical line
#define CORNER_TL 176       // Top-left corner
#define CORNER_TR 174       // Top-right corner
#define CORNER_BL 173       // Bottom-left corner
#define CORNER_BR 189       // Bottom-right corner

// Draw an advanced maple leaf using correct characters
void draw_deluxe_maple_leaf(unsigned char x, unsigned char y) {
    textcolor(COLOR_RED);
    
    // Use reverse video for solid blocks
    revers(1);
    
    // Row 1 - top point
    gotoxy(x+6, y);
    cputc(' ');
    
    // Row 2
    gotoxy(x+5, y+1);
    cputs("   ");
    
    // Row 3 - upper lobes
    gotoxy(x+3, y+2);
    cputc(' ');
    gotoxy(x+5, y+2);
    cputs("   ");
    gotoxy(x+9, y+2);
    cputc(' ');
    
    // Row 4 - wider upper section
    gotoxy(x+2, y+3);
    cputs("   ");
    gotoxy(x+6, y+3);
    cputc(' ');
    gotoxy(x+8, y+3);
    cputs("   ");
    
    // Row 5 - main body
    gotoxy(x+1, y+4);
    cputs("           ");
    
    // Row 6 - lower wide section
    gotoxy(x+2, y+5);
    cputs("         ");
    
    // Row 7 - narrowing
    gotoxy(x+3, y+6);
    cputs("       ");
    
    // Row 8 - bottom point
    gotoxy(x+4, y+7);
    cputs("     ");
    
    // Row 9 - stem
    gotoxy(x+6, y+8);
    cputc(' ');
    
    // Row 10 - stem base
    gotoxy(x+6, y+9);
    cputc(' ');
    
    // Turn off reverse video
    revers(0);
}

// Draw decorative frame using simple characters
void draw_frame(void) {
    unsigned char i;
    
    textcolor(COLOR_RED);
    
    // Top border
    gotoxy(5, 1);
    cputc('+');
    for(i = 0; i < 28; i++) {
        cputc('-');
    }
    cputc('+');
    
    // Side borders
    for(i = 2; i < 22; i++) {
        gotoxy(5, i);
        cputc('|');
        gotoxy(34, i);
        cputc('|');
    }
    
    // Bottom border
    gotoxy(5, 22);
    cputc('+');
    for(i = 0; i < 28; i++) {
        cputc('-');
    }
    cputc('+');
}

void main(void) {
    // Clear screen with white background
    bordercolor(COLOR_WHITE);
    bgcolor(COLOR_WHITE);
    clrscr();
    
    // Draw decorative frame
    draw_frame();
    
    // Draw deluxe maple leaf
    draw_deluxe_maple_leaf(14, 4);
    
    // Draw CPP NORTH text
    gotoxy(11, 16);
    textcolor(COLOR_RED);
    cputs("* C P P ");
    
    textcolor(COLOR_BLACK);
    cputs("N O R T H *");
    
    // Add title
    gotoxy(10, 3);
    textcolor(COLOR_BLACK);
    cputs("= CPP NORTH 2025 =");
    
    // Subtitle
    gotoxy(8, 19);
    textcolor(COLOR_GRAY2);
    cputs("Canadian C++ Conference");
    
    // Footer with instructions
    gotoxy(11, 24);
    textcolor(COLOR_BLACK);
    cputs("PRESS ANY KEY...");
    
    // Wait for keypress
    cgetc();
}