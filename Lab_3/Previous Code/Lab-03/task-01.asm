.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB 'Please insert a character: $'
    newline DB 0DH, 0AH, '$' ; Carriage return and line feed for a new line

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display the message "Please insert a character: "
    LEA DX, msg1          ; Load effective address of msg1 into DX
    MOV AH, 09H           ; DOS function to display a string
    INT 21H               ; Call DOS interrupt
    
    ; Take a character input from user
    MOV AH, 01H           ; DOS function to take single character input
    INT 21H               ; Call DOS interrupt
    MOV BL, AL            ; Store the character in BL register for display later
    
    ; Move to a new line
    LEA DX, newline       ; Load effective address of newline into DX
    MOV AH, 09H           ; DOS function to display a string
    INT 21H               ; Call DOS interrupt
    
    ; Display the character entered by the user
    MOV AH, 02H           ; DOS function to display a single character
    MOV DL, BL            ; Move character to DL (to display it)
    INT 21H               ; Call DOS interrupt

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
