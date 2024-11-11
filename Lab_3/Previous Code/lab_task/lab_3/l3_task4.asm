.MODEL SMALL
.STACK 100H
.DATA 

  msg1 db "Enter two decimal digit: $"
  sum db "The sum of $"
  andd db " and $"
  is db " is: $"

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
;enter your code here

lea dx,msg1
mov ah,9
int 21h  

mov ah,1
int 21h
mov bl,al

mov ah,1
int 21h 
mov cl,al

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h 

lea dx,sum
mov ah,9
int 21h

mov dl,bl
mov ah,2
int 21h

lea dx,andd
mov ah,9
int 21h

mov dl,cl
mov ah,2
int 21h

lea dx,is
mov ah,9
int 21h

add cl,bl 
sub cl,30h

mov dl,cl
mov ah,2
int 21h

;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN