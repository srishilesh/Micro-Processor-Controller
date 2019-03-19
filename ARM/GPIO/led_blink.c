#include <lpc214x.h>
#include <stdint.h>

void delay_ms(uint16_t j) /* Function for delay in milliseconds */
{
    uint16_t x,i;
	for(i=0;i<j;i++)
	{
    for(x=0; x<6000; x++);    /* loop to generate 1 millisecond delay with 12MHz Fosc. */
	}
}

int main(void)
{	
	PINSEL2 = 0x00000000;
	IO0DIR = 0xFFFFFFFF;	/* Set P0.0 to P0.7 bits as output bits by writing 1 in IO0DIR register corresponding to those bits. */
	while(1)
	{		
		//IO0PIN =  IO0PIN | 0x000000FF; /* Make P0.0 to P0.7 HIGH while keeping other bits unchanged. */
		IO0SET  = 0xFFFFFFFF;
		delay_ms(300);
		IO0CLR = 0xFFFFFFFF;
		//IO0PIN = IO0PIN & 0xFFFFFF00; /* Make P0.0 to P0.7 LOW while keeoing other bits unchanged. */
		delay_ms(300);		
	}	
}
