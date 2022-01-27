;enter a number know if it is even or odd

.MODEL SMALL
.DATA       
    MSG1 DB 10,13, "Enter nunber from 0 to 9: ", '$'
    MSG2 DB 10,13, "Even", '$'
    MSG3 DB 10,13, "Odd", '$'  
    MSG4 DB 10,13, "Do you want to do it again? (Y/N): ", '$' 
    MSG5 DB 10,13, "Illegal character ", '$'
.CODE    
START:
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG1     ;print msg1
    MOV AH, 09H
    INT 21H         
    
    MOV AH, 01H       ;read key
    INT 21H   
    
    MOV BL,AL
                      
    CMP AL,47
    JLE ILLCHAR   
    
    CMP AL,58
    JGE ILLCHAR
YES:  
    TEST BL,01H
    JE ODD 
    
    LEA DX,MSG3
    MOV AH, 09H
    INT 21H 
    JMP DOAGAIN
ODD: 
    LEA DX,MSG2
    MOV AH,09H
    INT 21H
    JMP DOAGAIN   
ILLCHAR:
    LEA DX,MSG5
    MOV AH,09H
    INT 21H              
    JE DOAGAIN
DOAGAIN:
    LEA DX,MSG4
    MOV AH, 09H
    INT 21H
    
    MOV AH, 01H
    INT 21H
    
    CMP AL,89
    JE START
    CMP AL,78 
    JE EXIT
     
    LOOP DOAGAIN
EXIT:
    MOV AH,4CH
    INT 21H            
END