.MODEL SMALL
.STACK 100H
.DATA
num1 db 'Enter first number (0-9): $'       
num2 db 'Enter second number (0-9): $'      

addResult db 'Addition result: $'           
subResult db 'Subtraction result: $'        
mulResult db 'Multiplication result: $'      
divResult db 'Division result (Quotient): $' 
remResult db 'Remainder: $'                 ; For displaying remainder in division

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt for the first number and take input
    LEA DX, num1
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, '0'            ; Convert ASCII to numeric
    MOV BL, AL             ; Store the first number in BL

    ; Display prompt for the second number and take input
    LEA DX, num2
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, '0'            ; Convert ASCII to numeric
    MOV CL, AL             ; Store the second number in CL

    ; Addition Operation
    MOV AL, BL
    ADD AL, CL             ; Perform addition
    ADD AL, '0'            ; Convert result to ASCII for display
    LEA DX, addResult
    MOV AH, 9
    INT 21H                ; Print "Addition result: "
    MOV DL, AL
    MOV AH, 2
    INT 21H                ; Print the addition result

    ; Subtraction Operation
    MOV AL, BL
    SUB AL, CL             ; Perform subtraction
    ADD AL, '0'            ; Convert result to ASCII for display
    LEA DX, subResult
    MOV AH, 9
    INT 21H                ; Print "Subtraction result: "
    MOV DL, AL
    MOV AH, 2
    INT 21H                ; Print the subtraction result

    ; Multiplication Operation
    MOV AL, BL
    MUL CL                 ; Perform multiplication (result is in AX)
    MOV DL, AH             ; Save higher byte if it overflows
    ADD AL, '0'            ; Convert low byte to ASCII for display
    LEA DX, mulResult
    MOV AH, 9
    INT 21H                ; Print "Multiplication result: "
    MOV DL, AL
    MOV AH, 2
    INT 21H                ; Print the lower digit of multiplication result

    ; Check if there is overflow (i.e., AH is not zero)
    CMP DL, 0
    JE SKIP_OVERFLOW
    ADD DL, '0'            ; Convert high byte to ASCII
    MOV AH, 2
    INT 21H                ; Print the higher digit if overflow occurred

SKIP_OVERFLOW:

    ; Division Operation
    MOV AL, BL
    MOV AH, 0
    DIV CL                 ; Perform division (quotient in AL, remainder in AH)
    ADD AL, '0'            ; Convert quotient to ASCII for display
    LEA DX, divResult
    MOV AH, 9
    INT 21H                ; Print "Division result (Quotient): "
    MOV DL, AL
    MOV AH, 2
    INT 21H                ; Print the quotient

    ; Display remainder
    MOV AL, AH
    ADD AL, '0'            ; Convert remainder to ASCII for display
    LEA DX, remResult
    MOV AH, 9
    INT 21H                ; Print "Remainder: "
    MOV DL, AL
    MOV AH, 2
    INT 21H                ; Print the remainder

    ; Exit program
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
