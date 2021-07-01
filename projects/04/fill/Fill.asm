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

(LOOP)
@KBD
D=M

// @KBD > 0 -> @ON
@ON
D;JGT
@OFF
0;JMP

(ON)
@color
M=-1 // -1 -> (1111 1111 1111 1111)
@FILL
0;JMP

(OFF)
@color
M=0



(FILL)
@SCREEN
D=A
@8192 // (512/16)*256
D=D+A
@address
M=D

(LOOP2)

@color
D=M
@address
A=M
M=D

@address
MD=M-1

@SCREEN
D=D-A
@LOOP2
D;JGE // @SCREEN >= 0 -> LOOP2


@LOOP
0;JMP
