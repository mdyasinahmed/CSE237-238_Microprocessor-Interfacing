.MODEL SMALL
.STACK 100H
.DATA
    msg1 db "Enter a character: $"
    msg2 db "Enter an uppercase letter: $"
    result1 db "result: $"
    result2 db "Lowercase: $"

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX
    
    ;a)
    LEA DX, msg1      
    MOV AH, 9            
    INT 21H              
                       
    MOV AH, 1            
    INT 21H              
    MOV BL, AL           

    
    LEA DX, result1   
    MOV AH, 9           
    INT 21H             
    
    MOV DL,BL
    MOV AH, 2           
    INT 21H 
    
    MOV AH, 2           
    MOV DL, 0DH         
    INT 21H              
    MOV DL, 0AH          
    INT 21H             

    
    ;b)
    LEA DX, msg2      
    MOV AH, 9            
    INT 21H              

    MOV AH, 1            
    INT 21H
    MOV BL,AL           

   
    ADD BL, 32          
              

    
    LEA DX, result2  
    MOV AH, 9            
    INT 21H              
    
    MOV DL, BL
    MOV AH, 2           
    INT 21H
    
    MOV AH, 2           
    MOV DL, 0DH         
    INT 21H              
    MOV DL, 0AH          
    INT 21H              

    
    
    ;c)
    LEA DX, msg2      
    MOV AH, 9            
    INT 21H             

    MOV AH, 1           
    INT 21H
    MOV bl,al             

    
    ADD bl, 32                  

  
    MOV AH, 2           
    MOV DL, 0DH         
    INT 21H              
    MOV DL, 0AH          
    INT 21H             
    
    LEA DX, result1   
    MOV AH, 9           
    INT 21H 
    
    MOV DL, BL 
    MOV AH, 2            
    INT 21H             

    
    MOV AX, 4C00H       
    INT 21H
MAIN ENDP
END MAIN
