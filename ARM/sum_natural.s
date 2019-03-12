 AREA   SUM, CODE, READONLY
 EXPORT sum1 ;r0 = input variable n ; r0 = output variable sum
sum1
	MOV r1,#0; set sum = 0
sum_loop 
	ADD  r1,r1,r0; set sum = sum+n 
	SUBS r0,r0,#1; set n = n-1 
	BNE sum_loop
sum_rtn 
	MOV r0,r1; set return value MOVpc,lr
END
