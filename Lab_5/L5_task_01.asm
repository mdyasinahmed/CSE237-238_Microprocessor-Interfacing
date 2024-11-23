.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
    STAR DB "*$"
.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here 
    ; TASK 01 : WRITE A COUNT-CONTROLLED LOOP TO DISPLAY A ROW OF 80 STARS.
    
    MOV CX, 80
    
    BEGIN:
        MOV AH, 9
        LEA DX, STAR
        INT 21H
        LOOP BEGIN 

;exit to DOS  
                
MOV AX,4C00H 
INT 21H  
 
MAIN ENDP 
END MAIN  