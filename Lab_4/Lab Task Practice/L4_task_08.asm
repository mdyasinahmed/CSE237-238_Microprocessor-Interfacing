.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
    V DB "VOWEL$"
    C DB "CONSTANT$"
 
.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here 
    ; WRITE A PROGRAM TO INPUT ANY ALPHABET AND CHECK WHETHER IT IS VOWEL OR CONSONANT. 
    ; READ INPUT
    MOV AH, 1
    INT 21H
    
    CMP AL, 'A'
    JE PRINTV
    
    CMP AL, 'A'
    JE PRINTV
    
    CMP AL, 'E'
    JE PRINTV 
    
    CMP AL, 'E'
    JE PRINTV
    
    CMP AL, 'I'
    JE PRINTV 
    
    CMP AL, 'I'
    JE PRINTV
    
    CMP AL, 'O'
    JE PRINTV
    
    CMP AL, 'O'
    JE PRINTV
    
    CMP AL, 'U'
    JE PRINTV
    
    CMP AL, 'U'
    JE PRINTV  
    
    LEA DX, C
    MOV AH, 9
    INT 21H
    JMP EXIT
    
    PRINTV:
        LEA DX, V
        MOV AH, 9
        INT 21H
        JMP EXIT  
    
    EXIT: 
    ;exit to DOS                  
    MOV AX,4C00H 
    INT 21H  
 
MAIN ENDP 
END MAIN  