.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
;enter your code here
mov ax, bx
mov bx, cx
mov cx, ax
;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN