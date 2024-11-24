.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
 
 
.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here 
; Task 03 : Read a five character password and overprint it by executing a carriage return and displaying five X's. 
;You need not store the input characters anywhere.
    
    MOV BL, 0 
    MOV CL, 0

    start: 
    CMP BL, 5
    JGE second
    
    MOV AH, 1
    int 21h
    
    INC BL
    JMP start
    
    second:
    MOV AH, 2
    MOV DL, 0DH
    int 21h
    
    third:
    CMP CL, 5
    JGE end    
    MOV AH, 2
    MOV DL, 58H
    int 21h
    INC CL
    JMP third
    
end:  
;exit to DOS                  
MOV AX,4C00H 
INT 21H  
 
MAIN ENDP 
END MAIN 