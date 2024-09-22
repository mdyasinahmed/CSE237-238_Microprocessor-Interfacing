.MODEL SMALL
.STACK 100H
.DATA
    M DB 'Hello, World!$',

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Print the message
    MOV AH, 09H       
    LEA DX, M
    MOV AH, 9   
    INT 21H           

    ; Exit to DOS
    MOV AX, 4C00H      ; DOS function to exit program
    INT 21H            ; Call DOS interrupt

MAIN ENDP
END MAIN
