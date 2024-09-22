.MODEL SMALL
.STACK 100H
.DATA 
    ; variables
    A DW 0
    B DW 0
    C DW 0
.CODE
MAIN PROC
; init ds
MOV AX, @DATA
MOV DS, AX

;my code is here
MOV AX, 5        ; a = 5
MOV BX, 10       ; b = 10
MOV A, AX
MOV B, BX

; 1. A = B - A
MOV AX, B      
SUB AX, A  ; a = b - a     
MOV A, AX  

; 2. A = -(A + 1)
INC A   
NEG A     

; 3. C = A + (B + 1)
MOV AX, B   
INC AX       ; b++
ADD AX, A   
MOV C, AX    ; c= a + (b + 1)

; 4. A = B - (A - 1);
DEC A       
MOV AX, B    ; ax = b
SUB AX, A    ; ax = b - (a - 1)
MOV A, AX    ; a = b - (a - 1)

; Exit to DOS
MOV AX, 4C00H
INT 21H
MAIN ENDP
END MAIN
