PortsTimersInit:
 
  ;Инициализаци портов
  ;________________________________
	ldi tmp,0b00000000  ;вход
	out DDRC,tmp
	ldi tmp,0b11111111
	out PORTC,tmp

	ldi tmp,0b11111111	;выход
	out DDRB,tmp
	ldi tmp,0b11111111
	out PORTB,tmp

	ldi tmp,0b11111111	;выход
	out DDRD,tmp
	ldi tmp,0b11111111
	out PORTD,tmp

	cbi PORTB,Const ;при включении конвейер должен стоять на месте.


   ;Инициализация собаки
   ;_________________________________
	ldi	tmp,6 			
   ;out	WDTCR,tmp 		
	wdr
;	cli          
 
 
   ;Инициализация таймеров
   ;_________________________________

	ldi	tmp,0b01011100		;Load constant in registr tmp (r16)
	out	TIMSK,tmp		;Allow interrupt processing
	ldi	tmp,0b00000001			;Load constant in registr tmp (r16).Constant before is deleting<!!>
	out	TCCR0,tmp		;T0 frequency equal signal microcontroller
	wdr
	;

   ;Инициализация таймера Т1
   ;________________________________

;	ldi	tmp,0b00000001
;	out	TCCR1B,tmp
	
   ;Инициализация таймера Т2
   ;________________________________	
		
   ldi	tmp,0b00000100		
   out	TCCR2,tmp	

   ;Инициализация АЦП
   ;________________________________

	ldi tmp,0b01000000 	;Опорное напряжение равно напряжению питания.
	out ADMUX,tmp		;Сначала установим № канала, затем запустим АЦП
				; !! данные по первой выборке попадут не в свой канал (из-за особенности построения 
				;  программы переключения каналов АЦП.
	ldi tmp,0b11101111	;AЦП-включено, преобразование-выключено, режим-непрерывный,нет прерывания компаратора,
				;прерывание компаратора запрещено,коэффициент деления 32
	out ADCSR,tmp
	ldi tmp,0b00010000
   	out SFIOR,tmp


	;Инициализация UART
	;_______________________________
	ldi	tmp,0b00011000
	out UCSRB,tmp
	ldi tmp, low(BaudRate_constant)
	ldi xtmp,high(BaudRate_constant)
	out	UBRRL,tmp
	out	UBRRH,xtmp
	ldi tmp,0b10001111
	out UCSRC,tmp
	ret
	
