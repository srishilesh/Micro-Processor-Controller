MOV  TMOD,#20H  ;timer 1,mode 2(auto reload)
MOV  TH1,#-3    ;9600 baud rate
MOV  SCON,#50H  ;8-bit, 1 stop, REN enabled 
SETB TR1        ;start timer 1 
AGAIN: MOV  A,#'Y' ;transfer “Y” 
ACALL TRANS 
MOV  A,#'E';transfer “E” 
ACALL TRANS 
MOV  A,#'S';transfer “S” 
ACALL TRANS 
SJMP AGAIN      ;keep doing it 
;serial data transfer subroutine 
TRANS: MOV  SBUF,A     ;load SBUF 
HERE:  JNB  TI,HERE    ;wait for the last bit 
CLR  TI         ;get ready for next byte 
RET


;Write a program for the 8051 to transfer “YES”serially at 9600 baud, 8-bit data, 1 stop bit, do this continuously
