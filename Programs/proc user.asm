include 'emu8086.inc' 

.stack 100h

.model small

.data

arr db 4 dup(?)

.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    mov cx,4 ;(counter=4)all elements to cx
    mov si,offset arr
    
    
   
    
    loop1 :
    mov ah,01h ;for char input from user
    int 21h
    
    mov [si],al ; since the input we take from the user goes to al
               ; we thereby take that values to si(source index reg)
    inc si   ; as values go on adding,we increment si
    
   ;for displaying
   loop loop1
   
   mov dl,10 ;for newline
   mov ah,02h
   int 21h
   
   mov dl,13;for carriage return
   mov ah,02h
   int 21h
   
   print 'Your array:'
   
   mov si,offset arr
   mov cx,4
   
   loop2:
   mov dl,[si]  ; for display purposes,we usually take them down to dx 
   mov ah,02h
   int 21h
   
   mov dl,32   ; for generating space between elements
   mov ah,02h
   int 21h
   
   inc si
   loop loop2
   
   main endp
end main