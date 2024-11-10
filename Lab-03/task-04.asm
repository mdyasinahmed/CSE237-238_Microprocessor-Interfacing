.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB 'The Sum of $'     ; Message "The Sum of "
    msg2 DB ' and $'           ; Message " and "
    msg3 DB ' is $'            ; Message " is "
    sum_msg DB 'The sum is: $' ; To display the sum
    newline DB 0AH, 0DH, '$'   ; Newline for formatting

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX
    
    ; Read first decimal digit
    MOV AH, 1                  ; DOS function to read a character from input
    INT 21H                    ; Call DOS interrupt
    SUB AL, '0'                ; Convert ASCII to integer
    MOV BL, AL                 ; Store the first digit in BL

    ; Read second decimal digit
    MOV AH, 1                  ; DOS function to read a character from input
    INT 21H                    ; Call DOS interrupt
    SUB AL, '0'                ; Convert ASCII to integer
    MOV CL, AL                 ; Store the second digit in CL

    ; Calculate the sum
    ADD BL, CL                 ; BL = BL + CL (sum of the digits)
    
    ; Display "The Sum of "
    MOV AH, 09H
    LEA DX, msg1
    INT 21H

    ; Display first digit
    MOV AH, 02H
    MOV DL, BL
    ADD DL, '0'                ; Convert the sum to ASCII
    INT 21H

    ; Display " and "
    MOV AH, 09H
    LEA DX, msg2
    INT 21H

    ; Display second digit
    MOV AH, 02H
    MOV DL, CL
    ADD DL, '0'                ; Convert the second digit to ASCII
    INT 21H

    ; Display " is "
    MOV AH, 09H
    LEA DX, msg3
    INT 21H

    ; Display the sum
    MOV AH, 02H
    MOV DL, BL
    ADD DL, '0'                ; Convert the sum to ASCII
    INT 21H

    ; Display a newline
    MOV AH, 09H
    LEA DX, newline
    INT 21H

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN
