	AREA RESET,CODE,READONLY
	ENTRY
 	LDR R1,=array
	LDR R4,=array
	MOV R2, #5
OUTLOOP
 	LDR R3,[R1]
	MOV R4,R1
	;LDR R7,[R4]
	ADD R1,R1,#0x00000004
	B INLOOP	
	CMP R2,#0
	SUBGT R2,R2,#01
	BGT OUTLOOP

INLOOP
	MOV R6,#5
	LDR R9,[R4,#0x00000004]
	;ADD R4,R4
	CMP R2,R6
	SUBGT R6,R6,#01
	CMP R3,R9
	BNE UNIQUE
	BEQ NOTUNIQUE
	B OUTLOOP

UNIQUE
	MOV R0,R3
	B INLOOP

NOTUNIQUE
	LDR R0,=0x00000000
	B INLOOP
	
array DCD 0x00000004, 0x00000005, 0x00000002, 0x00000003, 0x00000007

	END
