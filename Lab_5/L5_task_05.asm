.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
 
 
.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here 
; Task 05 : Write a program to display the extended ASCII characters (ASCII codes 80h to FFh). 
; Display 10 characters per line, separated by blanks. Stop after the extended characters have been displayed once.
    
    MOV BX, 80H
    MOV CL, 0
    
    start:
    CMP CL, 10
    JE newline
    INC CL
    
    MOV AH, 2
    MOV DX, BX
    int 21h
    
    INC BX
    
    CMP BX, 0ffH
    JE exit
    
    JMP start
    
    newline:
    ;printing newLine
    MOV DL, 0AH
    MOV AH, 2
    int 21h
    
    ;printing creg return
    MOV DL, 13
    MOV AH, 2
    int 21h
    
    MOV CL, 0
    
    JMP start
    
exit:  
;exit to DOS                  
MOV AX,4C00H 
INT 21H  
 
MAIN ENDP 
END MAIN  