PortsTimersInit:
	ldi 	tmp,0b00000000  
	out 	DDRC,tmp
	ldi 	tmp,0b11111111
	out 	PORTC,tmp

	ldi 	tmp,0b11111111	
	out 	DDRB,tmp
	ldi 	tmp,0b11111111
	out 	PORTB,tmp

	ldi 	tmp,0b11111111	
	out 	DDRD,tmp
	ldi 	tmp,0b11111111
	out 	PORTD,tmp

	cbi 	PORTB,Const 
	ldi	tmp,6 			
   	out	WDTCR,tmp 		
	wdr
	cli          

	ldi	tmp,0b01011100		;T0
	out	TIMSK,tmp		
	ldi	tmp,0b00000001		
	out	TCCR0,tmp		
	wdr

	ldi	tmp,0b00000001		;T1
	out	TCCR1B,tmp
		
   	ldi	tmp,0b00000100		;T2
  	out	TCCR2,tmp	

	ldi 	tmp,0b01000000 		;ADC
	out 	ADMUX,tmp		
	ldi 	tmp,0b11101111	
	out 	ADCSR,tmp
	ldi 	tmp,0b00010000
   	out 	SFIOR,tmp

	ldi	tmp,0b00011000		;UART
	out 	UCSRB,tmp
	ldi 	tmp, low(BaudRate_constant)
	ldi 	xtmp,high(BaudRate_constant)
	out	UBRRL,tmp
	out	UBRRH,xtmp
	ldi 	tmp,0b10001111
	out 	UCSRC,tmp
	ret
	
