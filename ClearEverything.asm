ClearEverything:		
/*clr	R_ConstCurrent1				;��������� ���������
clr	R_ConstCurrent2
clr	R_ConstCurrent3
clr R_ConstAverageL			;���������� ���������
clr	R_ConstAverageH
clr	R_Counter			;����� ��������� 1 ������ ���, ����� ������ ������
clr	R_DeltaMinL			;������� ����������
clr R_DeltaMinH
clr R_DeltaMaxL
clr	R_DeltaMaxH	
clr	R_ShiftAddr			;��� ����������� ����� ��� ������
clr	tmp					;���
clr	tmp2	
clr tmp3	
clr	xtmp	
clr	ytmp	
clr	ztmp	
;clr	R_NumPort			;����� �������� ����� ������ ���.
clr	R_Flags				;������� ������
clr	R_SampleCount_L	    ;����� �������	��������� ���������
clr	R_SampleCount_H	    ;����� �������	��������� ���������

ldi tmp,low(C_StartAverage) ;����������� ��������� ��������(!!!)
mov R_ConstAverageL,tmp 
ldi tmp,high(C_StartAverage)
mov R_ConstAverageH, tmp
ldi tmp,low(C_StartDeltaMin)
mov R_DeltaMinL,tmp
ldi tmp,high(C_StartDeltaMin)
mov R_DeltaMinH,tmp
ldi tmp,low(C_StartDeltaMax)
mov R_DeltaMaxL,tmp
ldi tmp,high(C_StartDeltaMax)
mov R_deltaMaxH,tmp

clr tmp

sts	S_ConstCurrent1_0,tmp	 ;�������������  ����� ������ ������ 256 ���������
sts S_ConstCurrent2_0,tmp	 ;��� �� (��������� ���������)
sts S_ConstCurrent3_0,tmp
sts	S_ConstAverageL_0,R_ConstAverageL	 ;���������� ���������
sts S_ConstAverageH_0,R_ConstAverageH
sts	S_Counter_0,tmp
sts	S_DeltaMinL_0,R_DeltaMinL
sts	S_DeltaMinH_0,R_DeltaMinH
sts	S_DeltaMaxL_0,R_DeltaMaxL
sts	S_DeltaMaxH_0,R_DeltaMaxH
sts	S_SampleCount1_0,tmp
sts	S_SampleCount2_0,tmp
;
sts	S_ConstCurrent1_1,tmp	 ;�������������  ����� ������ ������ 256 ���������
sts S_ConstCurrent2_1,tmp	 ;��� �� (��������� ���������)
sts S_ConstCurrent3_1,tmp
sts	S_ConstAverageL_1,R_ConstAverageL	 ;���������� ���������
sts S_ConstAverageH_1,R_ConstAverageH
sts	S_Counter_1,tmp
sts	S_DeltaMinL_1,R_DeltaMinL
sts	S_DeltaMinH_1,R_DeltaMinH
sts	S_DeltaMaxL_1,R_DeltaMaxL
sts	S_DeltaMaxH_1,R_DeltaMaxH
sts	S_SampleCount1_1,tmp
sts	S_SampleCount2_1,tmp
;
sts	S_ConstCurrent1_2,tmp	 ;�������������  ����� ������ ������ 256 ���������
sts S_ConstCurrent2_2,tmp	 ;��� �� (��������� ���������)
sts S_ConstCurrent3_2,tmp
sts	S_ConstAverageL_2,R_ConstAverageL	 ;���������� ���������
sts S_ConstAverageH_2,R_ConstAverageH
sts	S_Counter_2,tmp
sts	S_DeltaMinL_2,R_DeltaMinL
sts	S_DeltaMinH_2,R_DeltaMinH
sts	S_DeltaMaxL_2,R_DeltaMaxL
sts	S_DeltaMaxH_2,R_DeltaMaxH
sts	S_SampleCount1_2,tmp
sts	S_SampleCount2_2,tmp
;
sts	S_ConstCurrent1_3,tmp	 ;�������������  ����� ������ ������ 256 ���������
sts S_ConstCurrent2_3,tmp	 ;��� �� (��������� ���������)
sts S_ConstCurrent3_3,tmp
sts	S_ConstAverageL_3,R_ConstAverageL	 ;���������� ���������
sts S_ConstAverageH_3,R_ConstAverageH
sts	S_Counter_3,tmp
sts	S_DeltaMinL_3,R_DeltaMinL
sts	S_DeltaMinH_3,R_DeltaMinH
sts	S_DeltaMaxL_3,R_DeltaMaxL
sts	S_DeltaMaxH_3,R_DeltaMaxH
sts	S_SampleCount1_3,tmp
sts	S_SampleCount2_3,tmp
;
sts	S_ConstCurrent1_4,tmp	 ;�������������  ����� ������ ������ 256 ���������
sts S_ConstCurrent2_4,tmp	 ;��� �� (��������� ���������)
sts S_ConstCurrent3_4,tmp
sts	S_ConstAverageL_4,R_ConstAverageL	 ;���������� ���������
sts S_ConstAverageH_4,R_ConstAverageH
sts	S_Counter_4,tmp
sts	S_DeltaMinL_4,R_DeltaMinL
sts	S_DeltaMinH_4,R_DeltaMinH
sts	S_DeltaMaxL_4,R_DeltaMaxL
sts	S_DeltaMaxH_4,R_DeltaMaxH
sts	S_SampleCount1_4,tmp
sts	S_SampleCount2_4,tmp
;
sts	S_ConstCurrent1_5,tmp ;�������������  ����� ������ ������ 256 ���������
sts S_ConstCurrent2_5,tmp	 ;��� �� (��������� ���������)
sts S_ConstCurrent3_5,tmp
sts	S_ConstAverageL_5,R_ConstAverageL	 ;���������� ���������
sts S_ConstAverageH_5,R_ConstAverageH
sts	S_Counter_5,tmp
sts	S_DeltaMinL_5,R_DeltaMinL
sts	S_DeltaMinH_5,R_DeltaMinH
sts	S_DeltaMaxL_5,R_DeltaMaxL
sts	S_DeltaMaxH_5,R_DeltaMaxH
sts	S_SampleCount1_5,tmp
sts	S_SampleCount2_5,tmp
;
sts	S_ConstCurrent1_6,tmp	 ;�������������  ����� ������ ������ 256 ���������
sts S_ConstCurrent2_6,tmp	 ;��� �� (��������� ���������)
sts S_ConstCurrent3_6,tmp
sts	S_ConstAverageL_6,R_ConstAverageL	 ;���������� ���������
sts S_ConstAverageH_6,R_ConstAverageH
sts	S_Counter_6,tmp
sts	S_DeltaMinL_6,R_DeltaMinL
sts	S_DeltaMinH_6,R_DeltaMinH
sts	S_DeltaMaxL_6,R_DeltaMaxL
sts	S_DeltaMaxH_6,R_DeltaMaxH
sts	S_SampleCount1_6,tmp
sts	S_SampleCount2_6,tmp
;
sts	S_ConstCurrent1_7,tmp	 ;�������������  ����� ������ ������ 256 ���������
sts S_ConstCurrent2_7,tmp	 ;��� �� (��������� ���������)
sts S_ConstCurrent3_7,tmp
sts	S_ConstAverageL_7,R_ConstAverageL	 ;���������� ���������
sts S_ConstAverageH_7,R_ConstAverageH
sts	S_Counter_7,tmp
sts	S_DeltaMinL_7,R_DeltaMinL
sts	S_DeltaMinH_7,R_DeltaMinH
sts	S_DeltaMaxL_7,R_DeltaMaxL
sts	S_DeltaMaxH_7,R_DeltaMaxH
sts	S_SampleCount1_7,tmp
sts	S_SampleCount2_7,tmp

sts	S_DelayL,tmp
sts	S_DelayH,tmp
sts S_Numport,tmp*/

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
