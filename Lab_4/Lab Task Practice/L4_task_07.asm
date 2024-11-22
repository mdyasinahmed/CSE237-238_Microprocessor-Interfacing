.MODEL SMALL
.STACK 100H
.DATA
    E DB 'NUMBER IS EVEN$'
    O DB 'NUMBER IS ODD$'

.CODE
MAIN PROC

    MOV AX, @DATA        ; INITIALIZE DATA SEGMENT
    MOV DS, AX
    
    MOV AH, 1            ; READ A CHARACTER INPUT
    INT 21H
    
    SUB AL, '0'          ; CONVERT ASCII TO NUMBER
    MOV AH, 0            ; CLEAR AH TO PREPARE FOR DIVISION
    MOV BL, 2            ; DIVISOR IS 2
    DIV BL               ; DIVIDE AL BY BL 
    
    ; IF CONDITIONS
    CMP AH, 0            ; CHECK REMAINDER IN AH
    JE DISP_EVEN         ; IF REMAINDER IS 0, NUMBER IS EVEN
    
    ; ELSE CONDITIONS
    LEA DX, O            ; LOAD ADDRESS OF "ODD" MESSAGE
    MOV AH, 9            ; DISPLAY STRING FUNCTION
    INT 21H
    JMP EXIT             ; EXIT PROGRAM
    
    DISP_EVEN:
        LEA DX, E            ; LOAD ADDRESS OF "EVEN" MESSAGE
        MOV AH, 9            ; DISPLAY STRING FUNCTION
        INT 21H
        
    EXIT:
        MOV AX, 4C00H        ; TERMINATE PROGRAM
        INT 21H

MAIN ENDP
END MAIN
