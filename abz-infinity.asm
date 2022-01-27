.MODEL SMALL
.DATA  

.CODE 
START:
     MOV AX,@DATA
     MOV DS,AX
     
     MOV AH,64
     MOV CX,26   
     MOV DL,AH
     
LOOPREAD:
        
     MOV AH,01H
     INT 16H 
     
     CMP AL,13  ;compare
     JE EXIT 
     
     INC DL     ;increment dl 
     
     MOV AH,02h   ;printing into the console
     INT 21H
             
       
     CMP DL,90
     JE START            
     
     LOOP LOOPREAD 
       
                                      
EXIT: 
    MOV AH,4CH
    INT 21H
END

     
     
     
     