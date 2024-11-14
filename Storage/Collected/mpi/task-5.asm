.model small
.stack 100h
.data

msg db "Enter Three Initials: $" 
x db ?
y db ?
z db ?

.code
main proc
mov ax,@data
mov ds,ax

lea dx,[msg]
mov ah,9
int 21h

mov ah,1
int 21h
mov [x],al

mov ah,1
int 21h
mov [y],al

mov ah,1
int 21h
mov [z],al

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

mov dl,[x]
mov ah,2
int 21h

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

mov dl,[y]
mov ah,2
int 21h

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

mov dl,[z]
mov ah,2
int 21h

mov ax, 4C00h
int 21h
main endp
end main