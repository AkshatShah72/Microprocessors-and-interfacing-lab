data2 segment ; data1 name of segment
var1 dw 2222H ; var1 name of variable, dw declare word, 111H is value
var2 dw 1111H ; same
var3 dw 0000H ; var3 to store add value
data2 ends
code2 segment
Assume CS:code2, DS: data2 ; maps CS with segment code2 in program
start :
mov ax, data2 ; loads data2 logical name of segment in ax register
mov ds, ax ; loads ax register in data segment
mov ax, var1
mov bx, var2
sub ax, bx
mov var3, ax
mov ah, 4ch
int 21h
code2 ends
end start