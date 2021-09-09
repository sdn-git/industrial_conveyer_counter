MathOperations:
	PUSH_ALL
	clr tmp
Divide:				;����������� ����� ����� ������� �� ���������� �������, 
  	inc tmp			;  ������� ������ ���� ������ ������� 2.
	lsr R_ConstCurrent3
	ror R_ConstCurrent2
	cpi tmp,C_Shift
	brne Divide
	


	MOV R_ConstAverageL,R_ConstCurrent2
	MOV	R_ConstAverageH,R_ConstCurrent3
	clr R_ConstCurrent1
	clr R_ConstCurrent2
	clr R_ConstCurrent3	
	;������ ��� ���������� ���������= ����� ������� /SampleCount
/*
	add R_ConstAverageL,R_ConstCurrent2	;��������� ���������� � ������ ��� ���������� ���������.
	adc R_ConstAverageH,R_ConstCurrent3	
	lsr R_ConstAverageH			
	ror R_ConstAverageL			
*/
						;��������� ������ ������� ���������.

	mov XL,R_ConstAverageL		
	mov XH,R_ConstAverageH

	mov	tmp,XL
	mov	tmp2,XH
	lsr	tmp2	;Delta=Average/4
	ror	tmp
	lsr tmp2
	ror	tmp	
;	lsr tmp2
;	ror	tmp	
		;������ � TMP ����� 8-������ Average-�������
	cpi	tmp,C_Delta
	brcc	COMP_DeltaMin
	ldi	tmp,C_Delta	;���� ������������ ������ ������� ���� (<C_Delta), �� ������ ���
	clr	tmp2		;   ���������� ��������� C_Delta
	;
COMP_DeltaMin:
	sub XL,tmp			;������ ������� ����� = ������� �������-C_Delta
	sbc	XH,tmp2
	;

	;���� �� ��������� �������,tmp,tmp2 �� ������ !!!
	mov R_DeltaMinL,XL		
	mov R_DeltaMinH,XH
	brcc COMP_DeltaMax		;���� ������ ������� - ���� "0", �� ����� ��� ����� "0"
	clr	R_DeltaMinL
	clr	R_DeltaMinH
COMP_DeltaMax:
	mov XL,R_ConstAverageL		
	mov XH,R_ConstAverageH
	add XL,tmp			;������� ������� ����� = ������� �������+C_Delta
	adc XH,tmp2
	;
	mov R_DeltaMaxL,XL
	mov R_DeltaMaxH,XH
	brcc AfterCompDelta		;���� ������ ������� - ���� 0xFFFF, �� ����� ��� ����� 0xFFFF.
	ser	TMP
	mov R_DeltaMaxL,TMP
	mov R_DeltaMaxH,TMP
AfterCompDelta:
	POP_ALL
	ret	


