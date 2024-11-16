.MODEL SMALL
  
.STACK 100H 
  
.DATA  
    A DW 10
    B DW 10
    MSG DW " IS GREATER THAN $"
    MSG2 DW "BOTH ARE EQUAL.$"
  
.CODE  
MAIN PROC  
  
; Initialize DS  
    MOV AX, @DATA  
    MOV DS, AX  
  
; Enter your code here 
    MOV AX, A
    MOV BX, B
    
    ; COMPARING
    CMP AX, BX
    JE EQL_CON
    
    ; CONDITIONAL STATEMENTS 
    EQL_CON:
        LEA DX, MSG2
        MOV AH, 09
        INT 21H 
           
        
; Exit to DOS                  
    MOV AX, 4C00H  
    INT 21H  
  
MAIN ENDP  
END MAIN  