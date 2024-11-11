.MODEL SMALL
.STACK 100H
.DATA
    RESULT DW ?
        
.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX
    
    ; (1 + 2)
    MOV AX, 1
    ADD AX, 2
    
    ; (3 - 1)
    MOV BX, 3
    SUB BX, 1
    
    ; (1 + 2) * (3 - 1)
    IMUL BX           ; AX = AX * BX
    
    ; Divide by 5
    MOV BX, 5
    XOR DX, DX        ; Clear DX before division
    IDIV BX           ; AX = AX / BX
    
    ; Add 3
    ADD AX, 3
    
    ; Add 2
    ADD AX, 2
    
    ; (1 * 2)
    MOV BX, 1
    IMUL BX, 2        ; BX = 1 * 2
    
    ; Subtract (1 * 2)
    SUB AX, BX
    
    MOV RESULT, AX    ; Store the result in RESULT
    
    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN
