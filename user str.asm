D segment

mes1 db "enter a string :$" ; the message to display

n1 db 0Dh, 0Ah,'$' ;for newline

mes2 db "string entered :$" ;the message to display

str_buf db 255,256 dup("$") ;array of size 256 where the last poist contains $

D ends

C segment
start:

assume CS:C, DS:D

mov ax, D
mov ds, ax
mov ah,09h ; this will display the mes1
lea dx,mes1
int 21h

mov ah,0ah ; this take buffer input
lea dx,str_buf
int 21h

mov ah,09h ;for newline
lea dx,n1
int 21h

mov ah,09h ; display the mes2
lea dx,mes2
int 21h

mov ah,09h ; it will display the scanned string
mov dx,offset str_buf  ; just to avoid garbage issue
int 21h

mov ah,4CH
int 21h
C ends
end start