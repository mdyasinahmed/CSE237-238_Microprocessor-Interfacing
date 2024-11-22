.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
    NUM1 DB 0       ; FIRST INPUT NUMBER
    NUM2 DB 0       ; SECOND INPUT NUMBER
    NUM3 DB 0       ; THIRD INPUT NUMBER
    MAX DB 0        ; MAXIMUM NUMBER
    MIN DB 0        ; MINIMUM NUMBER 
.CODE  
MAIN PROC  
 
; INITIALIZE DS 
MOV AX,@DATA  
MOV DS,AX    
; INPUT THREE NUMBERS
    MOV AH, 1         ; READ A SINGLE CHARACTER
    INT 21H
    SUB AL, 48        ; CONVERT ASCII TO INTEGER
    MOV NUM1, AL      ; STORE FIRST NUMBER

    INT 21H
    SUB AL, 48
    MOV NUM2, AL      ; STORE SECOND NUMBER

    INT 21H
    SUB AL, 48
    MOV NUM3, AL      ; STORE THIRD NUMBER

    ; FIND THE MAXIMUM
    MOV AL, NUM1
    MOV BL, NUM2
    CMP AL, BL
    JGE NEXT1         ; IF NUM1 >= NUM2, CONTINUE
    MOV AL, BL        ; ELSE, MAX = NUM2

    NEXT1:
        MOV BL, NUM3
        CMP AL, BL
        JGE STORE_MAX     ; IF MAX >= NUM3, KEEP MAX
        MOV AL, BL        ; ELSE, MAX = NUM3
    
    STORE_MAX:
        MOV MAX, AL       ; STORE THE MAXIMUM VALUE
    
        ; FIND THE MINIMUM
        MOV AL, NUM1
        MOV BL, NUM2
        CMP AL, BL
        JLE NEXT2         ; IF NUM1 <= NUM2, CONTINUE
        MOV AL, BL        ; ELSE, MIN = NUM2
    
    NEXT2:
        MOV BL, NUM3
        CMP AL, BL
        JLE STORE_MIN     ; IF MIN <= NUM3, KEEP MIN
        MOV AL, BL        ; ELSE, MIN = NUM3
    
    STORE_MIN:
        MOV MIN, AL       ; STORE THE MINIMUM VALUE
    
        ; PRINT A NEWLINE
        MOV AH, 2         ; PRINT FUNCTION
        MOV DL, 0DH       ; CARRIAGE RETURN (CR)
        INT 21H
        MOV DL, 0AH       ; LINE FEED (LF)
        INT 21H
    
        ; PRINT MAXIMUM
        MOV AH, 2
        MOV DL, MAX
        ADD DL, 48        ; CONVERT INTEGER TO ASCII
        INT 21H
    
        ; PRINT A SPACE
        MOV DL, ' '
        INT 21H
    
        ; PRINT MINIMUM
        MOV AH, 2
        MOV DL, MIN
        ADD DL, 48        ; CONVERT INTEGER TO ASCII
        INT 21H

; EXIT TO DOS  
MOV AX,4C00H 
INT 21H  
 
MAIN ENDP 
END MAIN
