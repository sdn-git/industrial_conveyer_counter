 
.def    R_ConstSet		=r1
.def	R_ConstCurrent1	=r2		;локальная константа
.def	R_ConstCurrent2	=r3
.def	R_ConstCurrent3	=r4
.def    R_ConstAverageL	=r5	;глобальная константа
.def    R_ConstAverageH	=r6
.def	R_DeltaMinL	=r7		;Границы отклонения
.def    R_DeltaMinH	=r8
.def	R_DeltaMaxL	=r9
.def	R_DeltaMaxH	=r10
.def	R_ShiftAddr	=r11		;Там суммируется сдвиг для адреса
.def	tmp		=r16			;РОН
.def	tmp2	=r17
.def	tmp3	=r18
.def	xtmp	=r19
.def	ytmp	=r20
.def	ztmp	=r21
;.def	R_NumPort	=r22		;Здесь хранится номер канала АЦП.
.def	R_Flags	=r22			;Регситр флагов
	.equ	f_DetailIn	=0
	.equ	m_DetailIn	=0b00000001
	.equ	f_ConstsSet	=1
	.equ    m_ConstsSet	=0b00000010
	.equ	f_Cross		=2
	.equ	m_Cross		=0b00000100
	.equ	f_Stop		=3			;  "Установака константы" "Остановка конвейера" 	
	.equ	m_Stop		=0b00001000 ;
	.equ	f_CountGone	=4			;  "Счет произошел"
	.equ	m_CountGone	=0b00010000
	.equ	f_MinGone	=5			; уровень минимума пройден - флаг установлен (используется в 
	.equ	m_MinGone	=0b00100000 ; распознании пролета детали/установлении константы)
	.equ	f_MaxGone	=6			; уровень максимума пройден - флаг установлен (используется в
	.equ	m_MaxGone	=0b01000000 ; распознании пролета детали/установлении константы)


.def	R_Counter	   =r23		;Число подсчетов 1 канала АЦП, когда деталь внутри
.def	R_SampleCount_L	=r24     ;число выборок	локальной константы
.def	R_SampleCount_H	=r25
;
.equ	StopConv	=PB2		;управление конвейером
.equ	Detail	=PB1			;фиксирует проелт детали
.equ	CONST	=PB0			;устанавливает константу
;
.equ	C_StartAverage	=770
.equ	C_StartDeltaMin	=800
.equ	C_StartDeltaMax	=720
.equ	C_Delta	=8 ;Гарантированный "довесок" к высчитанной от среднего уровня дельте
.equ	C_ShiftAddr=12
.equ	C_LimitShiftAddr=C_ShiftAddr*8
.equ	C_NumberCount	=1
.equ	BaudRate_constant=12
.equ	Border	=100000
.equ	MinInterval	=200;который определят прошла деталь или нет
.equ	MaxInterval	=31250  ;(2 cек )


.equ	C_NumberLoop	=4096;8192
.equ	C_Shift	=4;(2^10=1024  2=10-8);(2^12=32768  4=12-8); 7 ;(2^15=32768  7=15-8)

.equ    C_LastNimberPortADC	=9	

;(!!!)ПРИ ДОБАВЛЕНИИ ДОПОЛНИТЕЛЬНИХ АДРЕСОВ СЛЕДУЕТ ПОМЕНЯТЬ КОНСТАНТУ СМЕЩЕНИЯ АДРЕСА
	;И КОНСТАНТУ КРАЙНЕГО АДРЕСА 
.equ	S_ConstCurrent1_0	=0x060	 ;Обновляющаяся  через каждые циклов 256 константа
.equ    S_ConstCurrent2_0	=0x061	 ;она же (локальная константа)
.equ	S_ConstCurrent3_0	=0x062	 ;Обновляющаяся  через каждые циклов 256 константа
.equ	S_ConstAverageL_0	=0x063	 ;Глобальная константа
.equ    S_ConstAverageH_0	=0x064
.equ	S_Counter_0	=0x065
.equ	S_DeltaMinL_0	=0x066
.equ	S_DeltaMinH_0	=0x067
.equ	S_DeltaMaxL_0	=0x068
.equ	S_DeltaMaxH_0	=0x069
.equ	S_SampleCount1_0	=0x06A
.equ	S_SampleCount2_0	=0x06B

;
.equ	S_ConstCurrent1_1	=0x06C	 ;Обновляющаяся  через каждые циклов 256 константа
.equ    S_ConstCurrent2_1	=0x06D	 ;она же (локальная константа)
.equ	S_ConstCurrent3_1	=0x06E	 ;Обновляющаяся  через каждые циклов 256 константа
.equ	S_ConstAverageL_1	=0x06F	 ;Глобальная константа
.equ    S_ConstAverageH_1	=0x070
.equ	S_Counter_1		=0x071
.equ	S_DeltaMinL_1	=0x072
.equ	S_DeltaMinH_1	=0x073
.equ	S_DeltaMaxL_1	=0x074
.equ	S_DeltaMaxH_1	=0x075
.equ	S_SampleCount1_1	=0x076
.equ	S_SampleCount2_1	=0x077
;
.equ	S_ConstCurrent1_2	=0x078	 ;Обновляющаяся  через каждые циклов 256 константа
.equ    S_ConstCurrent2_2	=0x079	 ;она же (локальная константа)
.equ	S_ConstCurrent3_2	=0x07A	 ;Обновляющаяся  через каждые циклов 256 константа
.equ	S_ConstAverageL_2	=0x07B
.equ    S_ConstAverageH_2	=0x07C
.equ	S_Counter_2		=0x07D
.equ	S_DeltaMinL_2	=0x07E
.equ	S_DeltaMinH_2	=0x07F
.equ	S_DeltaMaxL_2	=0x080
.equ	S_DeltaMaxH_2	=0x081
.equ	S_SampleCount1_2	=0x082
.equ	S_SampleCount2_2	=0x083

;
.equ	S_ConstCurrent1_3	=0x084	 ;Обновляющаяся  через каждые циклов 256 константа
.equ    S_ConstCurrent2_3	=0x085	 ;она же (локальная константа)
.equ	S_ConstCurrent3_3	=0x086	 ;Обновляющаяся  через каждые циклов 256 константа
.equ	S_ConstAverageL_3	=0x087	 ;Глобальная константа
.equ    S_ConstAverageH_3	=0x088
.equ	S_Counter_3		=0x089
.equ	S_DeltaMinL_3	=0x08A
.equ	S_DeltaMinH_3	=0x08B
.equ	S_DeltaMaxL_3	=0x08C
.equ	S_DeltaMaxH_3	=0x08D
.equ	S_SampleCount1_3	=0x08E
.equ	S_SampleCount2_3	=0x08F

;
.equ	S_ConstCurrent1_4	=0x090	 ;Обновляющаяся  через каждые циклов 256 константа
.equ    S_ConstCurrent2_4	=0x091	 ;она же (локальная константа)
.equ	S_ConstCurrent3_4	=0x092	 ;Обновляющаяся  через каждые циклов 256 константа
.equ	S_ConstAverageL_4	=0x093	 ;Глобальная константа
.equ    S_ConstAverageH_4	=0x094
.equ    S_Counter_4			=0X095
.equ	S_DeltaMinL_4	=0x096
.equ	S_DeltaMinH_4	=0x097
.equ	S_DeltaMaxL_4	=0x098
.equ	S_DeltaMaxH_4	=0x099
.equ	S_SampleCount1_4	=0x09A
.equ	S_SampleCount2_4	=0x09B


;
.equ	S_ConstCurrent1_5	=0x09C	 ;Обновляющаяся  через каждые циклов 256 константа
.equ    S_ConstCurrent2_5	=0x09D	 ;она же (локальная константа)
.equ	S_ConstCurrent3_5	=0x09E	 ;Обновляющаяся  через каждые циклов 256 константа
.equ	S_ConstAverageL_5	=0x09F	 ;Глобальная константа
.equ    S_ConstAverageH_5	=0x0A0
.equ	S_Counter_5		=0x0A1
.equ	S_DeltaMinL_5	=0x0A2
.equ	S_DeltaMinH_5	=0x0A3
.equ	S_DeltaMaxL_5	=0x0A4
.equ	S_DeltaMaxH_5	=0x0A5
.equ	S_SampleCount1_5	=0x0A6
.equ	S_SampleCount2_5	=0x0A7


;

.equ	S_ConstCurrent1_6	=0x0A8	 ;Обновляющаяся  через каждые циклов 256 константа
.equ    S_ConstCurrent2_6	=0x0A9	 ;она же (локальная константа)
.equ	S_ConstCurrent3_6	=0x0AA	 ;Обновляющаяся  через каждые циклов 256 константа
.equ	S_ConstAverageL_6	=0x0AB	 ;Глобальная константа
.equ    S_ConstAverageH_6	=0x0AC
.equ	S_Counter_6		=0x0AD
.equ	S_DeltaMinL_6	=0x0AE
.equ	S_DeltaMinH_6	=0x0AF
.equ	S_DeltaMaxL_6	=0x0B0
.equ	S_DeltaMaxH_6	=0x0B1
.equ	S_SampleCount1_6	=0x0B2
.equ	S_SampleCount2_6	=0x0B3


;
.equ	S_ConstCurrent1_7	=0x0B4	 ;Обновляющаяся  через каждые циклов 256 константа
.equ    S_ConstCurrent2_7	=0x0B5	 ;она же (локальная константа)
.equ	S_ConstCurrent3_7	=0x0B6	 ;Обновляющаяся  через каждые циклов 256 константа
.equ	S_ConstAverageL_7	=0x0B7	 ;Глобальная константа
.equ    S_ConstAverageH_7	=0x0B8
.equ	S_Counter_7		=0x0B9
.equ	S_DeltaMinL_7	=0x0BA
.equ	S_DeltaMinH_7	=0x0BB
.equ	S_DeltaMaxL_7	=0x0BC
.equ	S_DeltaMaxH_7	=0x0BD
.equ	S_SampleCount1_7	=0x0BE
.equ	S_SampleCount2_7	=0x0BF



.equ	S_DelayL	=0x0D0
.equ	S_DelayH	=0x0D1
.equ	S_Delay_1	=0x0D2
.equ	S_Delay_2	=0x0D3
.equ	S_Delay_3	=0x0D4

.equ	S_NumPort	=0x0D5
.equ	S_DetailIndeficat	=0x0D6
.equ		f_1stChannel	=0
.equ		m_1stChannel	=0b00000001
.equ		f_2ndChannel	=1
.equ		m_2ndChannel	=0b00000010
.equ		f_3rdChannel	=2
.equ		m_3rdChannel	=0b00000100
.equ		f_4thChannel	=3
.equ		m_4thChannel	=0b00001000
.equ		f_5thChannel	=4
.equ		m_5thChannel	=0b00010000
.equ		f_6thChannel	=5
.equ		m_6thChannel	=0b00100000
.equ		f_7thChannel	=6
.equ		m_7thChannel	=0b01000000
.equ		f_8thChannel	=7
.equ		m_8thChannel	=0b10000000
.equ	S_TimerCntL	=0x0D7
.equ	S_TimerCntH	=0x0D8
.equ	S_ConstChannelSet	=0x0D9


