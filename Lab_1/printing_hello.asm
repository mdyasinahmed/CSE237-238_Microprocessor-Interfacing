.MODEL SMALL
.STACK 100H
.DATA
    msg db 'Hello, World!$'
.CODE
MAIN PROC
    ; Initialize DS
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX, msg       
    MOV AH, 09H       
    INT 21H           
    
    ; Exit to DOS
    MOV AX,4C00H
    INT 21H
MAIN ENDP
END MAIN