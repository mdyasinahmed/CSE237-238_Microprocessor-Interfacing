.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC

MOV AX, @DATA
MOV DS, AX
    
    ; TAKING CHARACTER INPUT
    MOV AH, 1
    INT 21H
    
    ; IF CONDITIONS Y/y
    CMP AL, 'Y'
    JE DISPLAY
    CMP AL, 'y'
    JE DISPLAY 
    
    ; ELSE CONDITIONS
    JMP EXIT
    
    ; EXECUTING IF CONDITIONS
    DISPLAY:
        MOV AH, 2
        MOV DL, AL
        INT 21H
    
    ; EXECUTING ELSE CONDITIONS
    EXIT:
        MOV AX, 4C00H
        INT 21H

MAIN ENDP
END MAIN