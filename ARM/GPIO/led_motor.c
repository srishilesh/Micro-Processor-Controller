/*Write Embedded C program using LPC 2148 to meet the following objectives:<o:p></o:p>

Water level control<o:p></o:p>

SW1 – Sump<o:p></o:p>

SW2 – Lower level in over head tank<o:p></o:p>

SW2 – upper level in over head tank<o:p></o:p>

LED1 is Motor<o:p></o:p>

SW Pressed  - Water is available<o:p></o:p>

SW released - Water is not available<o:p></o:p>*/

#include  <lpc214x.h>			   
#define LED1_ON() IO1SET=(1<<16)	 
#define LED1_OFF() IO1CLR=(1<<16)	 
#define SW1 (IO0PIN & (1<<15))	 
#define SW2	(IO0PIN & 0x00002000)
#define SW3	(IO0PIN & 0x00001000)

int  main(void)
{  
 PINSEL0 = 0x00000000;		// Enable GPIO on all pins
 PINSEL1 = 0x00000000;
 PINSEL2 = 0x00000000;

 IO0DIR = (0<<12) | (0<<13)	| (0<<15) ;	
 IO1DIR =  (1<<16);		

 while(1)	
 { 
  if(SW1)
 {LED1_OFF();}		
  else 	  
  {
  	if(SW2 && SW3)
	LED1_ON();
	else if (!SW2 && !SW3)
LED1_OFF();
  }
 }
}

/*
PIN 15	PIN 13	PIN 12	LED PIN 16
SWITCH 1	SWITCH 2	SWITCH 3	MOTOR
0	0	0	0
0	0	1	0
0	1	0	0
0	1	1	0
1	0	0	1
1	0	1	x
1	1	0	x
1	1	1	0

*/
