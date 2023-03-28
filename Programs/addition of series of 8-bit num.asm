ASSUME CS:CODE, DS:DATA
DATA SEGMENT
    LIST DB 52H,23H
    COUNT EQU 100D          ; no of bytes to be added
    RESULT DW 01H DUP(?)    ; 1 word reserved for result
    DATA ENDS


CODE SEGMENT
ORG 100H                    ; address 0100h in cs
START:  MOV AX,DATA
        MOV DS,AX
        MOV CX,COUNT        ; no of bytes to be added in cx
        XOR AX,AX           ; clear ax and cf
        XOR BX,BX           ; clear bh for byte to word conversion
        
        MOV SI,OFFSET LIST   ; points to first num in list
        
AGAIN:  MOV BL,[SI]          ; takes first num in bl
        ADD AX,BX
        INC SI               ; increment ptr to byte list
        DEC CX               ; decrement counter
        JNZ AGAIN            ; if over,point to result
        
        MOV [DI],AX
        MOV AH,4CH           ; return to dos
        INT 21H
        
        CODE ENDS
END START
          
          
    ; whenever program is loaded to memory,the executable code starts at offset 0100h due to ORG 100H


