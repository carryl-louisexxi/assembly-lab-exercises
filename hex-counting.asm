.MODEL SMALL
.DATA  
    MSG1 DB 10,13,"Enter hex number: ",'$'
    MSG2 DB 10,13, "Display" ,'$'
    MSG3 DB 10,13, "Illegal character ", '$'  
    MSG4 DB 10,13, "Do you want to do again? (Y/N) :", '$'
.CODE 
START:
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX,MSG1
    MOV AH,09H
    INT 21H  
    
    MOV AH,01H
    INT 21H    
    
    MOV BL,48
    MOV BH,65  
    
    
    MOV DL,AL
    
    CMP AL, 57
    JLE NUMCHECK 
    
    MOV BL,BH  
        
    CMP AL, 65
    JGE ALPHACHECK  
    
    JMP ILLCHAR
NUMCHECK:
    CMP BL,AL 
    JE DISPLAY
    
    INC BL
    
    CMP BL,58
    JE ILLCHAR
    LOOP NUMCHECK 
ALPHACHECK:
    CMP BL,AL
    JE DISPLAY1   
    
    INC BL 
    
    CMP BL,71
    JE ILLCHAR  
    
    LOOP ALPHACHECK     
ILLCHAR:
    LEA DX,MSG3
    MOV AH,09H
    INT 21H 
    JMP DOAGAIN
DISPLAY:     
    MOV AH,02H
    INT 21H   
    
    DEC BL
    
    CMP BL,48
    JE DOAGAIN           
    
    LOOP DISPLAY  
DISPLAY1:       
    MOV AH,02H
    INT 21H   
    
    DEC BL
    
    CMP BL,55
    JE DOAGAIN           
    
    LOOP DISPLAY1   
 
DOAGAIN:
    LEA DX,MSG4
    MOV AH,09H
    INT 21H
    
    MOV AH,01H
    INT 21H
    
    CMP AL,89
    JE START 
    CMP AL,121
    JE START
    
    CMP AL,78
    JE EXIT 
    CMP AL,110
    JE EXIT 
    
    LOOP DOAGAIN  
    
EXIT:
    MOV AH,4CH
    INT 21H 
END