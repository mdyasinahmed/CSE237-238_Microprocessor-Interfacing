.MODEL SMALL
.STACK 100H
.DATA

<<<<<<< HEAD
char DB ?           ; Store the character
newline DB 13, 10, '$'  ; Newline characters for formatting

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; --- Task 03a: Read and display a character ---
    MOV AH, 09H           ; Print newline for formatting
    LEA DX, newline
    INT 21H
    MOV AH, 01H           ; Read a character from input
    INT 21H
    MOV char, AL          ; Store character in variable
    MOV AH, 02H           ; Display character
    MOV DL, char
    INT 21H

    ; --- Task 03b: Display the character in lowercase on the same line ---
    MOV AH, 09H           ; Print newline for formatting
    LEA DX, newline
    INT 21H
    MOV AH, 02H           ; Display character as it is
    MOV DL, char
    INT 21H

    ; --- Task 03c: Display the character in lowercase on the next line ---
    MOV AH, 09H           ; Print newline for formatting
    LEA DX, newline
    INT 21H
    MOV DL, char          ; Display character again in lowercase (if already lowercase, no change)
    MOV AH, 02H
    INT 21H

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
=======
SUM DB "SUM IS : $"


.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
;enter your code here


MOV AH, 1    ; FIRST NUMBER
INT 21H
SUB AL, '0' 

MOV BL, AL

  

MOV AH, 1    ;SECOND NUMBER
INT 21H
SUB AL, '0'

MOV CL, AL



ADD CL, BL

ADD CL, '0'



MOV AH, 2       ;NEW LINE
MOV DL, 0AH
INT 21H
MOV DL, 0DH
INT 21H


MOV AH, 9         ; THE SUM IS
LEA DX, SUM
INT 21H


MOV DL, CL
MOV AH, 2
INT 21H



;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN
>>>>>>> 03b820f333bbbd2377d372dee6f0b6eef2b7f9a5
