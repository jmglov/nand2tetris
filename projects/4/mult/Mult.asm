// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// m = R0
    @R0
    D=M
    @m
    M=D

// n = R1
    @R1
    D=M
    @n
    M=D

// R2 = 0
    @R2
    M=0

(LOOP)
    // if n == 0 then goto END
    @n
    D=M
    @END
    D;JEQ

    // R2 = R2 + m
    @m
    D=M
    @R2
    M=D+M

    // n = n - 1
    @n
    M=M-1
    D=M

    // goto LOOP
    @LOOP
    0;JMP

(END)
    @END
    0;JMP
