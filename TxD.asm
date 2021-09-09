	;Это для тайни 2313, для меги будет чуть по-другому.
	;-- Конфигурирование UART.
;	OUTI	UCR,0b11011000		;Данные 8бит, прерываия RXC/TXC - разрешены.
;	OUTI	UBRR,BaudRate_constant	;Настроим BaudRate.



;----------------------------------------------------------------------------------
TXD:;Передача байта через UART.
;REGISTERS:	TMP=DATA for transference into UART. TMP2 - current CheckSUM.
WAIT_0:	sbic	USR,UDRE
	rjmp	WAIT_RET
	sei
	rjmp	WAIT_0
WAIT_RET:out	UDR,TMP		;Transference the TMP to UART.
	eor	TMP2,TMP	;Update the CS byte.
	ret
;----------------------------------------------------------------------------------
