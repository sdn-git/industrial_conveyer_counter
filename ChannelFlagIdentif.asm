
ChannelFlagIdentif_ON:
	lds tmp2,S_DetailIndeficat
	lds tmp,S_NumPort
	cpi tmp,0
	breq Channlel_0
	cpi tmp,1
	breq Channlel_1
	cpi tmp,2
	breq Channlel_2
	cpi tmp,3
	breq Channlel_3
	cpi tmp,4
	breq Channlel_4
	cpi tmp,5
	breq Channlel_5
	cpi tmp,6
	breq Channlel_6
	cpi tmp,7
	breq Channlel_7

Channlel_0:
	sbr tmp2,m_1stChannel
	rjmp Exit_ChannelFlagIdentif
Channlel_1:
	sbr tmp2,m_2ndChannel
	rjmp Exit_ChannelFlagIdentif
Channlel_2:
	sbr tmp2,m_3rdChannel
	rjmp Exit_ChannelFlagIdentif
Channlel_3:
	sbr tmp2,m_4thChannel
	rjmp Exit_ChannelFlagIdentif
Channlel_4:
	sbr tmp2,m_5thChannel
	rjmp Exit_ChannelFlagIdentif
Channlel_5:
	sbr tmp2,m_6thChannel
	rjmp Exit_ChannelFlagIdentif
Channlel_6:
	sbr tmp2,m_7thChannel
	rjmp Exit_ChannelFlagIdentif
Channlel_7:
	sbr tmp2,m_8thChannel
	rjmp Exit_ChannelFlagIdentif

Exit_ChannelFlagIdentif:
sts S_DetailIndeficat,tmp2
ret

ChannelFlagIdentif_OFF:
	lds tmp2,S_DetailIndeficat
	lds tmp,S_NumPort
	cpi tmp,0
	breq ChannlelOFF_0
	cpi tmp,1
	breq ChannlelOFF_1
	cpi tmp,2
	breq ChannlelOFF_2
	cpi tmp,3
	breq ChannlelOFF_3
	cpi tmp,4
	breq ChannlelOFF_4
	cpi tmp,5
	breq ChannlelOFF_5
	cpi tmp,6
	breq ChannlelOFF_6
	cpi tmp,7
	breq ChannlelOFF_7

ChannlelOFF_0:
	cbr tmp2,m_1stChannel
	rjmp Exit_ChannelFlagIdentif_OFF
ChannlelOFF_1:
	cbr tmp2,m_2ndChannel
	rjmp Exit_ChannelFlagIdentif_OFF
ChannlelOFF_2:
	cbr tmp2,m_3rdChannel
	rjmp Exit_ChannelFlagIdentif_OFF
ChannlelOFF_3:
	cbr tmp2,m_4thChannel
	rjmp Exit_ChannelFlagIdentif_OFF
ChannlelOFF_4:
	cbr tmp2,m_5thChannel
	rjmp Exit_ChannelFlagIdentif_OFF
ChannlelOFF_5:
	cbr tmp2,m_6thChannel
	rjmp Exit_ChannelFlagIdentif_OFF
ChannlelOFF_6:
	cbr tmp2,m_7thChannel
	rjmp Exit_ChannelFlagIdentif_OFF
ChannlelOFF_7:
	cbr tmp2,m_8thChannel
	rjmp Exit_ChannelFlagIdentif_OFF

Exit_ChannelFlagIdentif_OFF:
sts S_DetailIndeficat,tmp2
ret

ConstSetChannel:
	lds tmp2,S_ConstChannelSet
	lds tmp,S_NumPort
	cpi tmp,0
	breq ChannlelConst_0
	cpi tmp,1
	breq ChannlelConst_1
	cpi tmp,2
	breq ChannlelConst_2
	cpi tmp,3
	breq ChannlelConst_3
	cpi tmp,4
	breq ChannlelConst_4
	cpi tmp,5
	breq ChannlelConst_5
	cpi tmp,6
	breq ChannlelConst_6
	cpi tmp,7
	breq ChannlelConst_7

ChannlelConst_0:
	sbr tmp2,m_1stChannel
	rjmp Exit_ChannelFlagIdentif_3
ChannlelConst_1:
	sbr tmp2,m_2ndChannel
	rjmp Exit_ChannelFlagIdentif_3
ChannlelConst_2:
	sbr tmp2,m_3rdChannel
	rjmp Exit_ChannelFlagIdentif_3
ChannlelConst_3:
	sbr tmp2,m_4thChannel
	rjmp Exit_ChannelFlagIdentif_3
ChannlelConst_4:
	sbr tmp2,m_5thChannel
	rjmp Exit_ChannelFlagIdentif_3
ChannlelConst_5:
	sbr tmp2,m_6thChannel
	rjmp Exit_ChannelFlagIdentif_3
ChannlelConst_6:
	sbr tmp2,m_7thChannel
	rjmp Exit_ChannelFlagIdentif_3
ChannlelConst_7:
	sbr tmp2,m_8thChannel
	rjmp Exit_ChannelFlagIdentif_3

Exit_ChannelFlagIdentif_3:
sts S_ConstChannelSet,tmp2
ret
