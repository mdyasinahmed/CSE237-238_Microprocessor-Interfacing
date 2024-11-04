.MODEL SMALL
.STACK 100H
.DATA
    
.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
;enter your code here
    
    ; 5 + 9
    mov al, 5       
    add al, 9       

    ;5 - 3
    mov bl, 5       
    sub bl, 3      

    mul bl    

    ; 28 - 3
    sub al, 3      

    ; 25 + 2
    add al, 2       

    ; 27 / 4
    mov bl, 4      
    div bl   
    
        
;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN   

