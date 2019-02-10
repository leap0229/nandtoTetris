// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(LOOP)
    @SCREEN
    D=A
    @i // i
    M=D
    @24575
    D=A
    @MAXPIXEL
    M=D
    @KBD   //A = Monitoring KyebordInput
    D=M
    @BLACKOUT
    D;JNE
    @WHITEOUT
    0;JMP

(BLACKOUT)
    @i
    A=M // A is screenAddress
    M=-1 // pixel is black
    @i
    M=M+1 // i = i + 1
    D=M
    @MAXPIXEL
    D=M-D
    @LOOP
    D;JLT
    @BLACKOUT
    0;JMP

(WHITEOUT)
    @i
    A=M // A is screenAddress
    M=0 // pixel is white
    @i
    M=M+1 // i = i + 1
    D=M
    @MAXPIXEL
    D=M-D
    @LOOP
    D;JLT
    @WHITEOUT
    0;JMP
