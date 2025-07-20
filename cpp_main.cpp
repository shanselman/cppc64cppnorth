// C++ version for CPP North 2025 - Real C++ for a C++ conference!
// Compiled with Oscar64 C++ compiler demonstrating supported C++ features

#include <c64/vic.h>
#include <conio.h>
#include <stdio.h>
#include <stdlib.h>

// C++ namespace
namespace CPPNorth {
    
    // Simple C++ class demonstrating encapsulation
    class Screen {
    private:
        unsigned char saved_border;
        unsigned char saved_background;
        
    public:
        // Constructor with parameters
        Screen(unsigned char border_color = 1, unsigned char bg_color = 1) {
            // Save current state for restoration later
            saved_border = vic.color_border;
            saved_background = vic.color_back;
            
            // Set new colors
            vic.color_border = border_color;
            vic.color_back = bg_color;
            clrscr();
        }
        
        // Destructor for cleanup (RAII principle)
        ~Screen() {
            vic.color_border = saved_border;
            vic.color_back = saved_background;
        }
        
        // Member function with const correctness
        void print_at(unsigned char x, unsigned char y, const char* text, unsigned char color) const {
            gotoxy(x, y);
            textcolor(color);
            printf("%s", text);
        }
        
        void draw_char_at(unsigned char x, unsigned char y, char c) const {
            gotoxy(x, y);
            putchar(c);
        }
        
        void clear() const {
            clrscr();
        }
    };

    // C++ class with member functions and encapsulation
    class MapleLeaf {
    private:
        unsigned char x_pos;
        unsigned char y_pos;
        unsigned char leaf_color;
        
    public:
        // Constructor with member initialization
        MapleLeaf(unsigned char x, unsigned char y, unsigned char color = 2) {
            x_pos = x;
            y_pos = y;
            leaf_color = color;
        }
        
        // Public method to draw the maple leaf
        void draw(const Screen& screen) const {
            textcolor(leaf_color);
            revers(1);  // Use reverse video for solid blocks
            
            // Draw maple leaf using relative positioning
            draw_leaf_pattern(screen);
            
            revers(0);  // Turn off reverse video
        }
        
        // Getter methods (encapsulation)
        unsigned char get_x() const { return x_pos; }
        unsigned char get_y() const { return y_pos; }
        
    private:
        // Private helper method
        void draw_leaf_pattern(const Screen& screen) const {
            // Row 1 - top point
            screen.draw_char_at(x_pos + 6, y_pos, ' ');
            
            // Row 2
            gotoxy(x_pos + 5, y_pos + 1);
            printf("   ");
            
            // Row 3 - upper lobes
            screen.draw_char_at(x_pos + 3, y_pos + 2, ' ');
            gotoxy(x_pos + 5, y_pos + 2);
            printf("   ");
            screen.draw_char_at(x_pos + 9, y_pos + 2, ' ');
            
            // Row 4 - wider upper section
            gotoxy(x_pos + 2, y_pos + 3);
            printf("   ");
            screen.draw_char_at(x_pos + 6, y_pos + 3, ' ');
            gotoxy(x_pos + 8, y_pos + 3);
            printf("   ");
            
            // Row 5 - main body (widest part)
            gotoxy(x_pos + 1, y_pos + 4);
            printf("           ");
            
            // Row 6 - lower wide section
            gotoxy(x_pos + 2, y_pos + 5);
            printf("         ");
            
            // Row 7 - narrowing
            gotoxy(x_pos + 3, y_pos + 6);
            printf("       ");
            
            // Row 8 - bottom point
            gotoxy(x_pos + 4, y_pos + 7);
            printf("     ");
            
            // Row 9-10 - stem
            screen.draw_char_at(x_pos + 6, y_pos + 8, ' ');
            screen.draw_char_at(x_pos + 6, y_pos + 9, ' ');
        }
    };

    // Another C++ class demonstrating composition
    class Frame {
    private:
        unsigned char left, top, right, bottom;
        unsigned char frame_color;
        
    public:
        Frame(unsigned char l, unsigned char t, unsigned char r, unsigned char b, unsigned char color = 2) {
            left = l; top = t; right = r; bottom = b;
            frame_color = color;
        }
        
        void draw(const Screen& screen) const {
            textcolor(frame_color);
            
            // Draw corners and horizontal lines
            draw_horizontal_line(screen, left, top, right - left + 1);
            draw_horizontal_line(screen, left, bottom, right - left + 1);
            
            // Draw vertical lines
            for (unsigned char y = top + 1; y < bottom; y++) {
                screen.draw_char_at(left, y, '|');
                screen.draw_char_at(right, y, '|');
            }
        }
        
    private:
        void draw_horizontal_line(const Screen& screen, unsigned char x, unsigned char y, unsigned char length) const {
            gotoxy(x, y);
            putchar('+');
            for (unsigned char i = 1; i < length - 1; i++) {
                putchar('-');
            }
            putchar('+');
        }
    };

    // Main conference class demonstrating C++ composition pattern
    class Conference {
    private:
        Screen screen;          // Composition: Conference "has-a" Screen
        MapleLeaf maple_leaf;   // Composition: Conference "has-a" MapleLeaf  
        Frame frame;            // Composition: Conference "has-a" Frame
        
    public:
        // Constructor demonstrating C++ initialization
        Conference() : screen(1, 1),                           // White border and background
                      maple_leaf(14, 4, 2),                   // Red maple leaf at position (14,4)
                      frame(5, 1, 34, 22, 2) {}               // Red frame
        
        // Public interface method
        void display() {
            // Use composition to draw all elements
            frame.draw(screen);
            maple_leaf.draw(screen);
            
            // Draw text with C++ member functions
            screen.print_at(10, 3, "= CPP NORTH 2025 =", 0);      // Black text
            screen.print_at(8, 19, "Canadian C++ Conference", 12); // Gray text
            screen.print_at(11, 24, "PRESS ANY KEY...", 0);       // Black text
            
            // Draw the main logo
            draw_main_logo();
        }
        
        void wait_for_input() const {
            getchar();
        }
        
    private:
        // Private helper method
        void draw_main_logo() {
            screen.print_at(11, 16, "* C P P ", 2);               // Red "CPP"
            screen.print_at(19, 16, "N O R T H *", 0);            // Black "NORTH"
        }
    };
}

// Main function demonstrating C++ usage
int main() {
    // Use C++ namespace
    using namespace CPPNorth;
    
    // C++ object creation (constructor called automatically)
    Conference conference;
    
    // C++ method calls
    conference.display();
    conference.wait_for_input();
    
    return 0;
    // C++ destructors called automatically when objects go out of scope (RAII)
}