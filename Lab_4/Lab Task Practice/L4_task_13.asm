.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
    SATURDAY DB "SATURDAY$"
    SUNDAY DB "SUNDAY$"
    MONDAY DB "MONDAY$"
    TUESDAY DB "TUESDAY$"
    WEDNESDAY DB "WEDNESDAY$"
    THURSDAY DB "THURSDAY$"
    FRIDAY DB "FRIDAY$"  
.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here 
    ; INPUT
    MOV AH, 1
    INT 21H
    SUB AL, 030H
    
    CMP AL, 1
    JE SAT_P
    
    CMP AL, 2
    JE SUN_P
    
    CMP AL, 3
    JE MON_P
    
    CMP AL, 4
    JE TUE_P
    
    CMP AL, 5
    JE WED_P
    
    CMP AL, 6
    JE THU_P
    
    CMP AL, 7
    JE FRI_P
    
    
    SAT_P:
    MOV AH, 9
    LEA DX, SATURDAY
    INT 21H
    JMP EXIT
    
    SUN_P:
    MOV AH, 9
    LEA DX, SUNDAY
    INT 21H
    JMP EXIT
    
    MON_P:
    MOV AH, 9
    LEA DX, MONDAY
    INT 21H
    JMP EXIT
    
    TUE_P:
    MOV AH, 9
    LEA DX, TUESDAY
    INT 21H
    JMP EXIT
     
    WED_P:
    MOV AH, 9
    LEA DX, WEDNESDAY
    INT 21H
    JMP EXIT
    
    THU_P:
    MOV AH, 9
    LEA DX, THURSDAY
    INT 21H
    JMP EXIT
    
    FRI_P:
    MOV AH, 9
    LEA DX, FRIDAY
    INT 21H
    
 
    EXIT:
    ;exit to DOS                   
    MOV AX,4C00H 
    INT 21H  
 
MAIN ENDP 
END MAIN  