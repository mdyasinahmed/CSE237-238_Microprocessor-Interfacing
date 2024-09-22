.MODEL SMALL
.STACK 100H
.DATA
    A DW 0
    B DW 0
    C DW 0
.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, 5    ; A = 5
    MOV BX, 10   ; B = 10
    MOV A, AX
    MOV B, BX

    ; 1. A = B - A
    MOV AX, B    ; AX = B
    SUB AX, A    ; AX = B - A
    MOV A, AX    ; A = B - A

    ; 2. A = -(A + 1)
    INC A        ; A = A + 1
    NEG A        ; A = -(A + 1)

    ; 3. C = A + (B + 1); Use INC
    MOV AX, B    ; AX = B
    INC AX       ; AX = B + 1
    ADD AX, A    ; AX = A + (B + 1)
    MOV C, AX    ; C = A + (B + 1)

    ; 4. A = B - (A - 1); Use DEC
    DEC A        ; A = A - 1
    MOV AX, B    ; AX = B
    SUB AX, A    ; AX = B - (A - 1)
    MOV A, AX    ; A = B - (A - 1)

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
