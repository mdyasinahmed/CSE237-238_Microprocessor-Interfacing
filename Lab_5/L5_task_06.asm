.MODEL SMALL 

.STACK 100H 

.DATA  
    m DB "ENTER A HEX DIGIT: $"
    n DB "IN DECIMAL IT IS $"
    o DB "DO YOU WANT TO DO IT AGAIN?(y/Y): $"
    p DB "ILLEGAL CHARACTER-ENTER 0..9 OR A..F: $" 

.CODE  
MAIN PROC  

;initialize DS 

MOV AX,@DATA  
MOV DS,AX  

;enter your code here 
    ; Task 06
    BEGIN:
    MOV AH, 9
    LEA DX, m 
    INT 21H
    
    BEGIN2:
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    ; printing new line 
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    
    ; printing carriage return
    MOV DL, 13
    MOV AH, 2
    INT 21H
    
    CMP BL, 30H
    JE PRINT
    
    CMP BL, 31H
    JE PRINT
    
    CMP BL, 32H
    JE PRINT
    
    CMP BL, 33H
    JE PRINT
    
    CMP BL, 34H
    JE PRINT
    
    CMP BL, 35H
    JE PRINT
    
    CMP BL, 36H
    JE PRINT
    
    CMP BL, 37H
    JE PRINT
    
    CMP BL, 38H
    JE PRINT
    
    CMP BL, 39H
    JE PRINT
    
    CMP BL, 41H
    JE PRINT10
    
    CMP BL, 42H
    JE PRINT11
    
    CMP BL, 43H
    JE PRINT12
    
    CMP BL, 44H
    JE PRINT13
    
    CMP BL, 45H
    JE PRINT14
    
    CMP BL, 46H
    JE PRINT15
    
    JMP PRINTE
    
    PRINTE:
    MOV AH, 9
    LEA DX, p
    INT 21H
    JMP BEGIN2
    
    PRINT:
    MOV AH, 9
    LEA DX, n
    INT 21H
    MOV DL, BL
  
    MOV AH, 2
    INT 21H
    JMP NEXT
    
    PRINT10:        
    MOV AH, 9
    LEA DX, n
    INT 21H
    MOV DL, 31H
    MOV AH, 2
    INT 21H
    MOV DL, 30H
    MOV AH, 2
    INT 21H
    
    JMP NEXT
            
    PRINT11:        
    MOV AH, 9
    LEA DX, n
    INT 21H
    MOV DL, 31H
    MOV AH, 2
    INT 21H
    MOV DL, 31H
    MOV AH, 2
    INT 21H
    
    JMP NEXT
    
    PRINT12:        
    MOV AH, 9
    LEA DX, n
    INT 21H
    MOV DL, 31H
    MOV AH, 2
    INT 21H
    MOV DL, 32H
    MOV AH, 2
    INT 21H
    
    JMP NEXT
    
    PRINT13:        
    MOV AH, 9
    LEA DX, n
    INT 21H
    MOV DL, 31H
    MOV AH, 2
    INT 21H
    MOV DL, 33H
    MOV AH, 2
    INT 21H
    
    JMP NEXT
    
    PRINT14:        
    MOV AH, 9
    LEA DX, n
    INT 21H
    MOV DL, 31H
    MOV AH, 2
    INT 21H
    MOV DL, 34H
    MOV AH, 2
    INT 21H
    
    JMP NEXT
    
    PRINT15:        
    MOV AH, 9
    LEA DX, n
    INT 21H
    MOV DL, 31H
    MOV AH, 2
    INT 21H
    MOV DL, 35H
    MOV AH, 2
    INT 21H
    
    JMP NEXT
    
    
    NEXT:
    ;printing new line 
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    
    ;printing carriage return
    MOV DL, 13
    MOV AH, 2
    INT 21H
    
    MOV AH, 9
    LEA DX, o
    INT 21H
    MOV AH, 1
    INT 21H
    
    MOV CL, AL
    
    
    ;printing new line
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    
    ;printing carriage return
    MOV DL, 13
    MOV AH, 2
    INT 21H
    
    
    CMP CL, 'y'
    JE BEGIN
    CMP CL, 'Y'
    JE BEGIN
    JMP EXIT
    
EXIT: 
;exit to DOS  
                
MOV AX,4C00H 
INT 21H  

MAIN ENDP 
END MAIN  
