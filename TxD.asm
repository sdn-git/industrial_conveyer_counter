	;��� ��� ����� 2313, ��� ���� ����� ���� ��-�������.
	;-- ���������������� UART.
;	OUTI	UCR,0b11011000		;������ 8���, ��������� RXC/TXC - ���������.
;	OUTI	UBRR,BaudRate_constant	;�������� BaudRate.



;----------------------------------------------------------------------------------
TXD:;�������� ����� ����� UART.
;REGISTERS:	TMP=DATA for transference into UART. TMP2 - current CheckSUM.
WAIT_0:	sbic	USR,UDRE
	rjmp	WAIT_RET
	sei
	rjmp	WAIT_0
WAIT_RET:out	UDR,TMP		;Transference the TMP to UART.
	eor	TMP2,TMP	;Update the CS byte.
	ret
;----------------------------------------------------------------------------------
