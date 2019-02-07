// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

    @0
    D=A
    @R2
    M=D
    @R0
    D=M
    @R1
    D=D-M
    @LARGERR0
    D;JGE
    @LARGERR1
    0;JMP
(LARGERR0)
    @R1
    D=M
    @num
    M=D
    @R0
    D=M
    @addnum
    M=D
    @LOOP
    0;JMP
(LARGERR1)
    @R0
    D=M
    @num
    M=D
    @R1
    D=M
    @addnum
    M=D
    @LOOP
    0;JMP
(LOOP)
    @1   //A = 1
    D=A  // D = 1
    @num   
    M=M-D // num = num - 1
    D=M
    @END
    D;JLT
    @addnum
    D=M // D=addnum
    @R2
    M=M+D // R2 = R2 + addnum
    @LOOP
    0;JMP
(END)
    @END
    0;JMP
