
REGISTERS:	
WAIT_0:	sbic	USR,UDRE
	rjmp	WAIT_RET
	sei
	rjmp	WAIT_0
WAIT_RET:out	UDR,TMP		
	eor	TMP2,TMP	
	ret

