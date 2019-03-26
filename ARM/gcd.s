;Write ALP using ARM ISA to find GCD of two integers in R0 and R1 and store the result in R2

AREA RESET,CODE,READONLY
  ENTRY
  MOV R0,#0xF
  MOV R1,#0xA
MAIN
  CMP R0,#0
  MOVEQ R2,R1
  CMP R1,#0
  MOVEQ R2,R0
  CMP R0,R1
  MOVEQ R2,R0
  CMP R0,R1
  BGT BIG
  BLT SMALL
BIG
	SUBS R0,R0,R1	
	B MAIN
SMALL
	SUBS R1,R1,R0
B MAIN 		 
  END