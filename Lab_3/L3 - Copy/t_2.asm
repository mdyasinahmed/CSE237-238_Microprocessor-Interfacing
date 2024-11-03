.MODEL SMALL
.STACK 100H
.DATA
num1 DB ?          ; First number (input as ASCII)
num2 DB ?          ; Second number (input as ASCII)
result DB ?        ; Result of the operation (in ASCII)
newline DB 13, 10, '$' ; Newline for formatting

addMsg DB 'Addition: $'
subMsg DB 'Subtraction: $'
mulMsg DB 'Multiplication: $'
divMsg DB 'Division: $'

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; --- Input first number ---
    MOV AH, 01H           ; Read a character from input
    INT 21H
    SUB AL, '0'           ; Convert ASCII to integer
    MOV num1, AL          ; Store as num1

    ; --- Input second number ---
    MOV AH, 01H           ; Read another character
    INT 21H
    SUB AL, '0'           ; Convert ASCII to integer
    MOV num2, AL          ; Store as num2

    ; --- Perform Addition ---
    MOV AL, num1          ; Load num1
    ADD AL, num2          ; Add num2
    ADD AL, '0'           ; Convert result to ASCII
    MOV result, AL        ; Store the result

    ; Display addition result
    LEA DX, newline
    MOV AH, 09H
    INT 21H
    LEA DX, addMsg
    MOV AH, 09H
    INT 21H
    MOV DL, result
    MOV AH, 02H
    INT 21H

    ; --- Perform Subtraction ---
    MOV AL, num1          ; Load num1
    SUB AL, num2          ; Subtract num2
    ADD AL, '0'           ; Convert result to ASCII
    MOV result, AL        ; Store the result

    ; Display subtraction result
    LEA DX, newline
    MOV AH, 09H
    INT 21H
    LEA DX, subMsg
    MOV AH, 09H
    INT 21H
    MOV DL, result
    MOV AH, 02H
    INT 21H

    ; --- Perform Multiplication ---
    MOV AL, num1          ; Load num1
    MOV BL, num2          ; Load num2
    MUL BL                ; Multiply AL by BL, result in AX
    ADD AL, '0'           ; Convert result to ASCII (only if result fits in AL)
    MOV result, AL        ; Store the result

    ; Display multiplication result
    LEA DX, newline
    MOV AH, 09H
    INT 21H
    LEA DX, mulMsg
    MOV AH, 09H
    INT 21H
    MOV DL, result
    MOV AH, 02H
    INT 21H

    ; --- Perform Division ---
    MOV AL, num1          ; Load num1
    MOV BL, num2          ; Load num2
    DIV BL                ; Divide AL by BL, quotient in AL
    ADD AL, '0'           ; Convert result to ASCII
    MOV result, AL        ; Store the result

    ; Display division result
    LEA DX, newline
    MOV AH, 09H
    INT 21H
    LEA DX, divMsg
    MOV AH, 09H
    INT 21H
    MOV DL, result
    MOV AH, 02H
    INT 21H

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
