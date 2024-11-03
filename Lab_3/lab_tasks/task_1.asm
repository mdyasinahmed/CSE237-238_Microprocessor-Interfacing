.MODEL SMALL
.STACK 100H
.DATA  
    input1  DB 'Enter first number (0-9): $'
    prompt2  DB 'Enter second number (0-9): $'
    addMsg   DB 'Addition: $'
    subMsg   DB 'Subtraction: $'
    mulMsg   DB 'Multiplication: $'
    divMsg   DB 'Division: $'
    newLine  DB 0Dh, 0Ah, '$'
    result   DB 'Result: $'
    firstNum DB 0
    secondNum DB 0
    charInput DB 0

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Prompt for first number
    LEA DX, input1
    MOV AH, 09H
    INT 21H

    ; Take first number as input
    MOV AH, 01H   ; Function to read single character
    INT 21H
    SUB AL, 30H   ; Convert ASCII to number
    MOV firstNum, AL

    ; Print new line
    LEA DX, newLine
    MOV AH, 09H
    INT 21H

    ; Prompt for second number
    LEA DX, prompt2
    MOV AH, 09H
    INT 21H

    ; Take second number as input
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV secondNum, AL

    ; Print new line
    LEA DX, newLine
    MOV AH, 09H
    INT 21H

    ; ============= ADDITION ================
    MOV AL, firstNum
    ADD AL, secondNum
    CALL PrintResult
    LEA DX, addMsg
    MOV AH, 09H
    INT 21H
    CALL PrintResult

    ; ============= SUBTRACTION ==============
    MOV AL, firstNum
    SUB AL, secondNum
    CALL PrintResult
    LEA DX, subMsg
    MOV AH, 09H
    INT 21H
    CALL PrintResult

    ; ============= MULTIPLICATION ===========
    MOV AL, firstNum
    MOV BL, secondNum
    MUL BL
    CALL PrintResult
    LEA DX, mulMsg
    MOV AH, 09H
    INT 21H
    CALL PrintResult

    ; ============= DIVISION ================
    MOV AL, firstNum
    MOV BL, secondNum
    CMP BL, 0      ; Check for division by zero
    JE SkipDiv
    DIV BL
    CALL PrintResult
    LEA DX, divMsg
    MOV AH, 09H
    INT 21H
    CALL PrintResult
SkipDiv:

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H
MAIN ENDP

; PrintResult procedure
PrintResult PROC
    ADD AL, 30H  ; Convert result to ASCII
    MOV DL, AL   ; Load result in DL for printing
    MOV AH, 02H  ; Function to display a character
    INT 21H
    RET
PrintResult ENDP

END MAIN
