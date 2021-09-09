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

    // numpixels = 8192 (256 * 512 / 16) = 0x2000
    @8192
    D=A
    @numpixels
    M=D

(NOKEY)
    // No key is pressed, wait for keypress then fill screen
    // if (*KBD != 0) goto FILLSCREEN
    @KBD
    D=M
    @FILLSCREEN
    D;JNE

    // goto NOKEY
    @NOKEY
    0;JMP

(KEY)
    // Key is pressed, wait for keypress to end then clear screen
    // if (*KBD == 0) goto CLEARSCREEN
    @KBD
    D=M
    @CLEARSCREEN
    D;JEQ

    // goto KEY
    @KEY
    0;JMP

(FILLSCREEN)
    // n = 0
    @n
    M=0

(FILLSCREENLOOP)
    // if (n == numpixels) goto KEY
    @n
    D=M
    @numpixels
    D=D-M
    @KEY
    D;JEQ

    // *(SCREEN + n) = -1
    @SCREEN
    D=A
    @n
    A=D+M
    M=-1

    // n = n + 1
    @n
    M=M+1

    // goto FILLSCREENLOOP
    @FILLSCREENLOOP
    0;JMP

(CLEARSCREEN)
    // n = 0
    @n
    M=0

(CLEARSCREENLOOP)
    // if (n == numpixels) goto NOKEY
    @n
    D=M
    @numpixels
    D=D-M
    @NOKEY
    D;JEQ

    // *(SCREEN + n) = -1
    @SCREEN
    D=A
    @n
    A=D+M
    M=0

    // n = n + 1
    @n
    M=M+1

    // goto CLEARSCREENLOOP
    @CLEARSCREENLOOP
    0;JMP

// Should never reach here
(END)
    @END
    0;JMP
