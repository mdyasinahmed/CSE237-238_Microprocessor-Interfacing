.MODEL SMALL
.STACK 100H
.DATA

  promt db "Enter three initials: $"

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
;enter your code here  

lea dx,promt
mov ah,9
int 21h

mov ah,1
int 21h 
mov bl,al

mov ah,1
int 21h
mov cl,al

mov ah,1
int 21h
mov bh,al


MOV AH, 2           
MOV DL, 0DH         
INT 21H              
MOV DL, 0AH          
INT 21H 

mov dl,bl
mov ah,2
int 21h

MOV AH, 2           
MOV DL, 0DH         
INT 21H              
MOV DL, 0AH          
INT 21H 

mov dl,cl
mov ah,2
int 21h 

MOV AH, 2           
MOV DL, 0DH         
INT 21H              
MOV DL, 0AH          
INT 21H 

mov dl,bh
mov ah,2
int 21h


;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN