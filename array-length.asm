ORG 100H
.DATA  
    STR1 DB 10,13, "ENTER YOUR STRING HERE: ",'$'
    STR2 DB 10,13, "YOUR STRING IS: ",'$'
    STR3 DB 10,13, "LENGTH OF STRING: ",'$'  
    INSTR1 DB 20 DUP('$') 
    NEWLINE DB 10,13, '$'
.CODE
START: 
    MOV AX,@DATA
    MOV DS,AX
    
    LEA SI,INSTR1
;get string  
    LEA DX,STR1
    MOV AH,09H
    INT 21H  
    
    MOV AH,0AH
    MOV DX,SI
    INT 21H
    
    LEA DX, NEWLINE
    MOV AH,09H  
    INT 21H     
    
;print string
    LEA DX,STR2
    MOV AH,09H
    INT 21H
    
    LEA DX,INSTR1+2
    MOV AH,09H
    INT 21H
    
    LEA DX,NEWLINE
    MOV AH,09H
    INT 21H
;print the length of teh string
    LEA DX,STR3
    MOV AH,09H
    INT 21H
    
    MOV BL,INSTR1+1
    
    ADD BL,30H
    MOV AH,02H
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH
    INT 21H
END 
     
    



