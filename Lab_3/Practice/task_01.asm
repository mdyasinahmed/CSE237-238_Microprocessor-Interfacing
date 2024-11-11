.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
    X db "Enter a Character: $"
    Y db "Your Entered Character is: $"
.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here 
    
    ; printing the message prompt
    LEA DX, X
    MOV AH, 09
    INT 21H
    
    
    ; INPUT PART
    MOV AH, 01
    INT 21H 
    
    MOV BL, AL  ; STORING INPUT IN BL
    
    
    ; OUTPUT PART
    MOV AH, 02
    MOV DL, 0AH  ; NEW LINE
    INT 21H
    
    MOV DL, 0DH  ; CURSOR RETURN
    INT 21H            
    
    ; printing the output message prompt
    LEA DX, Y
    MOV AH, 09
    INT 21H
    
    ; PRINTING OUTPUT
    MOV DL, BL  
    MOV AH, 02
    INT 21H
    
 
 
;exit to DOS  
                
MOV AX,4C00H 
INT 21H  
 
MAIN ENDP 
END MAIN  