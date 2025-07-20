// Simplified C++ version for CPP North 2025 
// Demonstrating C++ features that work with Oscar64

#include <c64/vic.h>
#include <conio.h>
#include <stdio.h>

// C++ namespace
namespace CPPNorth {
    
    // Simple C++ class with constructor and destructor (RAII)
    class Screen {
    public:
        // Constructor
        Screen() {
            vic.color_border = 1;  // White border
            vic.color_back = 1;    // White background
            clrscr();
        }
        
        // Destructor (RAII cleanup)
        ~Screen() {
            // Could restore original colors here
        }
        
        // Method with const correctness
        void print_at(unsigned char x, unsigned char y, const char* text) const {
            gotoxy(x, y);
            printf("%s", text);
        }
    };

    // C++ class demonstrating encapsulation
    class MapleLeaf {
    private:
        unsigned char x_pos, y_pos;
        
    public:
        // Constructor with parameters
        MapleLeaf(unsigned char x, unsigned char y) {
            x_pos = x;
            y_pos = y;
        }
        
        // Public method to draw maple leaf
        void draw() const {
            textcolor(2);  // Red color
            revers(1);     // Reverse video for solid blocks
            
            // Draw maple leaf pattern inline
            gotoxy(x_pos + 6, y_pos);
            putchar(' ');
            
            gotoxy(x_pos + 5, y_pos + 1);
            printf("   ");
            
            gotoxy(x_pos + 3, y_pos + 2);
            putchar(' ');
            gotoxy(x_pos + 5, y_pos + 2);
            printf("   ");
            gotoxy(x_pos + 9, y_pos + 2);
            putchar(' ');
            
            gotoxy(x_pos + 2, y_pos + 3);
            printf("   ");
            gotoxy(x_pos + 6, y_pos + 3);
            putchar(' ');
            gotoxy(x_pos + 8, y_pos + 3);
            printf("   ");
            
            gotoxy(x_pos + 1, y_pos + 4);
            printf("           ");
            
            gotoxy(x_pos + 2, y_pos + 5);
            printf("         ");
            
            gotoxy(x_pos + 3, y_pos + 6);
            printf("       ");
            
            gotoxy(x_pos + 4, y_pos + 7);
            printf("     ");
            
            gotoxy(x_pos + 6, y_pos + 8);
            putchar(' ');
            gotoxy(x_pos + 6, y_pos + 9);
            putchar(' ');
            
            revers(0);  // Turn off reverse video
        }
    };

    // C++ class for frame drawing
    class Frame {
    private:
        unsigned char left, top, right, bottom;
        
    public:
        Frame(unsigned char l, unsigned char t, unsigned char r, unsigned char b) {
            left = l; top = t; right = r; bottom = b;
        }
        
        void draw() const {
            textcolor(2);  // Red frame
            
            // Draw top and bottom borders
            gotoxy(left, top);
            putchar('+');
            for (unsigned char i = left + 1; i < right; i++) {
                putchar('-');
            }
            putchar('+');
            
            gotoxy(left, bottom);
            putchar('+');
            for (unsigned char i = left + 1; i < right; i++) {
                putchar('-');
            }
            putchar('+');
            
            // Draw side borders
            for (unsigned char y = top + 1; y < bottom; y++) {
                gotoxy(left, y);
                putchar('|');
                gotoxy(right, y);
                putchar('|');
            }
        }
    };

    // Main conference class using composition
    class Conference {
    private:
        Screen screen;
        MapleLeaf maple_leaf;
        Frame frame;
        
    public:
        // Constructor with member initialization list
        Conference() : screen(), maple_leaf(14, 4), frame(5, 1, 34, 22) {
        }
        
        void display() {
            // Draw frame and maple leaf
            frame.draw();
            maple_leaf.draw();
            
            // Draw text
            textcolor(0);  // Black
            gotoxy(10, 3);
            printf("= CPP NORTH 2025 =");
            
            textcolor(12); // Gray
            gotoxy(9, 19);
            printf("CANADIAN C++ CONFERENCE");
            
            textcolor(0);  // Black
            gotoxy(11, 24);
            printf("PRESS ANY KEY...");
            
            // Draw logo
            textcolor(2);  // Red
            gotoxy(11, 16);
            printf("* C++ ");
            
            textcolor(0);  // Black
            gotoxy(17, 16);
            printf("N O R T H *");
        }
        
        void wait_for_input() const {
            getchar();
        }
    };
}

// Main function demonstrating C++ features
int main() {
    // Using C++ namespace
    using namespace CPPNorth;
    
    // C++ object creation (constructor called)
    Conference conference;
    
    // C++ method calls
    conference.display();
    conference.wait_for_input();
    
    return 0;
    // C++ destructors called automatically (RAII)
}