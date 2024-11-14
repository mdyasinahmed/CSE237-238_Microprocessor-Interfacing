.model small
.stack 100h
.data

a db "Please enter a char: $"
b db "Inserted char: $"

.code
main proc
mov ax,@data
mov ds,ax

lea dx,[a]
mov ah,9 ;For 
int 21h


mov ah,1 ;For take input
int 21h
;sub al,30h ;substract 30h to show symbol

mov bl,al
        
mov ah,2  ;For get output     
mov dl,0dh ;To print in left start point
int 21h
mov dl,0ah ;To print new line
int 21h

lea dx,[b]
mov ah,9
int 21h

mov dl,bl
;add dl,30h ;addition 30h to show charecter
mov ah,2
int 21h

    

mov ax, 4C00h
int 21h    
main endp
end main
