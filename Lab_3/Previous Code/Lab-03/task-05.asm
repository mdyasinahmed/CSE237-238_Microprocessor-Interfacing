.MODEL SMALL
.STACK 100H
.DATA
    prompt DB 'Enter Three Initials: $'  ; Prompt message
    newline DB 0AH, 0DH, '$'             ; Newline for formatting

    input_buffer DB 5, 0, 5 DUP (?)      ; Input buffer: max 5 chars (1 for length, 1 for newline, 3 for input)

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt message
    MOV AH, 09H
    LEA DX, prompt
    INT 21H

    ; Read input string (up to 3 characters)
    MOV AH, 0AH                 ; DOS function to read a string
    LEA DX, input_buffer        ; Load the address of the buffer
    INT 21H                     ; Call DOS interrupt to read input

    ; Print a newline after taking the input
    MOV AH, 09H
    LEA DX, newline
    INT 21H                     ; Print newline

    ; Display the first character (from input_buffer + 2)
    MOV DL, [input_buffer + 2]  ; Load the first character from the input string
    MOV AH, 02H                 ; DOS function to print a character
    INT 21H                     ; Display the character

    ; Display newline (0AH = linefeed, 0DH = carriage return)
    MOV AH, 09H
    LEA DX, newline
    INT 21H                     ; Print newline

    ; Display the second character (from input_buffer + 3)
    MOV DL, [input_buffer + 3]  ; Load the second character
    MOV AH, 02H
    INT 21H                     ; Display the second character

    ; Display newline
    MOV AH, 09H
    LEA DX, newline
    INT 21H                     ; Print newline

    ; Display the third character (from input_buffer + 4)
    MOV DL, [input_buffer + 4]  ; Load the third character
    MOV AH, 02H
    INT 21H                     ; Display the third character

    ; Display newline
    MOV AH, 09H
    LEA DX, newline
    INT 21H                     ; Print newline

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H

MAIN ENDP

END MAIN
