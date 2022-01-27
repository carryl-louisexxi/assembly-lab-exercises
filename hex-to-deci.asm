.MODEL SMALL
.DATA
    MSG1 DB 10,13,"Enter a hex digit: ", '$'  
    MSG2 DB 10,13,"In decimal it is: ", '$'
    MSG3 DB 10,13,"Do you want to do it agai? (Y/N) :", '$'
    MSG4 DB 10,13,"Illegal Character ", 10,13, "Please enter a character from (0-9) or (A-F): ", '$'
    DONE DB 30H 
.CODE   
START:                
    MOV AX, @DATA
    MOV DS,AX  
         
    LEA DX, MSG1    ;print the msg1
    MOV AH,09H
    INT 21H   
    
    JMP READ   
              
READ:                
                    ;ag na read na message kay naa sa AL
    MOV AH,01H      ;read entered key
    INT 21H          
                       
                       
    MOV BL,48        ;imo gi set si BL to 0
    MOV BH,65        ;BH to A                 
                               
    CMP AL,58
    JLE NUMELOOP  
    
    MOV BL,BH
     
    CMP AL,65  
    JGE ALPHALOOP 
     
                 
    JMP ILLCHAR            
ILLCHAR:
        
    LEA DX,MSG4
    MOV AH,09H
    INT 21H 
    
          
    JMP READ
    
NUMELOOP:
    CMP BL,AL         ;comparing entered key AL TO 0 
    JE  HEX           ;if okay then moadto sya sa hex
    
    INC BL            ;incrementing BL   
    
    CMP BL, 58        ;comparing if the incremented BL if naabot na sya sa 10
    JE  ILLCHAR  ;if naabot na sa 10 then mo adto sya sa illegal char
    
    LOOP NUMELOOP 
ALPHALOOP:   
    CMP AL,BL
    JE  HEX1 
    
    INC BL 
    
    CMP BL, 71
    JE ILLCHAR  
    
    LOOP ALPHALOOP  
HEX:
    LEA DX,MSG2
    MOV AH,09H
    INT 21H
    
    MOV DX,BX      ;ag gisulod si AL to DL
    MOV AH,02H     
    INT 21H     
    JMP DOAGAIN  
HEX1:  
    LEA DX,MSG2
    MOV AH,09H
    INT 21H    
    
    MOV DX, 31H 
    MOV AH, 02H
    INT 21H
            
    SUB BX,17       
    MOV DX,BX                 
    MOV AH,02H     
    INT 21H
    JMP DOAGAIN  
DOAGAIN:
    LEA DX,MSG3
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
