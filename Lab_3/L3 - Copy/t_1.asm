.MODEL SMALL
.STACK 100H
.DATA
message DB 'Please insert a character: $'
char DB ?

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Display message
    MOV AH, 09H  ; to print a string
    LEA DX, message
    INT 21H

    ; Read character input
    MOV AH, 01H   ; to read a string
    INT 21H
    MOV char, AL

    ; Display character
    MOV AH, 02H    ; to display a string
    MOV DL, char
    INT 21H

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
