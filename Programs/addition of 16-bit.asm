; define variables here in data segment
data1 segment     ; data1 name of segment
    var1 dw 2222H ; var1 name of variable, dw declare word, 111H is value
    var2 dw 1111H ; same
    var3 dw 0000H ; var3 to store add value
data1 ends
code1 segment
    Assume CS:code1, DS: data1 ; maps CS with segment code1 in program
    
    start :
    mov ax, data1 ; loads data1 logical name in ax register
    mov ds, ax    ; loads ax register in data segment
    
    mov ax, var1
    mov bx, var2
    add ax, bx
    mov var3, ax
    
    mov ah, 4ch
    int 21h
    
code1 ends
end start



; [SOURCE]: C:\Program Files\emu8086\MySource\1.asm
