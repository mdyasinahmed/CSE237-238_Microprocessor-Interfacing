.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
 
 
.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here 
; TASK 04 : 
    ; IF AL CONTAINS 1 OR 3, DISPLAY “O”; IF AL CONTAINS 2 OR 4 DISPLAY "E". 
    
    ;MOV AL, 1
    ;MOV AL, 3
    ;MOV AL, 2
    MOV AL, 4
    
    CMP AL, 1
    JE SHOW_O
     
    CMP AL, 3
    JE SHOW_O
    
    CMP AL, 2
    JE SHOW_E 
    
    CMP AL, 4
    JE SHOW_E
    
    SHOW_O:
        MOV AH, 2
        MOV DL, 'O'
        INT 21H
        JMP EXIT:
    
    SHOW_E:
        MOV AH, 2
        MOV DL, 'E'
        INT 21H
        JMP EXIT: 
        
    EXIT:
    ;exit to DOS                   
    MOV AX,4C00H 
    INT 21H  
 
MAIN ENDP 
END MAIN  