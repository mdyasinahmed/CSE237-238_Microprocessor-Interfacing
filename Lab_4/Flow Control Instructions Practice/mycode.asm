.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
    SCORE DB "ENTER YOUR SCORE(_/9): $"
    G DB "YOU OBTAINED A GOOD SCORE."
    A DB "YOU OBTAINED AN AVERAGE SCORE."
    L DB "LOW SCORE. KEEP PRACTICING." 
.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here 
    LEA DX, SCORE
    MOV AH, 09H
    INT 21H
    
    MOV AH, 01
    INT 21H
    
    SUB AL, '0'
    MOV BL, AL
    
    CMP BL, 3
    JLE LOW
    
    
    LOW:
        LEA DX, L
        MOV AH, 09
        INT 21H 
    
;exit to DOS                  
MOV AX,4C00H 
INT 21H  
 
MAIN ENDP 
END MAIN  