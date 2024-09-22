.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
;enter your code here  
MOV AX, 5
MOV BX, 10
ADD AX, BX  ; AX=15
SUB BX, AX  ; 10-15
NEG BX      ; (-5) change to pos -> so BX = 5
SUB AX, BX  ; 15-5 = 10. so AX = 10
;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN