 AREA SUMARRAY, CODE, READONLY
 ENTRY ; Always needed to indicate where to start pgm
 LDR r2, LENGTH
 SUB r2, r2, #1 ; r2 contains (LENGTH-1)
 MOV r6, #0 ; r6 sum set to 0
 
FOR_INIT MOV r1, #0 ; r1 index I set to 0
 ADR r3, ARRAY ; start r3 with address of A[0]
 
FOR_CMP CMP r1, r2 ; compare I and (LENGTH-1)
 BGT END_FOR ; drop out of loop if I < (LENGTH-1)
 LDR r4, [r3],#4 ; load r4 with A[I] then walk r3 down ARRAY
 ADD r6, r6, r4 ; update sum with A[I]
 ADD r1, r1, #1 ; increment I
 B FOR_CMP ; loop back to for-loop check
 
END_FOR
 STR r6, SUM ; store result in SUM
 
STOP B STOP

 AREA SUMARRAY, DATA, READWRITE
 ALIGN
SUM DCD 0XFFFFFFFF
ARRAY DCD 5, 2 , 3, 1 , 4
LENGTH DCD 5
END ; Needed to stop assembly
