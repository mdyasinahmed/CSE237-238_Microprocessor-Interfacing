.MODEL SMALL
.STACK 100H
.DATA
   a db 'total result: $'
   b db 'quotient: $'
.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX   

;enter your code here
    ; (9 + (5X2) - 7 + 4)/(4+4)     
    mov al, 5
    mov bl, 2
    mul bl  
    
    add al, 9
    sub al, 7
    
    add al, 4 
    
    mov bl, 4
    add bl, 1
    
    div bl
     
;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN   

