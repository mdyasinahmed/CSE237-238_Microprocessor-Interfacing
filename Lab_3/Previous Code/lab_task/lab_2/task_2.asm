.MODEL SMALL
.STACK 100H
.DATA
    A DW 4
    B DW 3
    C DW 8
    D DW 2
    E DW 3
    RESULT DW ?
    
.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX
    
    ; (A + B)
    MOV AX, A
    ADD AX, B
    
    ; (C - D)
    MOV BX, C
    SUB BX, D
    
    ; (A + B) * (C - D)
    IMUL BX           ; AX = AX * BX
    
    ; Divide by E
    MOV BX, E
    XOR DX, DX        ; Clear DX before division
    IDIV BX           ; AX = AX / BX
    
    MOV RESULT, AX    ; Store the result in RESULT
    
    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN
