.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
 
.CODE  
MAIN PROC  
 
; Initialize DS  
    MOV AX, @DATA  
    MOV DS, AX  
  
; TASK 01: Take a number in AX. If it's a negative number, replace it with 5.
    
    ; KEEPING VALUE IN AX
    MOV AX, 3
    NEG AX
    
    ; COMPARING
    CMP AX, 0
    
    ; IF CONDITION
    JL CON
    
    ; ELSE CONDITION
    JMP EXIT
    
    CON:
    MOV AX, 5     ; EXECUTING IF
    
    EXIT:             
    MOV AX, 4C00H      ; EXECUTING ELSE
    INT 21H  
     
MAIN ENDP 
END MAIN
