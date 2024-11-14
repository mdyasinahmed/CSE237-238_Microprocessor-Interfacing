.model small
.stack 100h
.data

msg1 db "Enter 1st number: $"
msg2 db "Enter 2nd number: $" 

msg_div db "Division result:$"
quotient db "Quotient: $"
remainder db "Remainder: $" 

quotientR db ?
remainderR db ?

.code
main proc
mov ax,@data
mov ds,ax

lea dx,[msg1]
mov ah,9
int 21h

mov ah,1
int 21h
sub al,30h
mov bl,al

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

lea dx,[msg2]
mov ah,9
int 21h

mov ah,1
int 21h
sub al,30h
mov cl,al

mov al,bl
mov ah,0
div cl
add al,30h
add ah,30h
mov [quotientR],al
mov [remainderR],ah

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

lea dx,[msg_div]
mov ah,9
int 21h

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

lea dx,[quotient]
mov ah,9
int 21h 

mov dl,[quotientR]
mov ah,2
int 21h

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

lea dx,[remainder]
mov ah,9
int 21h

mov dl,[remainderR]
mov ah,2
int 21h      

mov ax, 4C00h
int 21h
main endp
end main