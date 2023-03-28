PRINT MACRO MES ; macro of name print which is use for display the message
MOV AH,09H
LEA DX,MES
INT 21H
ENDM
DATA SEGMENT
MES1 DB "Hey there back again with film recaps " ,0DH,0AH,'$'
MES2 DB "MPI lab exam$"
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START: MOV AX,DATA
MOV DS,AX
PRINT MES1 ;calling macro
PRINT MES2 ;calling macro
MOV AX,4CH
INT 21H
CODE ENDS
END START