.MODEL SMALL
.STACK 100H
.DATA 

  msg1 db "Enter a Hex Digit: $"
  res db "In Decimal it is: $"
  r db 0

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

sub bl,41h
add bl,10

;mov cl,bl 

MOV AH, 2           
MOV DL, 0DH         
INT 21H              
MOV DL, 0AH          
INT 21H

lea dx,res
mov ah,9
int 21h


MOV AL, BL                     
MOV AH, 0                      
MOV DL, 10                   
DIV DL   
       
MOV CL, AH
   
ADD AL,30h                   
MOV DL, AL                     
MOV AH, 2                    
INT 21H                   
    
MOV AL, CL 
ADD AL,30h                   
MOV DL, AL                   
MOV AH, 2                   
INT 21H    


;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN