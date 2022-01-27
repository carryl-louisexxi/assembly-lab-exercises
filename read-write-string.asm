.MODEL SMALL
.DATA   
    MSG1 DB 10,13,"ENTER WORD:", '$'
    MSG2 DB 10,13,"FIRST CAPITAL LETTER: ", '$'
    MSG3 DB 10,13,"LAST CAPITAL LETTER: ", '$' 
    
.CODE     
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,09H
    INT 21H
    
    MOV AH,01H  ;read entered key  
PRINT:
    INT 21H        ;print
    
    MOV BL,AL
    
    CMP BL,13       ;comparing enter key
    JE END          ;end
                          
    CMP BL,                      
    
    LOOP PRINT      ;loop
    
END:
    MOV AH,4CH
    INT 21H
END        
