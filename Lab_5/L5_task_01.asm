.MODEL SMALL 
  
.STACK 100H 
 
.DATA  


.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here 
    ; TASK 01 : WRITE A COUNT-CONTROLLED LOOP TO DISPLAY A ROW OF 80 STARS.
    
    MOV CX, 5
    MOV AH, 2
    
    
    START:
    MOV DL, '*'
    INT 21H
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H    
    LOOP START 

;exit to DOS  
                
MOV AX,4C00H 
INT 21H  
 
MAIN ENDP 
END MAIN  