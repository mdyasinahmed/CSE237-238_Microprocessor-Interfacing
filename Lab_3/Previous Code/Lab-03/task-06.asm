.STACK 100H
 
.DATA
    MSG_1  DB 'Enter the Hex digit (A-F): $'    ; Message prompting the user for input
    MSG_2  DB 0DH, 0AH, 'The corresponding Decimal digit is: $'  ; Result message
 
.CODE
MAIN PROC
    MOV AX, @DATA                ; Initialize DS
    MOV DS, AX

    ; Display MSG_1 to prompt user for input
    LEA DX, MSG_1              ; Corrected: Directly use MSG_1
    MOV AH, 9
    INT 21H

    ; Read the hex digit input (A-F)
    MOV AH, 1                   
    INT 21H

    MOV BL, AL                   ; Save the hex digit into BL

    ; Display MSG_2
    LEA DX, MSG_2              ; Corrected: Directly use MSG_2
    MOV AH, 9
    INT 21H

    ; Display the first decimal digit ('1')
    MOV AH, 2                    
    MOV DL, 31H                  ; '1' in ASCII
    INT 21H

    ; Convert hex digit (A-F) to its decimal value (A=10, B=11, ..., F=15)
    SUB BL, 11H                  ; Adjust for ASCII A-F (A=41H -> 10, B=42H -> 11, ..., F=46H -> 15)

    ; Display the second decimal digit (converted value)
    MOV DL, BL                   
    INT 21H

    MOV AH, 4CH                  ; Return control to DOS
    INT 21H
MAIN ENDP

END MAIN
