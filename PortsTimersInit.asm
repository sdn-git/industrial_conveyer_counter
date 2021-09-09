PortsTimersInit:
 
  ;������������ ������
  ;________________________________
	ldi tmp,0b00000000  ;����
	out DDRC,tmp
	ldi tmp,0b11111111
	out PORTC,tmp

	ldi tmp,0b11111111	;�����
	out DDRB,tmp
	ldi tmp,0b11111111
	out PORTB,tmp

	ldi tmp,0b11111111	;�����
	out DDRD,tmp
	ldi tmp,0b11111111
	out PORTD,tmp

	cbi PORTB,Const ;��� ��������� �������� ������ ������ �� �����.


   ;������������� ������
   ;_________________________________
	ldi	tmp,6 			
   ;out	WDTCR,tmp 		
	wdr
;	cli          
 
 
   ;������������� ��������
   ;_________________________________

	ldi	tmp,0b01011100		;Load constant in registr tmp (r16)
	out	TIMSK,tmp		;Allow interrupt processing
	ldi	tmp,0b00000001			;Load constant in registr tmp (r16).Constant before is deleting<!!>
	out	TCCR0,tmp		;T0 frequency equal signal microcontroller
	wdr
	;

   ;������������� ������� �1
   ;________________________________

;	ldi	tmp,0b00000001
;	out	TCCR1B,tmp
	
   ;������������� ������� �2
   ;________________________________	
		
   ldi	tmp,0b00000100		
   out	TCCR2,tmp	

   ;������������� ���
   ;________________________________

	ldi tmp,0b01000000 	;������� ���������� ����� ���������� �������.
	out ADMUX,tmp		;������� ��������� � ������, ����� �������� ���
				; !! ������ �� ������ ������� ������� �� � ���� ����� (��-�� ����������� ���������� 
				;  ��������� ������������ ������� ���.
	ldi tmp,0b11101111	;A��-��������, ��������������-���������, �����-�����������,��� ���������� �����������,
				;���������� ����������� ���������,����������� ������� 32
	out ADCSR,tmp
	ldi tmp,0b00010000
   	out SFIOR,tmp


	;������������� UART
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
	
