.MODEL SMALL
.STACK 100H
.DATA 

  prompt db "Please insert a character: $" ; Message to prompt the user
  output db "Inserted Character: $" ; Message to display the character

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
;enter your code here
  
  
    LEA DX, prompt 
    MOV AH, 9      
    INT 21h        

    
    MOV AH, 1      
    INT 21h       
    MOV BL, AL     

    
    MOV AH, 2      
    MOV DL, 0DH    
    INT 21h
    MOV DL, 0AH   
    INT 21h

    
    LEA DX, output 
    MOV AH, 9      
    INT 21h

  
    MOV DL, BL     
    MOV AH, 2   
    INT 21h



;exit to DOS                                        
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN

















