.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
 
 
.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here
    
    ; TASK 02 : SUPPOSE AL AND BL CONTAIN EXTENDED ASCII CHARACTERS. DISPLAY THE ONE THAT COMES FIRST IN THE CHARACTER SEQUENCE.
    
    ; TAKE FIRST CHARACTER
    MOV AH, 1
    INT 21H
    MOV CL, AL ; STORE IT TO CL
    
    ; TAKE SECOND CHARACTER
    MOV AH, 1
    INT 21H
    MOV CH, AL ; STORE IT TO CL
    
    ; COMPARING
    CMP CL, CH
    JLE IF_
    JMP ELSE_
    
    IF_:  
        MOV DL, CL   
        JMP DISPLAY_
		
    ELSE_:   
        MOV DL, CH
		
    DISPLAY_:
        MOV AH, 2
        INT 21H 
 
 
;exit to DOS  
                
MOV AX,4C00H 
INT 21H  
 
MAIN ENDP 
END MAIN  