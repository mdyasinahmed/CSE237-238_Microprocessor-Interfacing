.MODEL SMALL
.STACK 100H
.DATA
    quotient DB 'Quotient: $'
    remainder DB 'Remainder: $'
    newline DB 13, 10, '$'  ; Carriage return and line feed for a new line
    result DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ; part 1: calculation
    mov al, 5       
    add al, 9
           
    mov bl, 5       
    sub bl, 3 
          
    mul bl 
               
    sub al, 3         
    add al, 2
             
    mov bl, 4         
    div bl            
    
    
    ; printing part
    mov ah, 09h       
    lea dx, quotient
    int 21h           

    mov result, al    
    add result, 30h   
    mov dl, result
    mov ah, 02h       
    int 21h           

    lea dx, newline
    mov ah, 09h
    int 21h           

    lea dx, remainder
    mov ah, 09h
    int 21h           

    mov result, ah    
    add result, 30h   
    mov dl, result
    mov ah, 02h       
    int 21h           

    MOV AX,4C00H
    INT 21H

MAIN ENDP
END MAIN
