.MODEL SMALL
.DATA        
NUM1 DB ?
NUM2 DB ?
RESULT DB ?
MSG1 DB 10,13,"Enter (enter key) for subtraction, (any key except the enter) for addition: ", '$' 
MSG2 DB 10,13,"Enter num1: ", '$'
MSG3 DB 10,13,"Enter num2: " ,'$' 
MSG4 DB 10,13,"Answer: ", '$' 
ENDS
.CODE
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,MSG1 ;from message to DX 
    MOV AH,09H ;display string
    INT 21H
READ:  
    MOV AH,01H  ;read the entered key
    INT 21H  
    
    CMP AL, 13    ;compare the entered key
    JE SUBTRACTION 
    
    ;ADDITION
    LEA DX,MSG2    ;use to print string or message. LEA (LOAD EFFECTIVE ADDRESS) it loads the effective address of second element into the first element
    MOV AH,09H     ;display the string. Use to PRINT string or message of the address present in DX  
    INT 21H        ;standard input and output. It works with the value of AH register, If the value is 9 or 9H that means, print the string/message of the address present in DX register            
 
    MOV AH,01H     ;read the entered key. If the value is 1 or 1H. That means read a character from console, echo it on screen and save the value in AL register
    INT 21H     
    SUB AL,48     ;save the value enterened in variable NUM1 in its BCD form. This is done by subtracing 30H. The value coming from the ascii form. Ex. when you entered 5 we see 35H, so by subrating 30H we get back to the value as 5. Subracting 30H from AL
    MOV NUM1,AL    ;move the value from AL register into variable num
     
    LEA DX,MSG3    ;use to print string or message. LEA (LOAD EFFECTIVE ADDRESS) it loads the effective address of second element into the first element
    MOV AH,09H     ;display the string. Use to PRINT string or message of the address present in DX  
    INT 21H    
       
    MOV AH,01H     ;read the entered key. If the value is 1 or 1H. That means read a character from console, echo it on screen and save the value in AL register
    INT 21H     
    SUB AL,48     ;save the value enterened in variable NUM1 in its BCD form. This is done by subtracing 30H. The value coming from the ascii form. Ex. when you entered 5 we see 35H, so by subrating 30H we get back to the value as 5. Subracting 30H from AL
    MOV NUM2,AL    ;move the value from AL register into variable num 
    
    MOV AL,NUM1    ;since we can't add memmory to memmory. So, we have to send one number to AL or AX. After  oving we can now add REG to memmory.  
    ADD AL,NUM2    ;now the resultant value is saved in accumulator AL for DB snd AX for DW.
    
    MOV RESULT,AL ;we move the sum to result
    
    MOV AH,0        ;use to clear the unwanted garbage value present in AH register as IT WILL BE USE LATER
    AAA             ;means ascii adjust after addition. If we are adding two BCD numbers the result is saved in AL register in HEX form. AAA converts the result in BCD form and FIRST digit is saved in AH REG and SECOND in AL REG.
     
    ADD AH,30H      ;use to PRINT the DIGIT NUMBER ON SCREEN 
    ADD AL,30H      ;use to PRINT the DIGIT NUMBER ON SCREEN  
    
    MOV BX,AX       ;sinece were using AL and AH continously we cannot lose result in there. So, to save the printed value in BH and BL we move AX TO BX
    
    LEA DX,MSG4     ;display the message 3
    MOV AH,9
    INT 21H  
    
    MOV AH,2        ;use to write a character on console present inBH rengister. If the value is 2 or 2H That means write a charcter on console present in DL register
    MOV DL,BH
    INT 21H
                       
    
    MOV AH,2        ;use to write a character on console present inBL rengister. If the value is 2 or 2H That means write a charcter on console present in DL register
    MOV DL,BL
    INT 21H 
    

                    ;jump to exit
    JMP EXIT
        
SUBTRACTION: 
         
    LEA DX,MSG2    ;use to print string or message. LEA (LOAD EFFECTIVE ADDRESS) it loads the effective address of second element into the first element
    MOV AH,09H     ;display the string. Use to PRINT string or message of the address present in DX  
    INT 21H        ;standard input and output. It works with the value of AH register, If the value is 9 or 9H that means, print the string/message of the address present in DX register            
 
    MOV AH,01H     ;read the entered key. If the value is 1 or 1H. That means read a character from console, echo it on screen and save the value in AL register
    INT 21H     
    SUB AL,48     ;save the value enterened in variable NUM1 in its BCD form. This is done by subtracing 30H. The value coming from the ascii form. Ex. when you entered 5 we see 35H, so by subrating 30H we get back to the value as 5. Subracting 30H from AL
    MOV BL,AL
     
    LEA DX,MSG3    ;use to print string or message. LEA (LOAD EFFECTIVE ADDRESS) it loads the effective address of second element into the first element
    MOV AH,09H     ;display the string. Use to PRINT string or message of the address present in DX  
    INT 21H    
       
    MOV AH,01H     ;read the entered key. If the value is 1 or 1H. That means read a character from console, echo it on screen and save the value in AL register
    INT 21H     
    SUB AL,48     ;save the value enterened in variable NUM1 in its BCD form. This is done by subtracing 30H. The value coming from the ascii form. Ex. when you entered 5 we see 35H, so by subrating 30H we get back to the value as 5. Subracting 30H from AL
    MOV CL,AL    ;move the value from AL register into variable num  
    
        
    SUB BL,CL    ;subtracting BL and CL
    ADD BL,48
    
    
    LEA DX,MSG4    ;use to print string or message. LEA (LOAD EFFECTIVE ADDRESS) it loads the effective address of second element into the first element
    MOV AH,09H     ;display the string. Use to PRINT string or message of the address present in DX  
    INT 21H        ;standard input and output. It works with the value of AH register, If the value is 9 or 9H that means, print the string/message of the address present in DX register            
    
    MOV DL,BL      ;write a charcter on console present in DL register
    MOV AH,2
    INT 21H

    JMP EXIT       ;jump to exit
EXIT:
    MOV AH,4CH     ;exit
    INT 21H

END