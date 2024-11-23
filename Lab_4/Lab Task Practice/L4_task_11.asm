.MODEL SMALL  

.STACK 100H  

.DATA   
    YES DB "Yes$"
    NO DB "No$"
    PROMPT_BH DB "ENTER SIDE BH: $"
    PROMPT_CH DB "ENTER SIDE CH: $"
    PROMPT_DH DB "ENTER SIDE DH: $"
    NEWLINE DB 0DH, 0AH, '$'

.CODE  
MAIN PROC  

; INITIALIZE DS  
MOV AX, @DATA  
MOV DS, AX  
    ; PROMPT AND INPUT FOR BH
    MOV AH, 09H
    LEA DX, PROMPT_BH
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV BH, AL
    
    ; PRINT NEW LINE BEFORE CH INPUT
    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H
    
    ; PROMPT AND INPUT FOR CH
    MOV AH, 09H
    LEA DX, PROMPT_CH
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV CH, AL
    
    ; PRINT NEW LINE BEFORE DH INPUT
    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H

    ; PROMPT AND INPUT FOR DH
    MOV AH, 09H
    LEA DX, PROMPT_DH
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV DH, AL
    
    ; COMPARING BH, CH
    CMP BH, CH
    JG BHBIG
    JMP CHBIG
    
    ; PRINT NEW LINE BEFORE BH OUTPUT
    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H
    
    ; COMPARING BH, DH
    BHBIG:
        CMP BH, DH
        JG BHBIG2
        JMP DHBIG
        
    ; COMPARING CH, DH
    CHBIG:
        CMP CH, DH
        JG CHBIG2
        JMP DHBIG
    
    ; VERIFYING TRIANGLE
    BHBIG2:
        ADD CH, DH
        CMP CH, BH
        JG PRINTY
        JMP PRINTN
    
    CHBIG2:
        ADD BH, DH
        CMP BH, CH
        JG PRINTY
        JMP PRINTN
    
    DHBIG:
        ADD BH, CH
        CMP BH, DH
        JG PRINTY
        JMP PRINTN
    
    ; PRINT "Y"
    PRINTY:
        MOV AH, 09H
        LEA DX, YES
        INT 21H
        JMP EXIT
    
    ; PRINT "N"
    PRINTN:
        MOV AH, 09H
        LEA DX, NO
        INT 21H

    ; EXIT TO DOS  
    EXIT:                
        MOV AX, 4C00H 
        INT 21H  

MAIN ENDP  
END MAIN
