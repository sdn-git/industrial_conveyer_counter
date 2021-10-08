ClearEverything:		

RAM_Clear:
	in XH,SPH
	in XL,SPL
	ldi	YH,high(SRAM_START)
	ldi YL,low(SRAM_START)
	clr tmp
	
RAMclear_cycle:
	st	-X,tmp
	cp	YL,XL
	cpc	YH,XH
	brcs	RAMclear_cycle
ret
