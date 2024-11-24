.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
 
 
.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here 

; Task 04	
    MOV CX, 0 ; product
    MOV AX, 3 ; m
    MOV BX, 2 ; n
    
    start:
    ADD CX, AX
    DEC BX

    CMP BX, 0
    JNE start

    MOV AH, 2
    MOV DL, CL
    ADD DL, 48
    int 21h 
  
;exit to DOS  
                
MOV AX,4C00H 
INT 21H  
 
MAIN ENDP 
END MAIN 