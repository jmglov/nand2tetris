// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// The Hack computer includes a black-and-white screen organized as 256 rows of 512
// pixels per row. The screen’s contents are represented by an 8K memory map that
// starts at RAM address 16384 (0x4000). Each row in the physical screen, starting
// at the screen’s top left corner, is represented in the RAM by 32 consecutive
// 16-bit words. Thus the pixel at row r from the top and column c from the left is
// mapped on the c % 16 bit (counting from LSB to MSB) of the word located at
// RAM[16384 + r * 32 + c/16]. To write or read a pixel of the physical screen, one
// reads or writes the corresponding bit in the RAM-resident memory map (1 = black,
// 0 = white).

(SETCOLOR)
    // Paint it black
    @color
    M=-1  // 1111111111111111

(FILL)
    // row = 0
    @row
    M=0

    // word = SCREEN
    @SCREEN
    D=A
    @word
    M=D

(LOOPR)
    // if row - 255 == 0 then goto END
    @255
    D=A
    @row
    D=M-D
    @END
    D;JEQ

    // block = 32
    @32
    D=A
    @block
    M=D

(LOOPBLOCK)
    // if block == 0 then goto LOOPREND
    @block
    D=M
    @LOOPREND
    D;JEQ

    // Fill the word
    @color
    D=M
    @word
    A=M
    M=D

    // word++
    @word
    M=M+1

    // block--
    @block
    M=M-1

    // goto LOOPBLOCK
    @LOOPBLOCK
    0;JMP

(LOOPREND)
    // row--
    @row
    M=M-1

    // goto LOOPR
    @LOOPR
    0;JMP

(END)
    @END
    0;JMP
