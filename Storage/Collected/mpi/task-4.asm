.model small
.stack 100h
.data

A db ?
B db ?
result_msg db "The Sum of $"
and_is db " and $"
is_msg db " is $"

.code
main proc
mov ax,@data
mov ds,ax

mov ah,1
int 21h
sub al,48
mov [A],al

mov ah,1
int 21h
sub al,48
mov [B],al

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

mov bl,[A]
mov cl,[B]
add bl,cl
add bl,48
add [A],48
add [B],48

lea dx,[result_msg]
mov ah,9
int 21h

mov dl,[A]
mov ah,2
int 21h

lea dx,[and_is]
mov ah,9
int 21h

mov dl,[B]
mov ah,2
int 21h

lea dx,[is_msg]
mov ah,9
int 21h

mov dl,bl
mov ah,2
int 21h
  

mov ax, 4C00h
int 21h
main endp
end main