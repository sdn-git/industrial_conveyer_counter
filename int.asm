.org 0x000
 	rjmp	Reset
	rjmp	EXT_INT0
	rjmp	EXT_INT1
	rjmp	OUT_COMPARE2
	rjmp	OVF_T2
	rjmp	ICP_INT1
	rjmp	OC1A_INT
	rjmp	OC1B_INT
	rjmp	OVF_T1
	rjmp	OVF_T0
	rjmp	SPI_INT
	rjmp	URXC_INT
	rjmp	UDRE_INT
	rjmp	UTXC_INT
	rjmp	ADCC_INT
	rjmp	ERDY_INT
	rjmp	ACI_INT
	rjmp	TWI_INT
	rjmp	SPM_INT

EXT_INT0:
	reti

EXT_INT1:
	reti

OUT_COMPARE2:
	reti

OVF_T2:
	reti

ICP_INT1:
	reti

OC1A_INT:
	PUSH_PSW
    	sbr 	R_Flags,m_MinGone
	POP_PSW
	reti

OC1B_INT:
	PUSH_PSW
	cbi 	PORTB,Const	
	#warning
	MARKER_FLASH PIND,PORTD,4
	sbr	 R_Flags,m_MaxGone
	sbr 	R_Flags,m_Stop
POP_PSW
	reti

OVF_T1:
	reti

OVF_T0:
	reti

SPI_INT:
	reti

URXC_INT:
	reti

UDRE_INT:
	reti

UTXC_INT:
	reti

ADCC_INT:
	Push_All
	in 	tmp,ADMUX
	mov 	tmp2,tmp
	cbi	ADMUX,MUX0
	cbi	ADMUX,MUX1
	cbi	ADMUX,MUX2
	cbi	ADMUX,MUX3
	cbr	tmp2,0b11111000
	push	tmp2
	inc 	tmp2
	cpi 	tmp2,8
	brne 	NumADCPortSet
	clr	tmp2
	sts S_NumPort,tmp2
	
NumADCPortSet:
	cbr	tmp,0b00000111
	add 	tmp,tmp2
	out  	ADMUX,TMP

After_ADMUX_set:
	pop	tmp	
	dec	tmp
	cpi	tmp,0xff
	brne	simply_push
	ldi	tmp,7
	
simply_push:
	push	tmp	

LoadFromRam:	
	rcall	AddressDefine
	ld 	R_ConstCurrent1,X+
	ld 	R_ConstCurrent2,X+
	ld 	R_ConstCurrent3,X+
	ld 	R_ConstAverageL,X+
	ld 	R_ConstAverageH,X+
	ld 	R_Counter,X+
	ld 	R_DeltaMinL,X+
	ld 	R_DeltaMinH,X+
	ld 	R_DeltaMaxL,X+
	ld 	R_DeltaMaxH,X+
	ld 	R_SampleCount_L,X+		
	ld 	R_SampleCount_H,X+	
	sbrs 	R_Flags,f_ConstsSet
	rjmp 	SampleCount

SampleCount:
	in   	tmp,ADCL	   			
	in   	tmp2,ADCH				
	clr 	xtmp		
	add	R_ConstCurrent1,tmp				
	adc	R_ConstCurrent2,tmp2				
	adc	R_ConstCurrent3,xtmp
	adiw	R_SampleCount_L,1		    			
	ldi 	xtmp,low(C_NumberLoop-2)
	ldi 	ytmp,high(C_NumberLoop-2)
	cp	R_SampleCount_L,xtmp
	cpc	R_SampleCount_H,ytmp
	brcs 	StoreToRam				
	sbr 	R_Flags, m_ConstsSet		
	clr  	R_SampleCount_L
	clr	R _SampleCount_H
	rcall 	MathOperations
	sbi	PORTB,LED		
	rjmp  StoreToRam

StoreToRam:
	pop	tmp	
	sts 	S_NumPort,tmp
	push	tmp
	rcall	AddressDefine
	st 	X+,R_ConstCurrent1
	st 	X+,R_ConstCurrent2
	st 	X+,R_ConstCurrent3
	st 	X+,R_ConstAverageL
	st 	X+,R_ConstAverageH
	st 	X+,R_Counter
	st 	X+,R_DeltaMinL
	st 	X+,R_DeltaMinH
	st 	X+,R_DeltaMaxL
	st 	X+,R_DeltaMaxH
	st 	X+,R_SampleCount_L		
	st 	X+,R_SampleCount_H
	
	in   	tmp,ADCL	   			
	in   	tmp2,ADCH				

	cp	tmp, R_DeltaMinL		
	cpc  	tmp2,R_DeltaMinH
	brcs 	DetailIn				
	cp	tmp,R_DeltaMaxL		
	cpc  	tmp2,R_DeltaMaxH
	brcc 	DetailIn				
	brne 	LED_OFF
	
DetailIn:
	cbi 	PORTB,Const
	rcall	ChannelFlagIdentif_ON	
	rjmp 	Exit_ADCC_Int
	
LED_OFF:
	sbi 	PORTB,Const
	rcall 	ChannelFlagIdentif_OFF
		
Exit_ADCC_Int:
	pop	tmp		
	Pop_All
	reti

ERDY_INT:
	reti

ACI_INT:
	reti

TWI_INT:
	reti

SPM_INT:
	reti

	ldi 	xtmp,C_ShiftAddr
	clr 	ytmp
	clr 	ztmp
	
AddrComputation:
	cp  	ztmp,tmp
	breq 	SummWithAddress
	add 	ytmp,xtmp
	inc 	ztmp
	rjmp 	AddrComputation
	
SummWithAddress:
	ldi 	XL,low(S_ConstCurrent1_0)
	ldi 	XH,high(S_ConstCurrent1_0)
	add 	XL,ytmp
	clr 	tmp
	adc 	XH,tmp
	ret
