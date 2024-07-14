.MODEL SMALL
.STACK 100H
.DATA
     msg db 'Hello World!$'
.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
;enter your code here

;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN