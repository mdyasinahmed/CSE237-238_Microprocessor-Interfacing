;1)sub 
.MODEL SMALL
.STACK 100H
.DATA

 a db "Please enter a number1: $"     
 b db "Please enter a number2: $" 
 c db "addition: $"

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
;enter your code here

lea dx,a
mov ah,9
int 21h

mov ah,1  ;User Input1
int 21h
;sub al,30h


mov bl,al

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h 

lea dx,b
mov ah,9
int 21h

mov ah,1  ;User Input2
int 21h 


 

SUB bl,al 
ADD bl,30h


mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h 
 

lea dx,c
mov ah,9
int 21h 


MOV dl,bl 
MOV ah,2
int 21h




;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN


;;2)add


.MODEL SMALL
.STACK 100H
.DATA

 a db "Please enter a number1: $"     
 b db "Please enter a number2: $" 
 c db "addition: $"

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
;enter your code here

lea dx,a
mov ah,9
int 21h

mov ah,1  ;User Input1
int 21h
;sub al,30h


mov bl,al

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h 

lea dx,b
mov ah,9
int 21h

mov ah,1  ;User Input2
int 21h 


 

ADD bl,al 
SUB bl,30h


mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h 
 

lea dx,c
mov ah,9
int 21h 


MOV dl,bl 
MOV ah,2
int 21h




;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN
;3)
.MODEL SMALL
.STACK 100H
.DATA

 a db "Please enter a number1: $"     
 b db "Please enter a number2: $" 
 c db "Multiplication: $" 
 result db 0

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
;enter your code here

lea dx,a
mov ah,9
int 21h

mov ah,1  ;User Input1
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

mov ah,1  ;User Input2
int 21h
sub al,30h 

mov bh,al;


MOV al,bl
MOV ah,0
MUL bh


MOV result,al 

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h 
 

lea dx,c
mov ah,9
int 21h 

         
MOV al, result        
ADD al, 30h          
     
MOV dl,al 
MOV ah,2
int 21h




;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN


;4)
.MODEL SMALL
.STACK 100H
.DATA

   a db "Please enter a number1: $"     
   b db "Please enter a number2: $" 
   c db "Division: $" 
   result db 0 
   rem db 0
  
.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
;enter your code here

lea dx,a
mov ah,9
int 21h

mov ah,1  ;User Input1
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

mov ah,1  ;User Input2
int 21h
sub al,30h 

mov bh,al;


MOV al,bl
MOV ah,0
DIV bh

MOV result,al 

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h 
 

lea dx,c
mov ah,9
int 21h 

         
MOV al, result        
ADD al, 30h  
;MOV ah,rem
;ADD ah, 30h
   
     
MOV dl,al 
MOV ah,2
int 21h 
        
        
;MOV dl,ah 
;MOV ah,2
;int 21h



;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN