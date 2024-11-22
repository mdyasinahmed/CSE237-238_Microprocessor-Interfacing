.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
 
 
.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here 
    ; TASK 03 : 
    ; IF AX CONTAINS A NEGATIVE NUMBER, PUT -1 IN BX; 
    ; IF AX CONTAINS 0, PUT 0 IN BX; 
    ; IF AX CONTAINS A POSITIVE NUMBER, PUT 1 IN BX. 
    
    MOV AX, 4
    CMP AX, 0
    JL NG
    JE EQL
    JG GRT 
    
    NG:
    MOV BX, -1
    NEG BX
    JMP EXIT
    
    EQL:
    MOV BX, 0
    JMP EXIT
    
    GRT: 
    MOV BX, 1
    JMP EXIT
    
    EXIT:
    ;exit to DOS              
    MOV AX,4C00H 
    INT 21H  
 
MAIN ENDP 
END MAIN  