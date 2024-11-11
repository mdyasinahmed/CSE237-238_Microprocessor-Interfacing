.MODEL SMALL
.STACK 100H
.DATA  


prmpt1 db "enter number 1: $"
prmpr2 db "enter number 2: $"
addFun db 'Addition: '
subFun db 'Substraction: $ '
mulFun db 'Multiplication: $'
divFun db 'Division: '
b db "Inserted Char: $" 



.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
;enter your code here
 

lea dx,a
mov ah,9
int 21h

mov ah,1  ;User Input
int 21h
sub al,30h

mov bl,al
 

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h


lea dx,b
mov ah,9
int 21h
       
       
     
mov dl,bl
mov ah,2
int 21h
 

       



;exit to DOS
 
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN