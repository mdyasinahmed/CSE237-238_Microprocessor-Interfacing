.MODEL SMALL 
  
.STACK 100H 
 
.DATA  
    N1 db "Enter a Number(1-9): $"
    N2 db "Enter a Number(1-9): $"
    
    ADD_RES db "ADDITION RESULT: $"
 
.CODE  
MAIN PROC  
 
;iniitialize DS 
 
MOV AX,@DATA  
MOV DS,AX  
  
;enter your code here  
      ; FIRST NUMBER TAKING PROMPT
      LEA DX, N1
      MOV AH, 09
      INT 21H 
      
      ; FIRST NUMBER INPUT
      MOV AH, 01
      INT 21H
      
      MOV BL, AL ; STORING FIRST NUMBER INTO BL
      
      ; TAKING A NEW LINE
      MOV AH, 02
      MOV DL, 0AH
      INT 21H
      
      ; POSITIONING TO LEFT
      MOV AH, 02
      MOV DL, 0DH
      INT 21H
      
      ; SECOND NUMBER TAKING PROMPT
      LEA DX, N2
      MOV AH, 09
      INT 21H 
      
      ; SECOND NUMBER INPUT
      MOV AH, 01
      INT 21H
      
      MOV BH, AL ; STORING SECOND NUMBER INTO BH 
      
      ; TAKING A NEW LINE
      MOV AH, 02
      MOV DL, 0AH
      INT 21H
      
      ; POSITIONING TO LEFT
      MOV AH, 02
      MOV DL, 0DH
      INT 21H
      
      
      ; PRINTING ADDITION RESULT MESSAGE
      LEA DX, ADD_RES
      MOV AH, 09
      INT 21H
      
      ADD BL, BH
      
      ; PRINTING ADDITION RESULT
      MOV AH, 02
      MOV DL, BL
      INT 21H
      
      

 
;exit to DOS  
                
MOV AX,4C00H 
INT 21H  
 
MAIN ENDP 
END MAIN  