.MODEL SMALL
  
.STACK 100H 
  
.DATA  
    a db 5
    b db 4 
    output db "Total: $"
  
.CODE  
MAIN PROC  
  
; Initialize DS  
    MOV AX, @DATA  
    MOV DS, AX  
  
; Enter your code here 
       
    lea dx, output
    mov ah, 09
    int 21h 
    
    mov al, a         
    mov ah, b         
    add al, ah 
    
    add al, 30h       
    
    mov ah, 02h       
    mov dl, al        
    int 21h           
        
; Exit to DOS                  
    MOV AX, 4C00H  
    INT 21H  
  
MAIN ENDP  
END MAIN  
