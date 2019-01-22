MOV  TMOD,#20H  ;timer 1,mode 2(auto reload) 
MOV  TH1,#-6    ;4800 baud rate 
MOV  SCON,#50H  ;8-bit, 1 stop, REN enabled 
SETB TR1        ;start timer 1 
AGAIN: MOV  SBUF,#'A'; letter “A”to transfer 
HERE:  JNB  TI,HERE    ;wait for the last bit
 CLR  TI         ;clear TI for next char 
SJMP AGAIN      ;keep sending A

;Write a program for the 8051 to transfer letter “A”serially at 4800 baud, continuously.
