


.device ATmega8
.include "m8def.inc"
.include "RegVarInit.asm"
.include "Macroses.asm"
.include "int.asm"
.include "PortsTimersInit.asm"
.include "MathOperations.asm"
.include "TxD.asm"
.include "ClearEverything.asm"
.include "ChannelFlagIdentif.asm"
.cseg
	Reset:
	cli
	ldi	tmp,low(RAMEND)
	out	SPL,tmp
	ldi	tmp,high(RAMEND)
	out	SPH,tmp
	rcall ClearEverything
	rcall PortsTimersInit
	sei
;	rcall StartConstSet
main:
	
			   ;выкл импульс "деталь внутри"	
	lds tmp2,S_DetailIndeficat ;зафиксировался ли пролет детали или установка константы(возведен(ы) ли флаг(и))?
	cpi tmp2,0				   ;Если флагов нет, то S_DetailIndeficat=0 - деталь внутри не замечена
	brne P_DetailInside
	sbrs R_Flags,f_MaxGone
	rjmp VerCountGone
	sbi PORTB,Const			   ;выкл сигнал  "установка константы"
	rjmp Reset_and_quit



VerCountGone:
	sbrc R_Flags,f_CountGone	
	rjmp VerMinGone
	rcall ResetAll
	rjmp main
VerMinGone:
	MARKER_FLASH PIND,PORTD,2
	sbrs R_Flags,f_MinGone	   ;проверка перехода через минимальный уровень
	rjmp LLLLLLLLL
	sbrs R_Flags,f_MaxGone     ;проверка перехода через максимальный уровень
	rjmp DetailInside
	#warning
	MARKER_FLASH PIND,PORTD,3
	cbi PORTB,Const			;вкл сигнал "Установка константы"
	rjmp Reset_and_quit


LLLLLLLLL:
MARKER_FLASH PIND,PORTD,4
rjmp Reset_and_quit





DetailInside:
rcall PulseDetailIn
	
Reset_and_quit: 
	
	rcall ResetAll
	rjmp main

P_DetailInside:
;	sbrc R_Flags,f_Stop
;	rjmp main
	sbrc R_Flags,f_CountGone
	rjmp main
;	MARKER_FLASH PIND,PORTD,7
	sbr R_Flags,m_CountGone	
	ldi	tmp,0b00000000			;счетный ргеистр  и регистр управления (таймер Т1 выкл)
	out TCNT1L,tmp
	out TCNT1H,tmp
    ldi	tmp,0b00000100
 	out	TCCR1B,tmp
	ldi tmp,low(MinInterval)
	ldi tmp2,high(MinInterval)
	out OCR1AH,tmp2
	out OCR1AL,tmp
	ldi tmp,low(MaxInterval)
	ldi tmp2,high(MaxInterval)
	out OCR1BH,tmp2
	out OCR1BL,tmp
	rjmp main

PulseDetailIn:
cbi  PORTB,Detail
MARKER_FLASH PIND,PORTD,5
pause100us
sbi  PORTB,Detail
ret			

ResetAll:						;здесь убираются все флаги и затираются
	ldi	tmp,0b00000000			;счетный ргеистр  и регистр управления (таймер Т1 выкл)
    out	TCCR1B,tmp
	out TCNT1L,tmp
	out TCNT1H,tmp
	cbr R_Flags,m_CountGone
	cbr R_Flags,m_MaxGone
	cbr R_Flags,m_MinGone
;	cbr R_Flags,m_Stop
;	sbi PORTB,StopConv
ret
