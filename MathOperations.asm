MathOperations:
	PUSH_ALL
	clr tmp
Divide:				;Накопленную сумму делим сдвигом на количество выборок, 
  	inc tmp			;  которое должно быть кратно степени 2.
	lsr R_ConstCurrent3
	ror R_ConstCurrent2
	cpi tmp,C_Shift
	brne Divide
	


	MOV R_ConstAverageL,R_ConstCurrent2
	MOV	R_ConstAverageH,R_ConstCurrent3
	clr R_ConstCurrent1
	clr R_ConstCurrent2
	clr R_ConstCurrent3	
	;Только что полученный результат= сумме выборок /SampleCount
/*
	add R_ConstAverageL,R_ConstCurrent2	;Усредняем предыдущий и только что полученный результат.
	adc R_ConstAverageH,R_ConstCurrent3	
	lsr R_ConstAverageH			
	ror R_ConstAverageL			
*/
						;Вычисляем полосу допуска детектора.

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
		;Теперь в TMP имеем 8-битный Average-уровень
	cpi	tmp,C_Delta
	brcc	COMP_DeltaMin
	ldi	tmp,C_Delta	;Если динамическая дельта слишком мала (<C_Delta), то вместо нее
	clr	tmp2		;   используем константу C_Delta
	;
COMP_DeltaMin:
	sub XL,tmp			;Нижняя граница будет = средний уровень-C_Delta
	sbc	XH,tmp2
	;

	;пока не определим границы,tmp,tmp2 не портим !!!
	mov R_DeltaMinL,XL		
	mov R_DeltaMinH,XH
	brcc COMP_DeltaMax		;Если нижняя границы - ниже "0", то пусть она будет "0"
	clr	R_DeltaMinL
	clr	R_DeltaMinH
COMP_DeltaMax:
	mov XL,R_ConstAverageL		
	mov XH,R_ConstAverageH
	add XL,tmp			;Верхняя граница будет = средний уровень+C_Delta
	adc XH,tmp2
	;
	mov R_DeltaMaxL,XL
	mov R_DeltaMaxH,XH
	brcc AfterCompDelta		;Если нижняя границы - выше 0xFFFF, то пусть она будет 0xFFFF.
	ser	TMP
	mov R_DeltaMaxL,TMP
	mov R_DeltaMaxH,TMP
AfterCompDelta:
	POP_ALL
	ret	


