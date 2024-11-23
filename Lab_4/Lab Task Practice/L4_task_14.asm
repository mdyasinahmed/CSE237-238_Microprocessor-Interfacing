.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
    D_28 DB "28 DAYS$"    
    D_30 DB "30 DAYS$"    
    D_31 DB "31 DAYS$" 
.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here 
    MOV AH, 1
    INT 21H
    SUB AL, 48
    
    CMP AL, 1
    JE DAY31
    
    CMP AL, 2
    JE DAY28
    
    CMP AL, 3
    JE DAY31
    
    CMP AL, 4
    JE DAY30
    
    CMP AL, 5
    JE DAY31
    
    CMP AL, 6
    JE DAY30
    
    CMP AL, 7
    JE DAY31
    
    CMP AL, 8
    JE DAY31
    
    CMP AL, 9
    JE DAY30
    
    CMP AL, 17 ; FOR THE VALUE OF 10
    JE DAY31
    
    CMP AL, 18 ; FOR THE VALUE OF 11
    JE DAY30
    
    CMP AL, 19 ; FOR THE VALUE OF 12
    JE DAY31
    JMP EXIT
    
    DAY28:
    ;PRINTING NEWLINE
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    
    ;PRINTING CREG RETURN
    MOV DL, 13
    MOV AH, 2
    INT 21H
    
    ;PRINTING OUTPUT
    MOV AH, 9
    LEA DX, D_28
    INT 21H
    JMP EXIT
    
    DAY30:
    ;PRINTING NEWLINE
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    
    ;PRINTING CREG RETURN
    MOV DL, 13
    MOV AH, 2
    INT 21H
    
    ;PRINTING OUTPUT
    MOV AH, 9
    LEA DX, D_30
    INT 21H
    JMP EXIT
    
    
    DAY31:
    ;PRINTING NEWLINE
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    
    ;PRINTING CREG RETURN
    MOV DL, 13
    MOV AH, 2
    INT 21H
    
    ;PRINTING OUTPUT
    MOV AH, 9
    LEA DX, D_31
    INT 21H
    JMP EXIT
    
    
    EXIT:
    ;exit to DOS                
    MOV AX,4C00H 
    INT 21H  
 
MAIN ENDP 
END MAIN  