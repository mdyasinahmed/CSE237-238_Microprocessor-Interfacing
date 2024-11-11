.MODEL SMALL
.STACK 100H
.DATA
    A DB 6
    B DB 4
    C DB 7
    D DB 3
    E DB 5
    RESULT DB ?

.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    ; (A + B) * (C - D) / E
    MOV AL, A
    ADD AL, B
    
    MOV BL, C
    SUB BL, D

    MUL BL

    MOV BL, E
    DIV BL

    MOV RESULT, AL

    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
