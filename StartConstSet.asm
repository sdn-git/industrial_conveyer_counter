StartConstSet:
	Delay_1:
	inc xtmp
	cpi xtmp,0xff
	brne Delay_1
	clr xtmp
	inc ytmp
	cpi ytmp,0xff
	brne Delay_1
	inc ztmp
	clr xtmp
	clr ytmp
	cpi ztmp,0xff
	brne Delay_1
 	sbr R_Flags,m_ConstsSet	
Exit_StartConstSet:
ret
