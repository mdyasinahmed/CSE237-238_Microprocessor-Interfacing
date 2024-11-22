.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
    
    DIVISIBLE db "DIVISIBLE BY 5 AND 11$"

.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here 
    MOV CX, 55 ; THE NUMBER  
    MOV BH, 5  ; 5
    MOV BL, 11 ; 11
    
    ;DIVISIBLE 5
    MOV AX, CX
    DIV BH
    CMP AH, 0
    JE MULTIPLE5
    JMP EXIT
    
    
    MULTIPLE5:
    MOV AX, CX 
    DIV BL
    CMP AH, 0
    ;DIVISIBLE 11              
    JE MULTIPLE5AND11
    JMP EXIT                        
    
    ;PRINT
    MULTIPLE5AND11:
    MOV AH, 9
    LEA DX, DIVISIBLE
    INT 21H
    JMP EXIT
    
    EXIT: 
    ;exit to DOS                  
    MOV AX,4C00H 
    INT 21H  
 
MAIN ENDP 
END MAIN  