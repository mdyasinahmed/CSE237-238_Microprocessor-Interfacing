.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB 'Enter first number (0-9): $'
    msg2 DB 'Enter second number (0-9): $'
    msg_add DB 'Addition Result: $'
    msg_sub DB 'Subtraction Result: $'
    msg_mul DB 'Multiplication Result: $'
    msg_div DB 'Division Result: $'
    newline DB 0DH, 0AH, '$'

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Display message to take first number
    LEA DX, msg1
    MOV AH, 09H
    INT 21H

    ; Take first number as input
    MOV AH, 01H          ; DOS function to take single character input
    INT 21H              ; Call DOS interrupt
    SUB AL, '0'          ; Convert ASCII to integer
    MOV BL, AL           ; Store first number in BL

    ; Display message to take second number
    LEA DX, msg2
    MOV AH, 09H
    INT 21H

    ; Take second number as input
    MOV AH, 01H          ; DOS function to take single character input
    INT 21H              ; Call DOS interrupt
    SUB AL, '0'          ; Convert ASCII to integer
    MOV BH, AL           ; Store second number in BH

    ; Addition
    LEA DX, newline
    MOV AH, 09H
    INT 21H               ; Print new line
    
    LEA DX, msg_add       ; Display addition result message
    MOV AH, 09H
    INT 21H

    MOV AL, BL            ; Load first number
    ADD AL, BH            ; AL = BL + BH
    ADD AL, '0'           ; Convert to ASCII
    MOV DL, AL
    MOV AH, 02H           ; Display result
    INT 21H

    ; Subtraction
    LEA DX, newline
    MOV AH, 09H
    INT 21H               ; Print new line

    LEA DX, msg_sub       ; Display subtraction result message
    MOV AH, 09H
    INT 21H

    MOV AL, BL            ; Load first number
    SUB AL, BH            ; AL = BL - BH
    ADD AL, '0'           ; Convert to ASCII
    MOV DL, AL
    MOV AH, 02H           ; Display result
    INT 21H

    ; Multiplication
    LEA DX, newline
    MOV AH, 09H
    INT 21H               ; Print new line

    LEA DX, msg_mul       ; Display multiplication result message
    MOV AH, 09H
    INT 21H

    MOV AL, BL            ; Load first number
    MUL BH                ; Multiply AL by BH, result in AX
    ADD AL, '0'           ; Convert to ASCII (assuming result is < 10)
    MOV DL, AL
    MOV AH, 02H           ; Display result
    INT 21H

    ; Division
    LEA DX, newline
    MOV AH, 09H
    INT 21H               ; Print new line

    LEA DX, msg_div       ; Display division result message
    MOV AH, 09H
    INT 21H

    MOV AL, BL            ; Load first number
    MOV AH, 00            ; Clear AH for division
    DIV BH                ; Divide AL by BH, quotient in AL, remainder in AH
    ADD AL, '0'           ; Convert quotient to ASCII
    MOV DL, AL
    MOV AH, 02H           ; Display result
    INT 21H

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
