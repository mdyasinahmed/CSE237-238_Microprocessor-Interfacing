.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
 
 
.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here
    MOV AH, 1
    INT 21H
    SUB AL, 48
    
    CMP AL, 0
    JE PRINTI
    
    CMP AL, 1
    JE PRINTI
    
    CMP AL, 2
    JE PRINTI
    
    CMP AL, 3
    JE PRINTI
    
    CMP AL, 4
    JE PRINTK
    
    CMP AL, 5
    JE PRINTK
    
    CMP AL, 6
    JE PRINTK
    
    CMP AL, 7
    JE PRINTL
    
    CMP AL, 8
    JE PRINTL
    
    CMP AL, 9
    JE PRINTL
    
    CMP AL, 17 ; FOR THE VALUE OF 10
    JE PRINTM
    JMP EXIT
    
    PRINTI:
        MOV DL, 069H
        MOV AH, 2    
        INT 21H
        JMP EXIT
    
    PRINTK:
        MOV DL, 06BH
        MOV AH, 2    
        INT 21H
        JMP EXIT
    
    PRINTL:
        MOV DL, 06CH
        MOV AH, 2     
        INT 21H
        JMP EXIT
    
    PRINTM:
        MOV DL, 06DH
        MOV AH, 2    
        INT 21H
        JMP EXIT
    
    EXIT:    
        ;exit to DOS                
        MOV AX,4C00H 
        INT 21H  
 
MAIN ENDP 
END MAIN  