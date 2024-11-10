.MODEL SMALL
.STACK 100H
.DATA
    msg DB 'Enter an uppercase letter: $'
    newline DB 0DH, 0AH, '$' ; Carriage return and line feed for a new line

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Display the prompt message
    LEA DX, msg
    MOV AH, 09H             ; DOS function to display a string
    INT 21H                 ; Call DOS interrupt

    ; Read a character from the user
    MOV AH, 01H             ; DOS function to take single character input
    INT 21H                 ; Call DOS interrupt
    MOV BL, AL              ; Store the character in BL register

    ; Convert the uppercase letter to lowercase
    ADD BL, 20H             ; ASCII conversion: Add 32 (20H) to make uppercase to lowercase

    ; Move to the next line
    LEA DX, newline         ; Load the address of newline characters
    MOV AH, 09H             ; DOS function to display a string
    INT 21H                 ; Call DOS interrupt

    ; Display the lowercase character on the new line
    MOV DL, BL              ; Load the lowercase character into DL
    MOV AH, 02H             ; DOS function to display a single character
    INT 21H                 ; Call DOS interrupt

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
