.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here 
    MOV BX, 1
    MOV AX, 0
    
    start:
    CMP BX, 148
    JG end
    
    ADD AX, BX
    ADD BX, 3
    
    JMP start

end:    
;exit to DOS                  
MOV AX,4C00H 
INT 21H  
 
MAIN ENDP 
END MAIN  