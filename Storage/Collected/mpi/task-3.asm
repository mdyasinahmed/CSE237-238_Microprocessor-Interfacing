.model small
.stack 100h
.data

msg db "Enter an uppercase letter: $"
msg2 db "Lowercase letter is: $"

.code
main proc
mov ax,@data
mov ds,ax
 
lea dx,[msg]
mov ah,9
int 21h

mov ah,1
int 21h
add al,32
mov bl,al
 

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

lea dx,[msg2]
mov ah,9
int 21h

mov dl,bl
mov ah,2
int 21h

    

mov ax, 4C00h
int 21h
main endp
end main