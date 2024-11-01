.MODEL SMALL
.STACK 100H
.DATA
    X DW  30     
    Y DW 20
    Z DW 10
    RESULT1 DW ?
    RESULT2 DW ?
    RESULT3 DW ?
    
.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX
    
    ; 1. X * Y
    MOV AX, X          
    MOV BX, Y          
    IMUL BX            
    MOV RESULT1, AX    ; Store the result in RESULT1
    
    ; 2. X / Y
    MOV AX, X          
    MOV BX, Y          
    XOR DX, DX         ; Clear DX before division
    IDIV BX            ; AX = AX / BX, remainder in DX
    MOV RESULT2, AX    ; Store the result in RESULT2
    
    ; 3. X * Y / Z
    MOV AX, X          
    MOV BX, Y          
    IMUL BX            
    MOV BX, Z          ; Move Z into BX
    IDIV BX            ; AX = AX / BX
    MOV RESULT3, AX    ; Store the result in RESULT3
    
    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN
