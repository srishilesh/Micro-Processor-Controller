 AREA MYCODE,CODE,READONLY
 ENTRY
   MOV R0,#0X40000000			  ; Initial Memory location
   MOV R7,#1					  ; Outer loop counter
   
  
LOOP MOV R6,#1					   ; Inner loop counter

   
 
LOOP1
    LDR R2,[R0],#4				   ; Access the first element
 LDR R3,[R0]					   ; Access the second element
 CMP R2,R3						   ; Compare adjacent elements
 STRGT R3,[R0,#-4]				   ; Swapping 
 STRGT R2,[R0]
   ADD R6,R6,#1					   ; Incrementing inner counter
  
   CMP R6,#4
   BLE LOOP1					   ; Loop back

  
   ADD R7,R7,#1					   ; Increment outer counter
   CMP R7,#4
   ADD R1,R1,#4
   MOV R0,#0X40000000			   ; Initializing the array index
   BLE LOOP						   ; Exit outer loop

 B  .
 END
