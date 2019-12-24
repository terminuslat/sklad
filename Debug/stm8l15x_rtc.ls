   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  97                     ; 67 ErrorStatus RTC_DeInit(void)
  97                     ; 68 {
  99                     	switch	.text
 100  0000               _RTC_DeInit:
 102  0000 5205          	subw	sp,#5
 103       00000005      OFST:	set	5
 106                     ; 69   ErrorStatus status = ERROR;
 108                     ; 70   uint16_t wutwfcount = 0;
 110  0002 5f            	clrw	x
 111  0003 1f02          	ldw	(OFST-3,sp),x
 113                     ; 71   uint16_t recalpfcount = 0;
 115  0005 5f            	clrw	x
 116  0006 1f04          	ldw	(OFST-1,sp),x
 118                     ; 74   RTC_WriteProtectionCmd(DISABLE);
 120  0008 4f            	clr	a
 121  0009 cd0226        	call	_RTC_WriteProtectionCmd
 123                     ; 77   if (RTC_EnterInitMode() == ERROR)
 125  000c cd01ae        	call	_RTC_EnterInitMode
 127  000f 4d            	tnz	a
 128  0010 260c          	jrne	L35
 129                     ; 79     status = ERROR;
 131  0012 0f01          	clr	(OFST-4,sp)
 133                     ; 81     RTC_WriteProtectionCmd(ENABLE);
 135  0014 a601          	ld	a,#1
 136  0016 cd0226        	call	_RTC_WriteProtectionCmd
 139  0019               L55:
 140                     ; 177   return (ErrorStatus)status;
 142  0019 7b01          	ld	a,(OFST-4,sp)
 145  001b 5b05          	addw	sp,#5
 146  001d 81            	ret
 147  001e               L35:
 148                     ; 86     RTC->TR1 = RTC_TR1_RESET_VALUE;
 150  001e 725f5140      	clr	20800
 151                     ; 87     RTC->TR2 = RTC_TR2_RESET_VALUE;
 153  0022 725f5141      	clr	20801
 154                     ; 88     RTC->TR3 = RTC_TR3_RESET_VALUE;
 156  0026 725f5142      	clr	20802
 157                     ; 91     RTC->DR1 = RTC_DR1_RESET_VALUE;
 159  002a 35015144      	mov	20804,#1
 160                     ; 92     RTC->DR2 = RTC_DR2_RESET_VALUE;
 162  002e 35215145      	mov	20805,#33
 163                     ; 93     RTC->DR3 = RTC_DR3_RESET_VALUE;
 165  0032 725f5146      	clr	20806
 166                     ; 96     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 168  0036 725f5150      	clr	20816
 169                     ; 97     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 171  003a 35ff5151      	mov	20817,#255
 172                     ; 98     RTC->APRER  = RTC_APRER_RESET_VALUE;
 174  003e 357f5152      	mov	20818,#127
 175                     ; 100     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 177  0042 725f516c      	clr	20844
 178                     ; 101     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 180  0046 725f516d      	clr	20845
 181                     ; 105     RTC->CR1 = RTC_CR1_RESET_VALUE;
 183  004a 725f5148      	clr	20808
 184                     ; 106     RTC->CR2 = RTC_CR2_RESET_VALUE;
 186  004e 725f5149      	clr	20809
 187                     ; 107     RTC->CR3 = RTC_CR3_RESET_VALUE;
 189  0052 725f514a      	clr	20810
 191  0056 200b          	jra	L36
 192  0058               L75:
 193                     ; 112       wutwfcount++;
 195  0058 1e02          	ldw	x,(OFST-3,sp)
 196  005a 1c0001        	addw	x,#1
 197  005d 1f02          	ldw	(OFST-3,sp),x
 199                     ; 113       RTC->ISR1 = 0;
 201  005f 725f514c      	clr	20812
 202  0063               L36:
 203                     ; 110     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 205  0063 c6514c        	ld	a,20812
 206  0066 a504          	bcp	a,#4
 207  0068 2607          	jrne	L76
 209  006a 1e02          	ldw	x,(OFST-3,sp)
 210  006c a3ffff        	cpw	x,#65535
 211  006f 26e7          	jrne	L75
 212  0071               L76:
 213                     ; 116     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 215  0071 c6514c        	ld	a,20812
 216  0074 a504          	bcp	a,#4
 217  0076 2609          	jrne	L17
 218                     ; 118       status = ERROR;
 220  0078 0f01          	clr	(OFST-4,sp)
 222                     ; 120       RTC_WriteProtectionCmd(ENABLE);
 224  007a a601          	ld	a,#1
 225  007c cd0226        	call	_RTC_WriteProtectionCmd
 228  007f 2098          	jra	L55
 229  0081               L17:
 230                     ; 125       RTC->CR1 = RTC_CR1_RESET_VALUE;
 232  0081 725f5148      	clr	20808
 233                     ; 128       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 235  0085 35ff5154      	mov	20820,#255
 236                     ; 129       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 238  0089 35ff5155      	mov	20821,#255
 239                     ; 132       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 241  008d 725f515c      	clr	20828
 242                     ; 133       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 244  0091 725f515d      	clr	20829
 245                     ; 134       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 247  0095 725f515e      	clr	20830
 248                     ; 135       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 250  0099 725f515f      	clr	20831
 251                     ; 137       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 253  009d 725f5164      	clr	20836
 254                     ; 138       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 256  00a1 725f5165      	clr	20837
 257                     ; 139       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 259  00a5 725f5166      	clr	20838
 260                     ; 142       RTC->ISR1 = (uint8_t)0x00;
 262  00a9 725f514c      	clr	20812
 263                     ; 143       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 265  00ad 725f514d      	clr	20813
 266                     ; 145       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 268  00b1 c6514c        	ld	a,20812
 269  00b4 a502          	bcp	a,#2
 270  00b6 2717          	jreq	L57
 272  00b8 2007          	jra	L101
 273  00ba               L77:
 274                     ; 149           recalpfcount++;
 276  00ba 1e04          	ldw	x,(OFST-1,sp)
 277  00bc 1c0001        	addw	x,#1
 278  00bf 1f04          	ldw	(OFST-1,sp),x
 280  00c1               L101:
 281                     ; 147         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 283  00c1 c6514c        	ld	a,20812
 284  00c4 a502          	bcp	a,#2
 285  00c6 2707          	jreq	L57
 287  00c8 1e04          	ldw	x,(OFST-1,sp)
 288  00ca a3ffff        	cpw	x,#65535
 289  00cd 26eb          	jrne	L77
 290  00cf               L57:
 291                     ; 152       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 293  00cf c6514c        	ld	a,20812
 294  00d2 a502          	bcp	a,#2
 295  00d4 2618          	jrne	L701
 296                     ; 154         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 298  00d6 725f516a      	clr	20842
 299                     ; 155         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 301  00da 725f516b      	clr	20843
 302                     ; 157         if (RTC_WaitForSynchro() == ERROR)
 304  00de cd01ee        	call	_RTC_WaitForSynchro
 306  00e1 4d            	tnz	a
 307  00e2 2604          	jrne	L111
 308                     ; 159           status = ERROR;
 310  00e4 0f01          	clr	(OFST-4,sp)
 313  00e6 2008          	jra	L511
 314  00e8               L111:
 315                     ; 163           status = SUCCESS;
 317  00e8 a601          	ld	a,#1
 318  00ea 6b01          	ld	(OFST-4,sp),a
 320  00ec 2002          	jra	L511
 321  00ee               L701:
 322                     ; 168         status = ERROR;
 324  00ee 0f01          	clr	(OFST-4,sp)
 326  00f0               L511:
 327                     ; 172       RTC_WriteProtectionCmd(ENABLE);
 329  00f0 a601          	ld	a,#1
 330  00f2 cd0226        	call	_RTC_WriteProtectionCmd
 332  00f5 ac190019      	jpf	L55
 434                     ; 189 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 434                     ; 190 {
 435                     	switch	.text
 436  00f9               _RTC_Init:
 438  00f9 89            	pushw	x
 439  00fa 88            	push	a
 440       00000001      OFST:	set	1
 443                     ; 191   ErrorStatus status = ERROR;
 445                     ; 194   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 447                     ; 195   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 449                     ; 196   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 451                     ; 199   RTC_WriteProtectionCmd(DISABLE);
 453  00fb 4f            	clr	a
 454  00fc cd0226        	call	_RTC_WriteProtectionCmd
 456                     ; 202   if (RTC_EnterInitMode() == ERROR)
 458  00ff cd01ae        	call	_RTC_EnterInitMode
 460  0102 4d            	tnz	a
 461  0103 2604          	jrne	L761
 462                     ; 204     status = ERROR;
 464  0105 0f01          	clr	(OFST+0,sp)
 467  0107 202c          	jra	L171
 468  0109               L761:
 469                     ; 209     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 471  0109 721d5148      	bres	20808,#6
 472                     ; 212     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 474  010d 1e02          	ldw	x,(OFST+1,sp)
 475  010f c65148        	ld	a,20808
 476  0112 fa            	or	a,(x)
 477  0113 c75148        	ld	20808,a
 478                     ; 215     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 480  0116 1e02          	ldw	x,(OFST+1,sp)
 481  0118 ee02          	ldw	x,(2,x)
 482  011a 4f            	clr	a
 483  011b 01            	rrwa	x,a
 484  011c 9f            	ld	a,xl
 485  011d c75150        	ld	20816,a
 486                     ; 216     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 488  0120 1e02          	ldw	x,(OFST+1,sp)
 489  0122 e603          	ld	a,(3,x)
 490  0124 c75151        	ld	20817,a
 491                     ; 217     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 493  0127 1e02          	ldw	x,(OFST+1,sp)
 494  0129 e601          	ld	a,(1,x)
 495  012b c75152        	ld	20818,a
 496                     ; 220     RTC_ExitInitMode();
 498  012e cd01e9        	call	_RTC_ExitInitMode
 500                     ; 222     status = SUCCESS;
 502  0131 a601          	ld	a,#1
 503  0133 6b01          	ld	(OFST+0,sp),a
 505  0135               L171:
 506                     ; 226   RTC_WriteProtectionCmd(ENABLE);
 508  0135 a601          	ld	a,#1
 509  0137 cd0226        	call	_RTC_WriteProtectionCmd
 511                     ; 229   return (ErrorStatus)(status);
 513  013a 7b01          	ld	a,(OFST+0,sp)
 516  013c 5b03          	addw	sp,#3
 517  013e 81            	ret
 554                     ; 239 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 554                     ; 240 {
 555                     	switch	.text
 556  013f               _RTC_StructInit:
 560                     ; 242   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 562  013f 7f            	clr	(x)
 563                     ; 245   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 565  0140 a67f          	ld	a,#127
 566  0142 e701          	ld	(1,x),a
 567                     ; 248   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 569  0144 90ae00ff      	ldw	y,#255
 570  0148 ef02          	ldw	(2,x),y
 571                     ; 249 }
 574  014a 81            	ret
 669                     ; 257 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
 669                     ; 258 {
 670                     	switch	.text
 671  014b               _RTC_TimeStructInit:
 675                     ; 260   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
 677  014b 6f03          	clr	(3,x)
 678                     ; 261   RTC_TimeStruct->RTC_Hours = 0;
 680  014d 7f            	clr	(x)
 681                     ; 262   RTC_TimeStruct->RTC_Minutes = 0;
 683  014e 6f01          	clr	(1,x)
 684                     ; 263   RTC_TimeStruct->RTC_Seconds = 0;
 686  0150 6f02          	clr	(2,x)
 687                     ; 264 }
 690  0152 81            	ret
 918                     ; 272 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
 918                     ; 273 {
 919                     	switch	.text
 920  0153               _RTC_DateStructInit:
 924                     ; 275   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
 926  0153 a601          	ld	a,#1
 927  0155 f7            	ld	(x),a
 928                     ; 276   RTC_DateStruct->RTC_Date = 1;
 930  0156 a601          	ld	a,#1
 931  0158 e702          	ld	(2,x),a
 932                     ; 277   RTC_DateStruct->RTC_Month = RTC_Month_January;
 934  015a a601          	ld	a,#1
 935  015c e701          	ld	(1,x),a
 936                     ; 278   RTC_DateStruct->RTC_Year = 0;
 938  015e 6f03          	clr	(3,x)
 939                     ; 279 }
 942  0160 81            	ret
1045                     ; 288 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
1045                     ; 289 {
1046                     	switch	.text
1047  0161               _RTC_AlarmStructInit:
1051                     ; 291   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
1053  0161 6f03          	clr	(3,x)
1054                     ; 292   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
1056  0163 7f            	clr	(x)
1057                     ; 293   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
1059  0164 6f01          	clr	(1,x)
1060                     ; 294   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
1062  0166 6f02          	clr	(2,x)
1063                     ; 297   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
1065  0168 6f05          	clr	(5,x)
1066                     ; 298   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
1068  016a a601          	ld	a,#1
1069  016c e706          	ld	(6,x),a
1070                     ; 301   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
1072  016e a6f0          	ld	a,#240
1073  0170 e704          	ld	(4,x),a
1074                     ; 302 }
1077  0172 81            	ret
1170                     ; 314 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
1170                     ; 315 {
1171                     	switch	.text
1172  0173               _RTC_ITConfig:
1174  0173 89            	pushw	x
1175       00000000      OFST:	set	0
1178                     ; 317   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
1180                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
1182                     ; 321   RTC_WriteProtectionCmd(DISABLE);
1184  0174 4f            	clr	a
1185  0175 cd0226        	call	_RTC_WriteProtectionCmd
1187                     ; 323   if (NewState != DISABLE)
1189  0178 0d05          	tnz	(OFST+5,sp)
1190  017a 2716          	jreq	L315
1191                     ; 326     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
1193  017c 7b02          	ld	a,(OFST+2,sp)
1194  017e a4f0          	and	a,#240
1195  0180 ca5149        	or	a,20809
1196  0183 c75149        	ld	20809,a
1197                     ; 327     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
1199  0186 7b02          	ld	a,(OFST+2,sp)
1200  0188 a401          	and	a,#1
1201  018a ca516c        	or	a,20844
1202  018d c7516c        	ld	20844,a
1204  0190 2016          	jra	L515
1205  0192               L315:
1206                     ; 332     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
1208  0192 7b02          	ld	a,(OFST+2,sp)
1209  0194 a4f0          	and	a,#240
1210  0196 43            	cpl	a
1211  0197 c45149        	and	a,20809
1212  019a c75149        	ld	20809,a
1213                     ; 333     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
1215  019d 7b02          	ld	a,(OFST+2,sp)
1216  019f a401          	and	a,#1
1217  01a1 43            	cpl	a
1218  01a2 c4516c        	and	a,20844
1219  01a5 c7516c        	ld	20844,a
1220  01a8               L515:
1221                     ; 337   RTC_WriteProtectionCmd(ENABLE);
1223  01a8 a601          	ld	a,#1
1224  01aa ad7a          	call	_RTC_WriteProtectionCmd
1226                     ; 338 }
1229  01ac 85            	popw	x
1230  01ad 81            	ret
1275                     ; 347 ErrorStatus RTC_EnterInitMode(void)
1275                     ; 348 {
1276                     	switch	.text
1277  01ae               _RTC_EnterInitMode:
1279  01ae 5203          	subw	sp,#3
1280       00000003      OFST:	set	3
1283                     ; 349   ErrorStatus status = ERROR;
1285                     ; 350   uint16_t initfcount = 0;
1287  01b0 5f            	clrw	x
1288  01b1 1f02          	ldw	(OFST-1,sp),x
1290                     ; 353   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
1292  01b3 c6514c        	ld	a,20812
1293  01b6 a540          	bcp	a,#64
1294  01b8 261b          	jrne	L145
1295                     ; 356     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
1297  01ba 3580514c      	mov	20812,#128
1299  01be 2007          	jra	L745
1300  01c0               L345:
1301                     ; 361       initfcount++;
1303  01c0 1e02          	ldw	x,(OFST-1,sp)
1304  01c2 1c0001        	addw	x,#1
1305  01c5 1f02          	ldw	(OFST-1,sp),x
1307  01c7               L745:
1308                     ; 359     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
1310  01c7 c6514c        	ld	a,20812
1311  01ca a540          	bcp	a,#64
1312  01cc 2607          	jrne	L145
1314  01ce 1e02          	ldw	x,(OFST-1,sp)
1315  01d0 a3ffff        	cpw	x,#65535
1316  01d3 26eb          	jrne	L345
1317  01d5               L145:
1318                     ; 365   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
1320  01d5 c6514c        	ld	a,20812
1321  01d8 a540          	bcp	a,#64
1322  01da 2604          	jrne	L555
1323                     ; 367     status = ERROR;
1325  01dc 0f01          	clr	(OFST-2,sp)
1328  01de 2004          	jra	L755
1329  01e0               L555:
1330                     ; 371     status = SUCCESS;
1332  01e0 a601          	ld	a,#1
1333  01e2 6b01          	ld	(OFST-2,sp),a
1335  01e4               L755:
1336                     ; 374   return (ErrorStatus)status;
1338  01e4 7b01          	ld	a,(OFST-2,sp)
1341  01e6 5b03          	addw	sp,#3
1342  01e8 81            	ret
1365                     ; 382 void RTC_ExitInitMode(void)
1365                     ; 383 {
1366                     	switch	.text
1367  01e9               _RTC_ExitInitMode:
1371                     ; 385   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1373  01e9 721f514c      	bres	20812,#7
1374                     ; 386 }
1377  01ed 81            	ret
1422                     ; 397 ErrorStatus RTC_WaitForSynchro(void)
1422                     ; 398 {
1423                     	switch	.text
1424  01ee               _RTC_WaitForSynchro:
1426  01ee 5203          	subw	sp,#3
1427       00000003      OFST:	set	3
1430                     ; 399   uint16_t rsfcount = 0;
1432  01f0 5f            	clrw	x
1433  01f1 1f02          	ldw	(OFST-1,sp),x
1435                     ; 400   ErrorStatus status = ERROR;
1437                     ; 403   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
1439  01f3 c6514c        	ld	a,20812
1440  01f6 a45f          	and	a,#95
1441  01f8 c7514c        	ld	20812,a
1443  01fb 2007          	jra	L516
1444  01fd               L316:
1445                     ; 408     rsfcount++;
1447  01fd 1e02          	ldw	x,(OFST-1,sp)
1448  01ff 1c0001        	addw	x,#1
1449  0202 1f02          	ldw	(OFST-1,sp),x
1451  0204               L516:
1452                     ; 406   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
1454  0204 c6514c        	ld	a,20812
1455  0207 a520          	bcp	a,#32
1456  0209 2607          	jrne	L126
1458  020b 1e02          	ldw	x,(OFST-1,sp)
1459  020d a3ffff        	cpw	x,#65535
1460  0210 26eb          	jrne	L316
1461  0212               L126:
1462                     ; 412   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
1464  0212 c6514c        	ld	a,20812
1465  0215 a520          	bcp	a,#32
1466  0217 2706          	jreq	L326
1467                     ; 414     status = SUCCESS;
1469  0219 a601          	ld	a,#1
1470  021b 6b01          	ld	(OFST-2,sp),a
1473  021d 2002          	jra	L526
1474  021f               L326:
1475                     ; 418     status = ERROR;
1477  021f 0f01          	clr	(OFST-2,sp)
1479  0221               L526:
1480                     ; 421   return (ErrorStatus)status;
1482  0221 7b01          	ld	a,(OFST-2,sp)
1485  0223 5b03          	addw	sp,#3
1486  0225 81            	ret
1522                     ; 430 void RTC_WriteProtectionCmd(FunctionalState NewState)
1522                     ; 431 {
1523                     	switch	.text
1524  0226               _RTC_WriteProtectionCmd:
1528                     ; 433   assert_param(IS_FUNCTIONAL_STATE(NewState));
1530                     ; 435   if (NewState != DISABLE)
1532  0226 4d            	tnz	a
1533  0227 2706          	jreq	L546
1534                     ; 438     RTC->WPR = RTC_WPR_EnableKey;
1536  0229 35ff5159      	mov	20825,#255
1538  022d 2008          	jra	L746
1539  022f               L546:
1540                     ; 443     RTC->WPR = RTC_WPR_DisableKey1;
1542  022f 35ca5159      	mov	20825,#202
1543                     ; 444     RTC->WPR = RTC_WPR_DisableKey2;
1545  0233 35535159      	mov	20825,#83
1546  0237               L746:
1547                     ; 446 }
1550  0237 81            	ret
1587                     ; 454 void RTC_BypassShadowCmd(FunctionalState NewState)
1587                     ; 455 {
1588                     	switch	.text
1589  0238               _RTC_BypassShadowCmd:
1591  0238 88            	push	a
1592       00000000      OFST:	set	0
1595                     ; 457   assert_param(IS_FUNCTIONAL_STATE(NewState));
1597                     ; 460   RTC_WriteProtectionCmd(DISABLE);
1599  0239 4f            	clr	a
1600  023a adea          	call	_RTC_WriteProtectionCmd
1602                     ; 462   if (NewState != DISABLE)
1604  023c 0d01          	tnz	(OFST+1,sp)
1605  023e 2706          	jreq	L766
1606                     ; 465     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
1608  0240 72185148      	bset	20808,#4
1610  0244 2004          	jra	L176
1611  0246               L766:
1612                     ; 470     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
1614  0246 72195148      	bres	20808,#4
1615  024a               L176:
1616                     ; 474   RTC_WriteProtectionCmd(ENABLE);
1618  024a a601          	ld	a,#1
1619  024c add8          	call	_RTC_WriteProtectionCmd
1621                     ; 475 }
1624  024e 84            	pop	a
1625  024f 81            	ret
1661                     ; 483 void RTC_RatioCmd(FunctionalState NewState)
1661                     ; 484 {
1662                     	switch	.text
1663  0250               _RTC_RatioCmd:
1665  0250 88            	push	a
1666       00000000      OFST:	set	0
1669                     ; 486   assert_param(IS_FUNCTIONAL_STATE(NewState));
1671                     ; 489   RTC_WriteProtectionCmd(DISABLE);
1673  0251 4f            	clr	a
1674  0252 add2          	call	_RTC_WriteProtectionCmd
1676                     ; 491   if (NewState != DISABLE)
1678  0254 0d01          	tnz	(OFST+1,sp)
1679  0256 2706          	jreq	L117
1680                     ; 494     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
1682  0258 721a5148      	bset	20808,#5
1684  025c 2004          	jra	L317
1685  025e               L117:
1686                     ; 499     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
1688  025e 721b5148      	bres	20808,#5
1689  0262               L317:
1690                     ; 503   RTC_WriteProtectionCmd(ENABLE);
1692  0262 a601          	ld	a,#1
1693  0264 adc0          	call	_RTC_WriteProtectionCmd
1695                     ; 504 }
1698  0266 84            	pop	a
1699  0267 81            	ret
1791                     ; 516 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1791                     ; 517                         RTC_TimeTypeDef* RTC_TimeStruct)
1791                     ; 518 {
1792                     	switch	.text
1793  0268               _RTC_SetTime:
1795  0268 88            	push	a
1796  0269 88            	push	a
1797       00000001      OFST:	set	1
1800                     ; 519   ErrorStatus status = ERROR;
1802                     ; 520   uint8_t temp = 0;
1804                     ; 523   assert_param(IS_RTC_FORMAT(RTC_Format));
1806                     ; 525   if (RTC_Format == RTC_Format_BIN)
1808  026a 4d            	tnz	a
1809  026b 2609          	jrne	L167
1810                     ; 528     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1812  026d c65148        	ld	a,20808
1813  0270 a540          	bcp	a,#64
1814  0272 2700          	jreq	L367
1815                     ; 530       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1817                     ; 531       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1820  0274               L367:
1821                     ; 535       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1823                     ; 537     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1825                     ; 538     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1828  0274 2007          	jra	L767
1829  0276               L167:
1830                     ; 543     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1832  0276 c65148        	ld	a,20808
1833  0279 a540          	bcp	a,#64
1834  027b 2700          	jreq	L177
1835                     ; 545       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1837                     ; 546       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1840  027d               L177:
1841                     ; 550       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1843                     ; 552     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1845                     ; 553     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1847  027d               L767:
1848                     ; 558   RTC_WriteProtectionCmd(DISABLE);
1850  027d 4f            	clr	a
1851  027e ada6          	call	_RTC_WriteProtectionCmd
1853                     ; 561   if (RTC_EnterInitMode() == ERROR)
1855  0280 cd01ae        	call	_RTC_EnterInitMode
1857  0283 4d            	tnz	a
1858  0284 2608          	jrne	L577
1859                     ; 563     status = ERROR;
1861  0286 0f01          	clr	(OFST+0,sp)
1863                     ; 565     RTC_WriteProtectionCmd(ENABLE);
1865  0288 a601          	ld	a,#1
1866  028a ad9a          	call	_RTC_WriteProtectionCmd
1869  028c 2072          	jra	L777
1870  028e               L577:
1871                     ; 570     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1873  028e c65148        	ld	a,20808
1874  0291 a540          	bcp	a,#64
1875  0293 2708          	jreq	L1001
1876                     ; 572       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1878                     ; 573       temp = RTC_TimeStruct->RTC_H12;
1880  0295 1e05          	ldw	x,(OFST+4,sp)
1881  0297 e603          	ld	a,(3,x)
1882  0299 6b01          	ld	(OFST+0,sp),a
1885  029b 2002          	jra	L3001
1886  029d               L1001:
1887                     ; 577       temp = 0;
1889  029d 0f01          	clr	(OFST+0,sp)
1891  029f               L3001:
1892                     ; 580     if (RTC_Format != RTC_Format_BIN)
1894  029f 0d02          	tnz	(OFST+1,sp)
1895  02a1 2718          	jreq	L5001
1896                     ; 582       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1898  02a3 1e05          	ldw	x,(OFST+4,sp)
1899  02a5 e602          	ld	a,(2,x)
1900  02a7 c75140        	ld	20800,a
1901                     ; 583       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1903  02aa 1e05          	ldw	x,(OFST+4,sp)
1904  02ac e601          	ld	a,(1,x)
1905  02ae c75141        	ld	20801,a
1906                     ; 584       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1908  02b1 1e05          	ldw	x,(OFST+4,sp)
1909  02b3 f6            	ld	a,(x)
1910  02b4 1a01          	or	a,(OFST+0,sp)
1911  02b6 c75142        	ld	20802,a
1913  02b9 201f          	jra	L7001
1914  02bb               L5001:
1915                     ; 588       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1917  02bb 1e05          	ldw	x,(OFST+4,sp)
1918  02bd e602          	ld	a,(2,x)
1919  02bf cd096a        	call	L3_ByteToBcd2
1921  02c2 c75140        	ld	20800,a
1922                     ; 589       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1924  02c5 1e05          	ldw	x,(OFST+4,sp)
1925  02c7 e601          	ld	a,(1,x)
1926  02c9 cd096a        	call	L3_ByteToBcd2
1928  02cc c75141        	ld	20801,a
1929                     ; 590       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1931  02cf 1e05          	ldw	x,(OFST+4,sp)
1932  02d1 f6            	ld	a,(x)
1933  02d2 cd096a        	call	L3_ByteToBcd2
1935  02d5 1a01          	or	a,(OFST+0,sp)
1936  02d7 c75142        	ld	20802,a
1937  02da               L7001:
1938                     ; 593     (void)(RTC->DR3);
1940  02da c65146        	ld	a,20806
1941                     ; 596     RTC_ExitInitMode();
1943  02dd cd01e9        	call	_RTC_ExitInitMode
1945                     ; 599     RTC_WriteProtectionCmd(ENABLE);
1947  02e0 a601          	ld	a,#1
1948  02e2 cd0226        	call	_RTC_WriteProtectionCmd
1950                     ; 602     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1952  02e5 c65148        	ld	a,20808
1953  02e8 a510          	bcp	a,#16
1954  02ea 2610          	jrne	L1101
1955                     ; 604       if (RTC_WaitForSynchro() == ERROR)
1957  02ec cd01ee        	call	_RTC_WaitForSynchro
1959  02ef 4d            	tnz	a
1960  02f0 2604          	jrne	L3101
1961                     ; 606         status = ERROR;
1963  02f2 0f01          	clr	(OFST+0,sp)
1966  02f4 200a          	jra	L777
1967  02f6               L3101:
1968                     ; 610         status = SUCCESS;
1970  02f6 a601          	ld	a,#1
1971  02f8 6b01          	ld	(OFST+0,sp),a
1973  02fa 2004          	jra	L777
1974  02fc               L1101:
1975                     ; 615       status = SUCCESS;
1977  02fc a601          	ld	a,#1
1978  02fe 6b01          	ld	(OFST+0,sp),a
1980  0300               L777:
1981                     ; 619   return (ErrorStatus)status;
1983  0300 7b01          	ld	a,(OFST+0,sp)
1986  0302 85            	popw	x
1987  0303 81            	ret
2044                     ; 635 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
2044                     ; 636                  RTC_TimeTypeDef* RTC_TimeStruct)
2044                     ; 637 {
2045                     	switch	.text
2046  0304               _RTC_GetTime:
2048  0304 88            	push	a
2049  0305 88            	push	a
2050       00000001      OFST:	set	1
2053                     ; 638   uint8_t  tmpreg = 0;
2055                     ; 641   assert_param(IS_RTC_FORMAT(RTC_Format));
2057                     ; 645   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
2059  0306 1e05          	ldw	x,(OFST+4,sp)
2060  0308 c65140        	ld	a,20800
2061  030b e702          	ld	(2,x),a
2062                     ; 648   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
2064  030d 1e05          	ldw	x,(OFST+4,sp)
2065  030f c65141        	ld	a,20801
2066  0312 e701          	ld	(1,x),a
2067                     ; 651   tmpreg = (uint8_t)RTC->TR3;
2069  0314 c65142        	ld	a,20802
2070  0317 6b01          	ld	(OFST+0,sp),a
2072                     ; 654   (void) (RTC->DR3) ;
2074  0319 c65146        	ld	a,20806
2075                     ; 657   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF);
2077  031c 721b514c      	bres	20812,#5
2078                     ; 661   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
2080  0320 7b01          	ld	a,(OFST+0,sp)
2081  0322 a4bf          	and	a,#191
2082  0324 1e05          	ldw	x,(OFST+4,sp)
2083  0326 f7            	ld	(x),a
2084                     ; 664   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
2086  0327 7b01          	ld	a,(OFST+0,sp)
2087  0329 a440          	and	a,#64
2088  032b 1e05          	ldw	x,(OFST+4,sp)
2089  032d e703          	ld	(3,x),a
2090                     ; 667   if (RTC_Format == RTC_Format_BIN)
2092  032f 0d02          	tnz	(OFST+1,sp)
2093  0331 261f          	jrne	L1501
2094                     ; 670     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
2096  0333 1e05          	ldw	x,(OFST+4,sp)
2097  0335 f6            	ld	a,(x)
2098  0336 cd0989        	call	L5_Bcd2ToByte
2100  0339 1e05          	ldw	x,(OFST+4,sp)
2101  033b f7            	ld	(x),a
2102                     ; 671     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
2104  033c 1e05          	ldw	x,(OFST+4,sp)
2105  033e e601          	ld	a,(1,x)
2106  0340 cd0989        	call	L5_Bcd2ToByte
2108  0343 1e05          	ldw	x,(OFST+4,sp)
2109  0345 e701          	ld	(1,x),a
2110                     ; 672     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
2112  0347 1e05          	ldw	x,(OFST+4,sp)
2113  0349 e602          	ld	a,(2,x)
2114  034b cd0989        	call	L5_Bcd2ToByte
2116  034e 1e05          	ldw	x,(OFST+4,sp)
2117  0350 e702          	ld	(2,x),a
2118  0352               L1501:
2119                     ; 674 }
2122  0352 85            	popw	x
2123  0353 81            	ret
2175                     ; 685 uint16_t RTC_GetSubSecond(void)
2175                     ; 686 {
2176                     	switch	.text
2177  0354               _RTC_GetSubSecond:
2179  0354 5206          	subw	sp,#6
2180       00000006      OFST:	set	6
2183                     ; 687   uint8_t ssrhreg = 0, ssrlreg = 0;
2187                     ; 688   uint16_t ssrreg = 0;
2189                     ; 691   ssrhreg = RTC->SSRH;
2191  0356 c65157        	ld	a,20823
2192  0359 6b03          	ld	(OFST-3,sp),a
2194                     ; 692   ssrlreg = RTC->SSRL;
2196  035b c65158        	ld	a,20824
2197  035e 6b04          	ld	(OFST-2,sp),a
2199                     ; 695   (void) (RTC->DR3);
2201  0360 c65146        	ld	a,20806
2202                     ; 698   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF);
2204  0363 721b514c      	bres	20812,#5
2205                     ; 700   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
2207  0367 7b04          	ld	a,(OFST-2,sp)
2208  0369 5f            	clrw	x
2209  036a 97            	ld	xl,a
2210  036b 1f01          	ldw	(OFST-5,sp),x
2212  036d 7b03          	ld	a,(OFST-3,sp)
2213  036f 5f            	clrw	x
2214  0370 97            	ld	xl,a
2215  0371 4f            	clr	a
2216  0372 02            	rlwa	x,a
2217  0373 01            	rrwa	x,a
2218  0374 1a02          	or	a,(OFST-4,sp)
2219  0376 01            	rrwa	x,a
2220  0377 1a01          	or	a,(OFST-5,sp)
2221  0379 01            	rrwa	x,a
2222  037a 1f05          	ldw	(OFST-1,sp),x
2224                     ; 701   return (uint16_t)(ssrreg);
2226  037c 1e05          	ldw	x,(OFST-1,sp)
2229  037e 5b06          	addw	sp,#6
2230  0380 81            	ret
2293                     ; 714 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
2293                     ; 715                         RTC_DateTypeDef* RTC_DateStruct)
2293                     ; 716 {
2294                     	switch	.text
2295  0381               _RTC_SetDate:
2297  0381 88            	push	a
2298  0382 89            	pushw	x
2299       00000002      OFST:	set	2
2302                     ; 717   ErrorStatus status = ERROR;
2304                     ; 719   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
2306  0383 4d            	tnz	a
2307  0384 2616          	jrne	L1311
2309  0386 1e06          	ldw	x,(OFST+4,sp)
2310  0388 e601          	ld	a,(1,x)
2311  038a a410          	and	a,#16
2312  038c a110          	cp	a,#16
2313  038e 260c          	jrne	L1311
2314                     ; 721     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
2316  0390 1e06          	ldw	x,(OFST+4,sp)
2317  0392 e601          	ld	a,(1,x)
2318  0394 a4ef          	and	a,#239
2319  0396 ab0a          	add	a,#10
2320  0398 1e06          	ldw	x,(OFST+4,sp)
2321  039a e701          	ld	(1,x),a
2322  039c               L1311:
2323                     ; 725   assert_param(IS_RTC_FORMAT(RTC_Format));
2325                     ; 726   if (RTC_Format == RTC_Format_BIN)
2327  039c 0d03          	tnz	(OFST+1,sp)
2328  039e 2600          	jrne	L3311
2329                     ; 728     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
2331                     ; 729     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
2333                     ; 730     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
2335                     ; 731     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
2337                     ; 732     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
2340  03a0               L3311:
2341                     ; 736     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
2343                     ; 737     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
2345                     ; 738     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
2347                     ; 739     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
2349                     ; 740     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
2351                     ; 742   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
2353                     ; 745   RTC_WriteProtectionCmd(DISABLE);
2355  03a0 4f            	clr	a
2356  03a1 cd0226        	call	_RTC_WriteProtectionCmd
2358                     ; 748   if (RTC_EnterInitMode() == ERROR)
2360  03a4 cd01ae        	call	_RTC_EnterInitMode
2362  03a7 4d            	tnz	a
2363  03a8 2609          	jrne	L7311
2364                     ; 750     status = ERROR;
2366  03aa 0f02          	clr	(OFST+0,sp)
2368                     ; 752     RTC_WriteProtectionCmd(ENABLE);
2370  03ac a601          	ld	a,#1
2371  03ae cd0226        	call	_RTC_WriteProtectionCmd
2374  03b1 2073          	jra	L1411
2375  03b3               L7311:
2376                     ; 756     (void)(RTC->TR1);
2378  03b3 c65140        	ld	a,20800
2379                     ; 759     if (RTC_Format != RTC_Format_BIN)
2381  03b6 0d03          	tnz	(OFST+1,sp)
2382  03b8 271f          	jreq	L3411
2383                     ; 761       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
2385  03ba 1e06          	ldw	x,(OFST+4,sp)
2386  03bc e602          	ld	a,(2,x)
2387  03be c75144        	ld	20804,a
2388                     ; 762       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2390  03c1 1e06          	ldw	x,(OFST+4,sp)
2391  03c3 f6            	ld	a,(x)
2392  03c4 97            	ld	xl,a
2393  03c5 a620          	ld	a,#32
2394  03c7 42            	mul	x,a
2395  03c8 9f            	ld	a,xl
2396  03c9 1e06          	ldw	x,(OFST+4,sp)
2397  03cb ea01          	or	a,(1,x)
2398  03cd c75145        	ld	20805,a
2399                     ; 763       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
2401  03d0 1e06          	ldw	x,(OFST+4,sp)
2402  03d2 e603          	ld	a,(3,x)
2403  03d4 c75146        	ld	20806,a
2405  03d7 202a          	jra	L5411
2406  03d9               L3411:
2407                     ; 767       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
2409  03d9 1e06          	ldw	x,(OFST+4,sp)
2410  03db e602          	ld	a,(2,x)
2411  03dd cd096a        	call	L3_ByteToBcd2
2413  03e0 c75144        	ld	20804,a
2414                     ; 768       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2416  03e3 1e06          	ldw	x,(OFST+4,sp)
2417  03e5 f6            	ld	a,(x)
2418  03e6 97            	ld	xl,a
2419  03e7 a620          	ld	a,#32
2420  03e9 42            	mul	x,a
2421  03ea 9f            	ld	a,xl
2422  03eb 6b01          	ld	(OFST-1,sp),a
2424  03ed 1e06          	ldw	x,(OFST+4,sp)
2425  03ef e601          	ld	a,(1,x)
2426  03f1 cd096a        	call	L3_ByteToBcd2
2428  03f4 1a01          	or	a,(OFST-1,sp)
2429  03f6 c75145        	ld	20805,a
2430                     ; 769       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
2432  03f9 1e06          	ldw	x,(OFST+4,sp)
2433  03fb e603          	ld	a,(3,x)
2434  03fd cd096a        	call	L3_ByteToBcd2
2436  0400 c75146        	ld	20806,a
2437  0403               L5411:
2438                     ; 773     RTC_ExitInitMode();
2440  0403 cd01e9        	call	_RTC_ExitInitMode
2442                     ; 776     RTC_WriteProtectionCmd(ENABLE);
2444  0406 a601          	ld	a,#1
2445  0408 cd0226        	call	_RTC_WriteProtectionCmd
2447                     ; 779     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
2449  040b c65148        	ld	a,20808
2450  040e a510          	bcp	a,#16
2451  0410 2610          	jrne	L7411
2452                     ; 781       if (RTC_WaitForSynchro() == ERROR)
2454  0412 cd01ee        	call	_RTC_WaitForSynchro
2456  0415 4d            	tnz	a
2457  0416 2604          	jrne	L1511
2458                     ; 783         status = ERROR;
2460  0418 0f02          	clr	(OFST+0,sp)
2463  041a 200a          	jra	L1411
2464  041c               L1511:
2465                     ; 787         status = SUCCESS;
2467  041c a601          	ld	a,#1
2468  041e 6b02          	ld	(OFST+0,sp),a
2470  0420 2004          	jra	L1411
2471  0422               L7411:
2472                     ; 792       status = SUCCESS;
2474  0422 a601          	ld	a,#1
2475  0424 6b02          	ld	(OFST+0,sp),a
2477  0426               L1411:
2478                     ; 796   return (ErrorStatus)status;
2480  0426 7b02          	ld	a,(OFST+0,sp)
2483  0428 5b03          	addw	sp,#3
2484  042a 81            	ret
2541                     ; 811 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2541                     ; 812                  RTC_DateTypeDef* RTC_DateStruct)
2541                     ; 813 {
2542                     	switch	.text
2543  042b               _RTC_GetDate:
2545  042b 88            	push	a
2546  042c 88            	push	a
2547       00000001      OFST:	set	1
2550                     ; 814   uint8_t tmpreg = 0;
2552                     ; 817   assert_param(IS_RTC_FORMAT(RTC_Format));
2554                     ; 820   (void) (RTC->TR1) ;
2556  042d c65140        	ld	a,20800
2557                     ; 821   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2559  0430 1e05          	ldw	x,(OFST+4,sp)
2560  0432 c65144        	ld	a,20804
2561  0435 e702          	ld	(2,x),a
2562                     ; 822   tmpreg = (uint8_t)RTC->DR2;
2564  0437 c65145        	ld	a,20805
2565  043a 6b01          	ld	(OFST+0,sp),a
2567                     ; 823   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2569  043c 1e05          	ldw	x,(OFST+4,sp)
2570  043e c65146        	ld	a,20806
2571  0441 e703          	ld	(3,x),a
2572                     ; 826   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF);
2574  0443 721b514c      	bres	20812,#5
2575                     ; 828   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2577  0447 7b01          	ld	a,(OFST+0,sp)
2578  0449 a41f          	and	a,#31
2579  044b 1e05          	ldw	x,(OFST+4,sp)
2580  044d e701          	ld	(1,x),a
2581                     ; 829   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2583  044f 7b01          	ld	a,(OFST+0,sp)
2584  0451 a4e0          	and	a,#224
2585  0453 4e            	swap	a
2586  0454 44            	srl	a
2587  0455 a407          	and	a,#7
2588  0457 1e05          	ldw	x,(OFST+4,sp)
2589  0459 f7            	ld	(x),a
2590                     ; 832   if (RTC_Format == RTC_Format_BIN)
2592  045a 0d02          	tnz	(OFST+1,sp)
2593  045c 2621          	jrne	L7021
2594                     ; 835     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2596  045e 1e05          	ldw	x,(OFST+4,sp)
2597  0460 e603          	ld	a,(3,x)
2598  0462 cd0989        	call	L5_Bcd2ToByte
2600  0465 1e05          	ldw	x,(OFST+4,sp)
2601  0467 e703          	ld	(3,x),a
2602                     ; 836     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2604  0469 1e05          	ldw	x,(OFST+4,sp)
2605  046b e601          	ld	a,(1,x)
2606  046d cd0989        	call	L5_Bcd2ToByte
2608  0470 1e05          	ldw	x,(OFST+4,sp)
2609  0472 e701          	ld	(1,x),a
2610                     ; 837     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2612  0474 1e05          	ldw	x,(OFST+4,sp)
2613  0476 e602          	ld	a,(2,x)
2614  0478 cd0989        	call	L5_Bcd2ToByte
2616  047b 1e05          	ldw	x,(OFST+4,sp)
2617  047d e702          	ld	(2,x),a
2618  047f               L7021:
2619                     ; 839 }
2622  047f 85            	popw	x
2623  0480 81            	ret
2825                     ; 851 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
2825                     ; 852                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
2825                     ; 853 {
2826                     	switch	.text
2827  0481               _RTC_AlarmSubSecondConfig:
2829  0481 89            	pushw	x
2830  0482 88            	push	a
2831       00000001      OFST:	set	1
2834                     ; 854   uint8_t alarmstatus = 0;
2836                     ; 855   ErrorStatus status = ERROR;
2838                     ; 858   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
2840                     ; 859   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
2842                     ; 862   RTC_WriteProtectionCmd(DISABLE);
2844  0483 4f            	clr	a
2845  0484 cd0226        	call	_RTC_WriteProtectionCmd
2847                     ; 865   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
2849  0487 c6514c        	ld	a,20812
2850  048a a540          	bcp	a,#64
2851  048c 2628          	jrne	L7031
2852                     ; 868     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
2854  048e c65149        	ld	a,20809
2855  0491 aa01          	or	a,#1
2856  0493 6b01          	ld	(OFST+0,sp),a
2858                     ; 871     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
2860  0495 72115149      	bres	20809,#0
2861                     ; 874     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
2863  0499 7b02          	ld	a,(OFST+1,sp)
2864  049b c75164        	ld	20836,a
2865                     ; 875     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
2867  049e 7b03          	ld	a,(OFST+2,sp)
2868  04a0 c75165        	ld	20837,a
2869                     ; 876     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
2871  04a3 7b06          	ld	a,(OFST+5,sp)
2872  04a5 c75166        	ld	20838,a
2873                     ; 879     RTC->CR2 |= alarmstatus;
2875  04a8 c65149        	ld	a,20809
2876  04ab 1a01          	or	a,(OFST+0,sp)
2877  04ad c75149        	ld	20809,a
2878                     ; 881     status = SUCCESS;
2880  04b0 a601          	ld	a,#1
2881  04b2 6b01          	ld	(OFST+0,sp),a
2884  04b4 2002          	jra	L1131
2885  04b6               L7031:
2886                     ; 885     status = ERROR;
2888  04b6 0f01          	clr	(OFST+0,sp)
2890  04b8               L1131:
2891                     ; 889   RTC_WriteProtectionCmd(ENABLE);
2893  04b8 a601          	ld	a,#1
2894  04ba cd0226        	call	_RTC_WriteProtectionCmd
2896                     ; 891   return (ErrorStatus)status;
2898  04bd 7b01          	ld	a,(OFST+0,sp)
2901  04bf 5b03          	addw	sp,#3
2902  04c1 81            	ret
2987                     ; 904 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2987                     ; 905                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2987                     ; 906 {
2988                     	switch	.text
2989  04c2               _RTC_SetAlarm:
2991  04c2 88            	push	a
2992  04c3 5205          	subw	sp,#5
2993       00000005      OFST:	set	5
2996                     ; 907   uint8_t tmpreg1 = 0;
2998                     ; 908   uint8_t tmpreg2 = 0;
3000                     ; 909   uint8_t tmpreg3 = 0;
3002                     ; 910   uint8_t tmpreg4 = 0;
3004                     ; 913   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
3006                     ; 914   assert_param(IS_RTC_FORMAT(RTC_Format));
3008                     ; 915   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
3010                     ; 916   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
3012                     ; 919   if (RTC_Format == RTC_Format_BIN)
3014  04c5 4d            	tnz	a
3015  04c6 2609          	jrne	L7531
3016                     ; 922     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
3018  04c8 c65148        	ld	a,20808
3019  04cb a540          	bcp	a,#64
3020  04cd 2700          	jreq	L1631
3021                     ; 924       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
3023                     ; 925       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
3026  04cf               L1631:
3027                     ; 929       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
3029                     ; 931     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
3031                     ; 932     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
3034  04cf 2007          	jra	L5631
3035  04d1               L7531:
3036                     ; 937     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
3038  04d1 c65148        	ld	a,20808
3039  04d4 a540          	bcp	a,#64
3040  04d6 2700          	jreq	L7631
3041                     ; 939       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
3043                     ; 940       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
3046  04d8               L7631:
3047                     ; 944       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
3049                     ; 947     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
3051                     ; 949     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
3053  04d8               L5631:
3054                     ; 954   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
3056  04d8 1e09          	ldw	x,(OFST+4,sp)
3057  04da e604          	ld	a,(4,x)
3058  04dc a510          	bcp	a,#16
3059  04de 2608          	jrne	L3731
3060                     ; 956     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
3062  04e0 1e09          	ldw	x,(OFST+4,sp)
3063  04e2 e605          	ld	a,(5,x)
3064  04e4 a140          	cp	a,#64
3065  04e6 2600          	jrne	L5731
3066                     ; 958       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
3069  04e8               L5731:
3070                     ; 962       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
3072                     ; 963       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
3074  04e8               L3731:
3075                     ; 969   RTC_WriteProtectionCmd(DISABLE);
3077  04e8 4f            	clr	a
3078  04e9 cd0226        	call	_RTC_WriteProtectionCmd
3080                     ; 972   RTC->CR2 &= (uint8_t)~RTC_CR2_ALRAE;
3082  04ec 72115149      	bres	20809,#0
3083                     ; 975   if (RTC_Format != RTC_Format_BIN)
3085  04f0 0d06          	tnz	(OFST+1,sp)
3086  04f2 2747          	jreq	L1041
3087                     ; 977     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
3087                     ; 978                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
3089  04f4 1e09          	ldw	x,(OFST+4,sp)
3090  04f6 e604          	ld	a,(4,x)
3091  04f8 a480          	and	a,#128
3092  04fa 1e09          	ldw	x,(OFST+4,sp)
3093  04fc ea02          	or	a,(2,x)
3094  04fe 6b02          	ld	(OFST-3,sp),a
3096                     ; 980     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
3096                     ; 981                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
3098  0500 1e09          	ldw	x,(OFST+4,sp)
3099  0502 e604          	ld	a,(4,x)
3100  0504 48            	sll	a
3101  0505 a480          	and	a,#128
3102  0507 1e09          	ldw	x,(OFST+4,sp)
3103  0509 ea01          	or	a,(1,x)
3104  050b 6b03          	ld	(OFST-2,sp),a
3106                     ; 983     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
3106                     ; 984                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
3106                     ; 985                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
3108  050d 1e09          	ldw	x,(OFST+4,sp)
3109  050f e604          	ld	a,(4,x)
3110  0511 48            	sll	a
3111  0512 48            	sll	a
3112  0513 a480          	and	a,#128
3113  0515 6b01          	ld	(OFST-4,sp),a
3115  0517 1e09          	ldw	x,(OFST+4,sp)
3116  0519 e603          	ld	a,(3,x)
3117  051b 1e09          	ldw	x,(OFST+4,sp)
3118  051d fa            	or	a,(x)
3119  051e 1a01          	or	a,(OFST-4,sp)
3120  0520 6b04          	ld	(OFST-1,sp),a
3122                     ; 987     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
3122                     ; 988                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
3122                     ; 989                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
3124  0522 1e09          	ldw	x,(OFST+4,sp)
3125  0524 e604          	ld	a,(4,x)
3126  0526 48            	sll	a
3127  0527 48            	sll	a
3128  0528 48            	sll	a
3129  0529 a480          	and	a,#128
3130  052b 6b01          	ld	(OFST-4,sp),a
3132  052d 1e09          	ldw	x,(OFST+4,sp)
3133  052f e605          	ld	a,(5,x)
3134  0531 1e09          	ldw	x,(OFST+4,sp)
3135  0533 ea06          	or	a,(6,x)
3136  0535 1a01          	or	a,(OFST-4,sp)
3137  0537 6b05          	ld	(OFST+0,sp),a
3140  0539 2059          	jra	L3041
3141  053b               L1041:
3142                     ; 994     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
3142                     ; 995                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
3144  053b 1e09          	ldw	x,(OFST+4,sp)
3145  053d e604          	ld	a,(4,x)
3146  053f a480          	and	a,#128
3147  0541 6b01          	ld	(OFST-4,sp),a
3149  0543 1e09          	ldw	x,(OFST+4,sp)
3150  0545 e602          	ld	a,(2,x)
3151  0547 cd096a        	call	L3_ByteToBcd2
3153  054a 1a01          	or	a,(OFST-4,sp)
3154  054c 6b02          	ld	(OFST-3,sp),a
3156                     ; 997     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
3156                     ; 998                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
3158  054e 1e09          	ldw	x,(OFST+4,sp)
3159  0550 e604          	ld	a,(4,x)
3160  0552 48            	sll	a
3161  0553 a480          	and	a,#128
3162  0555 6b01          	ld	(OFST-4,sp),a
3164  0557 1e09          	ldw	x,(OFST+4,sp)
3165  0559 e601          	ld	a,(1,x)
3166  055b cd096a        	call	L3_ByteToBcd2
3168  055e 1a01          	or	a,(OFST-4,sp)
3169  0560 6b03          	ld	(OFST-2,sp),a
3171                     ; 1000     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
3171                     ; 1001                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
3171                     ; 1002                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
3173  0562 1e09          	ldw	x,(OFST+4,sp)
3174  0564 e604          	ld	a,(4,x)
3175  0566 48            	sll	a
3176  0567 48            	sll	a
3177  0568 a480          	and	a,#128
3178  056a 6b01          	ld	(OFST-4,sp),a
3180  056c 1e09          	ldw	x,(OFST+4,sp)
3181  056e f6            	ld	a,(x)
3182  056f cd096a        	call	L3_ByteToBcd2
3184  0572 1e09          	ldw	x,(OFST+4,sp)
3185  0574 ea03          	or	a,(3,x)
3186  0576 1a01          	or	a,(OFST-4,sp)
3187  0578 6b04          	ld	(OFST-1,sp),a
3189                     ; 1004     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
3189                     ; 1005                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
3189                     ; 1006                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
3191  057a 1e09          	ldw	x,(OFST+4,sp)
3192  057c e604          	ld	a,(4,x)
3193  057e 48            	sll	a
3194  057f 48            	sll	a
3195  0580 48            	sll	a
3196  0581 a480          	and	a,#128
3197  0583 6b01          	ld	(OFST-4,sp),a
3199  0585 1e09          	ldw	x,(OFST+4,sp)
3200  0587 e606          	ld	a,(6,x)
3201  0589 cd096a        	call	L3_ByteToBcd2
3203  058c 1e09          	ldw	x,(OFST+4,sp)
3204  058e ea05          	or	a,(5,x)
3205  0590 1a01          	or	a,(OFST-4,sp)
3206  0592 6b05          	ld	(OFST+0,sp),a
3208  0594               L3041:
3209                     ; 1010   RTC->ALRMAR1 = tmpreg1;
3211  0594 7b02          	ld	a,(OFST-3,sp)
3212  0596 c7515c        	ld	20828,a
3213                     ; 1011   RTC->ALRMAR2 = tmpreg2;
3215  0599 7b03          	ld	a,(OFST-2,sp)
3216  059b c7515d        	ld	20829,a
3217                     ; 1012   RTC->ALRMAR3 = tmpreg3;
3219  059e 7b04          	ld	a,(OFST-1,sp)
3220  05a0 c7515e        	ld	20830,a
3221                     ; 1013   RTC->ALRMAR4 = tmpreg4;
3223  05a3 7b05          	ld	a,(OFST+0,sp)
3224  05a5 c7515f        	ld	20831,a
3225                     ; 1016   RTC_WriteProtectionCmd(ENABLE);
3227  05a8 a601          	ld	a,#1
3228  05aa cd0226        	call	_RTC_WriteProtectionCmd
3230                     ; 1018 }
3233  05ad 5b06          	addw	sp,#6
3234  05af 81            	ret
3327                     ; 1028 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
3327                     ; 1029                   RTC_AlarmTypeDef* RTC_AlarmStruct)
3327                     ; 1030 {
3328                     	switch	.text
3329  05b0               _RTC_GetAlarm:
3331  05b0 88            	push	a
3332  05b1 5204          	subw	sp,#4
3333       00000004      OFST:	set	4
3336                     ; 1031   uint8_t tmpreg1 = 0;
3338                     ; 1032   uint8_t tmpreg2 = 0;
3340                     ; 1033   uint8_t tmpreg3 = 0;
3342                     ; 1034   uint8_t tmpreg4 = 0;
3344                     ; 1035   uint8_t alarmmask = 0;
3346                     ; 1038   assert_param(IS_RTC_FORMAT(RTC_Format));
3348                     ; 1041   tmpreg1 = (uint8_t)RTC->ALRMAR1;
3350  05b3 c6515c        	ld	a,20828
3351  05b6 6b04          	ld	(OFST+0,sp),a
3353                     ; 1042   tmpreg2 = (uint8_t)RTC->ALRMAR2;
3355  05b8 c6515d        	ld	a,20829
3356  05bb 6b01          	ld	(OFST-3,sp),a
3358                     ; 1043   tmpreg3 = (uint8_t)RTC->ALRMAR3;
3360  05bd c6515e        	ld	a,20830
3361  05c0 6b02          	ld	(OFST-2,sp),a
3363                     ; 1044   tmpreg4 = (uint8_t)RTC->ALRMAR4;
3365  05c2 c6515f        	ld	a,20831
3366  05c5 6b03          	ld	(OFST-1,sp),a
3368                     ; 1047   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
3370  05c7 7b04          	ld	a,(OFST+0,sp)
3371  05c9 a47f          	and	a,#127
3372  05cb 1e08          	ldw	x,(OFST+4,sp)
3373  05cd e702          	ld	(2,x),a
3374                     ; 1048   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
3376  05cf 7b04          	ld	a,(OFST+0,sp)
3377  05d1 a480          	and	a,#128
3378  05d3 6b04          	ld	(OFST+0,sp),a
3380                     ; 1051   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
3382  05d5 7b01          	ld	a,(OFST-3,sp)
3383  05d7 a47f          	and	a,#127
3384  05d9 1e08          	ldw	x,(OFST+4,sp)
3385  05db e701          	ld	(1,x),a
3386                     ; 1052   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
3388  05dd 7b01          	ld	a,(OFST-3,sp)
3389  05df a480          	and	a,#128
3390  05e1 44            	srl	a
3391  05e2 1a04          	or	a,(OFST+0,sp)
3392  05e4 6b04          	ld	(OFST+0,sp),a
3394                     ; 1055   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
3396  05e6 7b02          	ld	a,(OFST-2,sp)
3397  05e8 a43f          	and	a,#63
3398  05ea 1e08          	ldw	x,(OFST+4,sp)
3399  05ec f7            	ld	(x),a
3400                     ; 1056   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
3402  05ed 7b02          	ld	a,(OFST-2,sp)
3403  05ef a440          	and	a,#64
3404  05f1 1e08          	ldw	x,(OFST+4,sp)
3405  05f3 e703          	ld	(3,x),a
3406                     ; 1057   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
3408  05f5 7b02          	ld	a,(OFST-2,sp)
3409  05f7 a480          	and	a,#128
3410  05f9 44            	srl	a
3411  05fa 44            	srl	a
3412  05fb 1a04          	or	a,(OFST+0,sp)
3413  05fd 6b04          	ld	(OFST+0,sp),a
3415                     ; 1060   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
3417  05ff 7b03          	ld	a,(OFST-1,sp)
3418  0601 a43f          	and	a,#63
3419  0603 1e08          	ldw	x,(OFST+4,sp)
3420  0605 e706          	ld	(6,x),a
3421                     ; 1061   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
3423  0607 7b03          	ld	a,(OFST-1,sp)
3424  0609 a440          	and	a,#64
3425  060b 1e08          	ldw	x,(OFST+4,sp)
3426  060d e705          	ld	(5,x),a
3427                     ; 1062   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
3429  060f 7b03          	ld	a,(OFST-1,sp)
3430  0611 a480          	and	a,#128
3431  0613 44            	srl	a
3432  0614 44            	srl	a
3433  0615 44            	srl	a
3434  0616 1a04          	or	a,(OFST+0,sp)
3435  0618 6b04          	ld	(OFST+0,sp),a
3437                     ; 1064   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
3439  061a 7b04          	ld	a,(OFST+0,sp)
3440  061c 1e08          	ldw	x,(OFST+4,sp)
3441  061e e704          	ld	(4,x),a
3442                     ; 1066   if (RTC_Format == RTC_Format_BIN)
3444  0620 0d05          	tnz	(OFST+1,sp)
3445  0622 262a          	jrne	L5541
3446                     ; 1068     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
3448  0624 1e08          	ldw	x,(OFST+4,sp)
3449  0626 f6            	ld	a,(x)
3450  0627 cd0989        	call	L5_Bcd2ToByte
3452  062a 1e08          	ldw	x,(OFST+4,sp)
3453  062c f7            	ld	(x),a
3454                     ; 1069     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
3456  062d 1e08          	ldw	x,(OFST+4,sp)
3457  062f e601          	ld	a,(1,x)
3458  0631 cd0989        	call	L5_Bcd2ToByte
3460  0634 1e08          	ldw	x,(OFST+4,sp)
3461  0636 e701          	ld	(1,x),a
3462                     ; 1070     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
3464  0638 1e08          	ldw	x,(OFST+4,sp)
3465  063a e602          	ld	a,(2,x)
3466  063c cd0989        	call	L5_Bcd2ToByte
3468  063f 1e08          	ldw	x,(OFST+4,sp)
3469  0641 e702          	ld	(2,x),a
3470                     ; 1071     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
3472  0643 1e08          	ldw	x,(OFST+4,sp)
3473  0645 e606          	ld	a,(6,x)
3474  0647 cd0989        	call	L5_Bcd2ToByte
3476  064a 1e08          	ldw	x,(OFST+4,sp)
3477  064c e706          	ld	(6,x),a
3478  064e               L5541:
3479                     ; 1073 }
3482  064e 5b05          	addw	sp,#5
3483  0650 81            	ret
3548                     ; 1082 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
3548                     ; 1083 {
3549                     	switch	.text
3550  0651               _RTC_AlarmCmd:
3552  0651 88            	push	a
3553  0652 5203          	subw	sp,#3
3554       00000003      OFST:	set	3
3557                     ; 1084   __IO uint16_t alrawfcount = 0;
3559  0654 5f            	clrw	x
3560  0655 1f01          	ldw	(OFST-2,sp),x
3562                     ; 1085   ErrorStatus status = ERROR;
3564                     ; 1086   uint8_t temp1 = 0;
3566                     ; 1089   assert_param(IS_FUNCTIONAL_STATE(NewState));
3568                     ; 1092   RTC_WriteProtectionCmd(DISABLE);
3570  0657 4f            	clr	a
3571  0658 cd0226        	call	_RTC_WriteProtectionCmd
3573                     ; 1095   if (NewState != DISABLE)
3575  065b 0d04          	tnz	(OFST+1,sp)
3576  065d 2712          	jreq	L1151
3577                     ; 1097     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
3579  065f 72105149      	bset	20809,#0
3580                     ; 1098     status = SUCCESS;
3582  0663 a601          	ld	a,#1
3583  0665 6b03          	ld	(OFST+0,sp),a
3586  0667               L3151:
3587                     ; 1122   RTC_WriteProtectionCmd(ENABLE);
3589  0667 a601          	ld	a,#1
3590  0669 cd0226        	call	_RTC_WriteProtectionCmd
3592                     ; 1125   return (ErrorStatus)status;
3594  066c 7b03          	ld	a,(OFST+0,sp)
3597  066e 5b04          	addw	sp,#4
3598  0670 81            	ret
3599  0671               L1151:
3600                     ; 1102     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
3602  0671 72115149      	bres	20809,#0
3603                     ; 1105     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
3605  0675 c6514c        	ld	a,20812
3606  0678 a401          	and	a,#1
3607  067a 6b03          	ld	(OFST+0,sp),a
3610  067c 2007          	jra	L1251
3611  067e               L5151:
3612                     ; 1108       alrawfcount++;
3614  067e 1e01          	ldw	x,(OFST-2,sp)
3615  0680 1c0001        	addw	x,#1
3616  0683 1f01          	ldw	(OFST-2,sp),x
3618  0685               L1251:
3619                     ; 1106     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
3621  0685 1e01          	ldw	x,(OFST-2,sp)
3622  0687 a3ffff        	cpw	x,#65535
3623  068a 2704          	jreq	L5251
3625  068c 0d03          	tnz	(OFST+0,sp)
3626  068e 27ee          	jreq	L5151
3627  0690               L5251:
3628                     ; 1111     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
3630  0690 c6514c        	ld	a,20812
3631  0693 a501          	bcp	a,#1
3632  0695 2604          	jrne	L7251
3633                     ; 1113       status = ERROR;
3635  0697 0f03          	clr	(OFST+0,sp)
3638  0699 20cc          	jra	L3151
3639  069b               L7251:
3640                     ; 1117       status = SUCCESS;
3642  069b a601          	ld	a,#1
3643  069d 6b03          	ld	(OFST+0,sp),a
3645  069f 20c6          	jra	L3151
3736                     ; 1136 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3736                     ; 1137 {
3737                     	switch	.text
3738  06a1               _RTC_WakeUpClockConfig:
3740  06a1 88            	push	a
3741       00000000      OFST:	set	0
3744                     ; 1140   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3746                     ; 1143   RTC_WriteProtectionCmd(DISABLE);
3748  06a2 4f            	clr	a
3749  06a3 cd0226        	call	_RTC_WriteProtectionCmd
3751                     ; 1146   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3753  06a6 72155149      	bres	20809,#2
3754                     ; 1149   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3756  06aa c65148        	ld	a,20808
3757  06ad a4f8          	and	a,#248
3758  06af c75148        	ld	20808,a
3759                     ; 1152   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3761  06b2 c65148        	ld	a,20808
3762  06b5 1a01          	or	a,(OFST+1,sp)
3763  06b7 c75148        	ld	20808,a
3764                     ; 1155   RTC_WriteProtectionCmd(ENABLE);
3766  06ba a601          	ld	a,#1
3767  06bc cd0226        	call	_RTC_WriteProtectionCmd
3769                     ; 1156 }
3772  06bf 84            	pop	a
3773  06c0 81            	ret
3809                     ; 1166 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3809                     ; 1167 {
3810                     	switch	.text
3811  06c1               _RTC_SetWakeUpCounter:
3813  06c1 89            	pushw	x
3814       00000000      OFST:	set	0
3817                     ; 1169   RTC_WriteProtectionCmd(DISABLE);
3819  06c2 4f            	clr	a
3820  06c3 cd0226        	call	_RTC_WriteProtectionCmd
3822                     ; 1172   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3824  06c6 72155149      	bres	20809,#2
3825                     ; 1175   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3827  06ca 7b01          	ld	a,(OFST+1,sp)
3828  06cc c75154        	ld	20820,a
3829                     ; 1176   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3831  06cf 7b02          	ld	a,(OFST+2,sp)
3832  06d1 c75155        	ld	20821,a
3833                     ; 1179   RTC_WriteProtectionCmd(ENABLE);
3835  06d4 a601          	ld	a,#1
3836  06d6 cd0226        	call	_RTC_WriteProtectionCmd
3838                     ; 1180 }
3841  06d9 85            	popw	x
3842  06da 81            	ret
3877                     ; 1187 uint16_t RTC_GetWakeUpCounter(void)
3877                     ; 1188 {
3878                     	switch	.text
3879  06db               _RTC_GetWakeUpCounter:
3881  06db 89            	pushw	x
3882       00000002      OFST:	set	2
3885                     ; 1189   uint16_t tmpreg = 0;
3887                     ; 1192   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3889  06dc c65154        	ld	a,20820
3890  06df 5f            	clrw	x
3891  06e0 97            	ld	xl,a
3892  06e1 4f            	clr	a
3893  06e2 02            	rlwa	x,a
3894  06e3 1f01          	ldw	(OFST-1,sp),x
3896                     ; 1193   tmpreg |= RTC->WUTRL;
3898  06e5 c65155        	ld	a,20821
3899  06e8 5f            	clrw	x
3900  06e9 97            	ld	xl,a
3901  06ea 01            	rrwa	x,a
3902  06eb 1a02          	or	a,(OFST+0,sp)
3903  06ed 01            	rrwa	x,a
3904  06ee 1a01          	or	a,(OFST-1,sp)
3905  06f0 01            	rrwa	x,a
3906  06f1 1f01          	ldw	(OFST-1,sp),x
3908                     ; 1196   return (uint16_t)tmpreg;
3910  06f3 1e01          	ldw	x,(OFST-1,sp)
3913  06f5 5b02          	addw	sp,#2
3914  06f7 81            	ret
3970                     ; 1206 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3970                     ; 1207 {
3971                     	switch	.text
3972  06f8               _RTC_WakeUpCmd:
3974  06f8 88            	push	a
3975  06f9 5203          	subw	sp,#3
3976       00000003      OFST:	set	3
3979                     ; 1208   ErrorStatus status = ERROR;
3981                     ; 1209   uint16_t wutwfcount = 0;
3983  06fb 5f            	clrw	x
3984  06fc 1f02          	ldw	(OFST-1,sp),x
3986                     ; 1212   assert_param(IS_FUNCTIONAL_STATE(NewState));
3988                     ; 1215   RTC_WriteProtectionCmd(DISABLE);
3990  06fe 4f            	clr	a
3991  06ff cd0226        	call	_RTC_WriteProtectionCmd
3993                     ; 1217   if (NewState != DISABLE)
3995  0702 0d04          	tnz	(OFST+1,sp)
3996  0704 2712          	jreq	L3561
3997                     ; 1220     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3999  0706 72145149      	bset	20809,#2
4000                     ; 1222     status = SUCCESS;
4002  070a a601          	ld	a,#1
4003  070c 6b01          	ld	(OFST-2,sp),a
4006  070e               L5561:
4007                     ; 1247   RTC_WriteProtectionCmd(ENABLE);
4009  070e a601          	ld	a,#1
4010  0710 cd0226        	call	_RTC_WriteProtectionCmd
4012                     ; 1250   return (ErrorStatus)status;
4014  0713 7b01          	ld	a,(OFST-2,sp)
4017  0715 5b04          	addw	sp,#4
4018  0717 81            	ret
4019  0718               L3561:
4020                     ; 1227     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
4022  0718 72155149      	bres	20809,#2
4024  071c 2007          	jra	L1661
4025  071e               L7561:
4026                     ; 1232       wutwfcount++;
4028  071e 1e02          	ldw	x,(OFST-1,sp)
4029  0720 1c0001        	addw	x,#1
4030  0723 1f02          	ldw	(OFST-1,sp),x
4032  0725               L1661:
4033                     ; 1230     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
4035  0725 c6514c        	ld	a,20812
4036  0728 a504          	bcp	a,#4
4037  072a 2607          	jrne	L5661
4039  072c 1e02          	ldw	x,(OFST-1,sp)
4040  072e a3ffff        	cpw	x,#65535
4041  0731 26eb          	jrne	L7561
4042  0733               L5661:
4043                     ; 1236     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
4045  0733 c6514c        	ld	a,20812
4046  0736 a504          	bcp	a,#4
4047  0738 2604          	jrne	L7661
4048                     ; 1238       status = ERROR;
4050  073a 0f01          	clr	(OFST-2,sp)
4053  073c 20d0          	jra	L5561
4054  073e               L7661:
4055                     ; 1242       status = SUCCESS;
4057  073e a601          	ld	a,#1
4058  0740 6b01          	ld	(OFST-2,sp),a
4060  0742 20ca          	jra	L5561
4155                     ; 1261 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
4155                     ; 1262                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
4155                     ; 1263 {
4156                     	switch	.text
4157  0744               _RTC_OutputConfig:
4159  0744 89            	pushw	x
4160       00000000      OFST:	set	0
4163                     ; 1265   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
4165                     ; 1266   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
4167                     ; 1269   RTC_WriteProtectionCmd(DISABLE);
4169  0745 4f            	clr	a
4170  0746 cd0226        	call	_RTC_WriteProtectionCmd
4172                     ; 1272   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
4174  0749 c6514a        	ld	a,20810
4175  074c a48f          	and	a,#143
4176  074e c7514a        	ld	20810,a
4177                     ; 1275   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
4179  0751 7b01          	ld	a,(OFST+1,sp)
4180  0753 1a02          	or	a,(OFST+2,sp)
4181  0755 ca514a        	or	a,20810
4182  0758 c7514a        	ld	20810,a
4183                     ; 1278   RTC_WriteProtectionCmd(ENABLE);
4185  075b a601          	ld	a,#1
4186  075d cd0226        	call	_RTC_WriteProtectionCmd
4188                     ; 1279 }
4191  0760 85            	popw	x
4192  0761 81            	ret
4283                     ; 1290 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
4283                     ; 1291                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
4283                     ; 1292 {
4284                     	switch	.text
4285  0762               _RTC_DayLightSavingConfig:
4287  0762 89            	pushw	x
4288       00000000      OFST:	set	0
4291                     ; 1294   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
4293                     ; 1295   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
4295                     ; 1298   RTC_WriteProtectionCmd(DISABLE);
4297  0763 4f            	clr	a
4298  0764 cd0226        	call	_RTC_WriteProtectionCmd
4300                     ; 1301   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
4302  0767 7215514a      	bres	20810,#2
4303                     ; 1304   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
4305  076b 7b01          	ld	a,(OFST+1,sp)
4306  076d 1a02          	or	a,(OFST+2,sp)
4307  076f ca514a        	or	a,20810
4308  0772 c7514a        	ld	20810,a
4309                     ; 1307   RTC_WriteProtectionCmd(ENABLE);
4311  0775 a601          	ld	a,#1
4312  0777 cd0226        	call	_RTC_WriteProtectionCmd
4314                     ; 1308 }
4317  077a 85            	popw	x
4318  077b 81            	ret
4343                     ; 1316 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
4343                     ; 1317 {
4344                     	switch	.text
4345  077c               _RTC_GetStoreOperation:
4349                     ; 1319   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
4351  077c c6514a        	ld	a,20810
4352  077f a404          	and	a,#4
4355  0781 81            	ret
4430                     ; 1329 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4430                     ; 1330 {
4431                     	switch	.text
4432  0782               _RTC_TamperFilterConfig:
4434  0782 88            	push	a
4435       00000000      OFST:	set	0
4438                     ; 1333   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4440                     ; 1336   RTC_WriteProtectionCmd(DISABLE);
4442  0783 4f            	clr	a
4443  0784 cd0226        	call	_RTC_WriteProtectionCmd
4445                     ; 1339   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4447  0787 c6516d        	ld	a,20845
4448  078a a4e7          	and	a,#231
4449  078c c7516d        	ld	20845,a
4450                     ; 1342   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4452  078f c6516d        	ld	a,20845
4453  0792 1a01          	or	a,(OFST+1,sp)
4454  0794 c7516d        	ld	20845,a
4455                     ; 1345   RTC_WriteProtectionCmd(ENABLE);
4457  0797 a601          	ld	a,#1
4458  0799 cd0226        	call	_RTC_WriteProtectionCmd
4460                     ; 1347 }
4463  079c 84            	pop	a
4464  079d 81            	ret
4578                     ; 1356 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
4578                     ; 1357 {
4579                     	switch	.text
4580  079e               _RTC_TamperSamplingFreqConfig:
4582  079e 88            	push	a
4583       00000000      OFST:	set	0
4586                     ; 1359   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
4588                     ; 1362   RTC_WriteProtectionCmd(DISABLE);
4590  079f 4f            	clr	a
4591  07a0 cd0226        	call	_RTC_WriteProtectionCmd
4593                     ; 1365   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
4595  07a3 c6516d        	ld	a,20845
4596  07a6 a4f8          	and	a,#248
4597  07a8 c7516d        	ld	20845,a
4598                     ; 1368   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
4600  07ab c6516d        	ld	a,20845
4601  07ae 1a01          	or	a,(OFST+1,sp)
4602  07b0 c7516d        	ld	20845,a
4603                     ; 1371   RTC_WriteProtectionCmd(ENABLE);
4605  07b3 a601          	ld	a,#1
4606  07b5 cd0226        	call	_RTC_WriteProtectionCmd
4608                     ; 1372 }
4611  07b8 84            	pop	a
4612  07b9 81            	ret
4696                     ; 1382 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
4696                     ; 1383 {
4697                     	switch	.text
4698  07ba               _RTC_TamperPinsPrechargeDuration:
4700  07ba 88            	push	a
4701       00000000      OFST:	set	0
4704                     ; 1385   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
4706                     ; 1388   RTC_WriteProtectionCmd(DISABLE);
4708  07bb 4f            	clr	a
4709  07bc cd0226        	call	_RTC_WriteProtectionCmd
4711                     ; 1391   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
4713  07bf c6516d        	ld	a,20845
4714  07c2 a41f          	and	a,#31
4715  07c4 c7516d        	ld	20845,a
4716                     ; 1394   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
4718  07c7 c6516d        	ld	a,20845
4719  07ca 1a01          	or	a,(OFST+1,sp)
4720  07cc c7516d        	ld	20845,a
4721                     ; 1397   RTC_WriteProtectionCmd(ENABLE);
4723  07cf a601          	ld	a,#1
4724  07d1 cd0226        	call	_RTC_WriteProtectionCmd
4726                     ; 1398 }
4729  07d4 84            	pop	a
4730  07d5 81            	ret
4826                     ; 1410 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4826                     ; 1411                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4826                     ; 1412 {
4827                     	switch	.text
4828  07d6               _RTC_TamperLevelConfig:
4830  07d6 89            	pushw	x
4831       00000000      OFST:	set	0
4834                     ; 1414   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4836                     ; 1415   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4838                     ; 1418   RTC_WriteProtectionCmd(DISABLE);
4840  07d7 4f            	clr	a
4841  07d8 cd0226        	call	_RTC_WriteProtectionCmd
4843                     ; 1420   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4845  07db 0d02          	tnz	(OFST+2,sp)
4846  07dd 270b          	jreq	L5022
4847                     ; 1423     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4849  07df 7b01          	ld	a,(OFST+1,sp)
4850  07e1 48            	sll	a
4851  07e2 ca516c        	or	a,20844
4852  07e5 c7516c        	ld	20844,a
4854  07e8 200a          	jra	L7022
4855  07ea               L5022:
4856                     ; 1428     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4858  07ea 7b01          	ld	a,(OFST+1,sp)
4859  07ec 48            	sll	a
4860  07ed 43            	cpl	a
4861  07ee c4516c        	and	a,20844
4862  07f1 c7516c        	ld	20844,a
4863  07f4               L7022:
4864                     ; 1432   RTC_WriteProtectionCmd(ENABLE);
4866  07f4 a601          	ld	a,#1
4867  07f6 cd0226        	call	_RTC_WriteProtectionCmd
4869                     ; 1433 }
4872  07f9 85            	popw	x
4873  07fa 81            	ret
4919                     ; 1444 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
4919                     ; 1445                    FunctionalState NewState)
4919                     ; 1446 {
4920                     	switch	.text
4921  07fb               _RTC_TamperCmd:
4923  07fb 89            	pushw	x
4924       00000000      OFST:	set	0
4927                     ; 1449   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4929                     ; 1450   assert_param(IS_FUNCTIONAL_STATE(NewState));
4931                     ; 1453   RTC_WriteProtectionCmd(DISABLE);
4933  07fc 4f            	clr	a
4934  07fd cd0226        	call	_RTC_WriteProtectionCmd
4936                     ; 1456   if (NewState != DISABLE)
4938  0800 0d02          	tnz	(OFST+2,sp)
4939  0802 270a          	jreq	L3322
4940                     ; 1459     RTC->TCR1 |= (uint8_t)RTC_Tamper;
4942  0804 c6516c        	ld	a,20844
4943  0807 1a01          	or	a,(OFST+1,sp)
4944  0809 c7516c        	ld	20844,a
4946  080c 2009          	jra	L5322
4947  080e               L3322:
4948                     ; 1464     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
4950  080e 7b01          	ld	a,(OFST+1,sp)
4951  0810 43            	cpl	a
4952  0811 c4516c        	and	a,20844
4953  0814 c7516c        	ld	20844,a
4954  0817               L5322:
4955                     ; 1469   RTC_WriteProtectionCmd(ENABLE);
4957  0817 a601          	ld	a,#1
4958  0819 cd0226        	call	_RTC_WriteProtectionCmd
4960                     ; 1470 }
4963  081c 85            	popw	x
4964  081d 81            	ret
5060                     ; 1483 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
5060                     ; 1484                                    uint16_t RTC_ShiftSubFS)
5060                     ; 1485 {
5061                     	switch	.text
5062  081e               _RTC_SynchroShiftConfig:
5064  081e 88            	push	a
5065  081f 5203          	subw	sp,#3
5066       00000003      OFST:	set	3
5069                     ; 1486   uint8_t shiftrhreg = 0;
5071                     ; 1487   ErrorStatus status = ERROR;
5073                     ; 1488   uint16_t shpfcount = 0;
5075  0821 5f            	clrw	x
5076  0822 1f02          	ldw	(OFST-1,sp),x
5078                     ; 1491   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
5080                     ; 1492   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
5082                     ; 1495   RTC_WriteProtectionCmd(DISABLE);
5084  0824 4f            	clr	a
5085  0825 cd0226        	call	_RTC_WriteProtectionCmd
5087                     ; 1498   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
5089  0828 c6514c        	ld	a,20812
5090  082b a508          	bcp	a,#8
5091  082d 2717          	jreq	L5032
5093  082f 2007          	jra	L1132
5094  0831               L7032:
5095                     ; 1503       shpfcount++;
5097  0831 1e02          	ldw	x,(OFST-1,sp)
5098  0833 1c0001        	addw	x,#1
5099  0836 1f02          	ldw	(OFST-1,sp),x
5101  0838               L1132:
5102                     ; 1501     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
5104  0838 c6514c        	ld	a,20812
5105  083b a508          	bcp	a,#8
5106  083d 2707          	jreq	L5032
5108  083f 1e02          	ldw	x,(OFST-1,sp)
5109  0841 a3ffff        	cpw	x,#65535
5110  0844 26eb          	jrne	L7032
5111  0846               L5032:
5112                     ; 1508   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
5114  0846 c6514c        	ld	a,20812
5115  0849 a508          	bcp	a,#8
5116  084b 2616          	jrne	L7132
5117                     ; 1511     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
5119  084d 7b07          	ld	a,(OFST+4,sp)
5120  084f 1a04          	or	a,(OFST+1,sp)
5121  0851 6b01          	ld	(OFST-2,sp),a
5123                     ; 1512     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
5125  0853 7b01          	ld	a,(OFST-2,sp)
5126  0855 c7515a        	ld	20826,a
5127                     ; 1513     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
5129  0858 7b08          	ld	a,(OFST+5,sp)
5130  085a c7515b        	ld	20827,a
5131                     ; 1515     status = SUCCESS;
5133  085d a601          	ld	a,#1
5134  085f 6b01          	ld	(OFST-2,sp),a
5137  0861 2002          	jra	L1232
5138  0863               L7132:
5139                     ; 1519     status = ERROR;
5141  0863 0f01          	clr	(OFST-2,sp)
5143  0865               L1232:
5144                     ; 1523   RTC_WriteProtectionCmd(ENABLE);
5146  0865 a601          	ld	a,#1
5147  0867 cd0226        	call	_RTC_WriteProtectionCmd
5149                     ; 1525   return (ErrorStatus)(status);
5151  086a 7b01          	ld	a,(OFST-2,sp)
5154  086c 5b04          	addw	sp,#4
5155  086e 81            	ret
5286                     ; 1542 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
5286                     ; 1543                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
5286                     ; 1544                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
5286                     ; 1545 {
5287                     	switch	.text
5288  086f               _RTC_SmoothCalibConfig:
5290  086f 89            	pushw	x
5291  0870 5203          	subw	sp,#3
5292       00000003      OFST:	set	3
5295                     ; 1546   ErrorStatus status = ERROR;
5297                     ; 1547   uint16_t recalpfcount = 0;
5299  0872 5f            	clrw	x
5300  0873 1f02          	ldw	(OFST-1,sp),x
5302                     ; 1550   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
5304                     ; 1551   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
5306                     ; 1552   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
5308                     ; 1555   RTC_WriteProtectionCmd(DISABLE);
5310  0875 4f            	clr	a
5311  0876 cd0226        	call	_RTC_WriteProtectionCmd
5313                     ; 1558   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
5315  0879 c6514c        	ld	a,20812
5316  087c a502          	bcp	a,#2
5317  087e 2717          	jreq	L3042
5319  0880 2007          	jra	L7042
5320  0882               L5042:
5321                     ; 1563       recalpfcount++;
5323  0882 1e02          	ldw	x,(OFST-1,sp)
5324  0884 1c0001        	addw	x,#1
5325  0887 1f02          	ldw	(OFST-1,sp),x
5327  0889               L7042:
5328                     ; 1561     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
5330  0889 c6514c        	ld	a,20812
5331  088c a502          	bcp	a,#2
5332  088e 2707          	jreq	L3042
5334  0890 1e02          	ldw	x,(OFST-1,sp)
5335  0892 a3ffff        	cpw	x,#65535
5336  0895 26eb          	jrne	L5042
5337  0897               L3042:
5338                     ; 1568   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
5340  0897 c6514c        	ld	a,20812
5341  089a a502          	bcp	a,#2
5342  089c 2614          	jrne	L5142
5343                     ; 1571     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | (uint8_t)RTC_SmoothCalibPlusPulses) | (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
5345  089e 7b04          	ld	a,(OFST+1,sp)
5346  08a0 1a05          	or	a,(OFST+2,sp)
5347  08a2 1a08          	or	a,(OFST+5,sp)
5348  08a4 c7516a        	ld	20842,a
5349                     ; 1572     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
5351  08a7 7b09          	ld	a,(OFST+6,sp)
5352  08a9 c7516b        	ld	20843,a
5353                     ; 1574     status = SUCCESS;
5355  08ac a601          	ld	a,#1
5356  08ae 6b01          	ld	(OFST-2,sp),a
5359  08b0 2002          	jra	L7142
5360  08b2               L5142:
5361                     ; 1578     status = ERROR;
5363  08b2 0f01          	clr	(OFST-2,sp)
5365  08b4               L7142:
5366                     ; 1582   RTC_WriteProtectionCmd(ENABLE);
5368  08b4 a601          	ld	a,#1
5369  08b6 cd0226        	call	_RTC_WriteProtectionCmd
5371                     ; 1584   return (ErrorStatus)(status);
5373  08b9 7b01          	ld	a,(OFST-2,sp)
5376  08bb 5b05          	addw	sp,#5
5377  08bd 81            	ret
5436                     ; 1594 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
5436                     ; 1595 {
5437                     	switch	.text
5438  08be               _RTC_CalibOutputConfig:
5440  08be 88            	push	a
5441       00000000      OFST:	set	0
5444                     ; 1597   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
5446                     ; 1600   RTC_WriteProtectionCmd(DISABLE);
5448  08bf 4f            	clr	a
5449  08c0 cd0226        	call	_RTC_WriteProtectionCmd
5451                     ; 1602   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
5453  08c3 0d01          	tnz	(OFST+1,sp)
5454  08c5 2706          	jreq	L7442
5455                     ; 1605     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
5457  08c7 7216514a      	bset	20810,#3
5459  08cb 2004          	jra	L1542
5460  08cd               L7442:
5461                     ; 1610     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
5463  08cd 7217514a      	bres	20810,#3
5464  08d1               L1542:
5465                     ; 1614   RTC_WriteProtectionCmd(ENABLE);
5467  08d1 a601          	ld	a,#1
5468  08d3 cd0226        	call	_RTC_WriteProtectionCmd
5470                     ; 1615 }
5473  08d6 84            	pop	a
5474  08d7 81            	ret
5510                     ; 1623 void RTC_CalibOutputCmd(FunctionalState NewState)
5510                     ; 1624 {
5511                     	switch	.text
5512  08d8               _RTC_CalibOutputCmd:
5514  08d8 88            	push	a
5515       00000000      OFST:	set	0
5518                     ; 1626   assert_param(IS_FUNCTIONAL_STATE(NewState));
5520                     ; 1629   RTC_WriteProtectionCmd(DISABLE);
5522  08d9 4f            	clr	a
5523  08da cd0226        	call	_RTC_WriteProtectionCmd
5525                     ; 1631   if (NewState != DISABLE)
5527  08dd 0d01          	tnz	(OFST+1,sp)
5528  08df 2706          	jreq	L1742
5529                     ; 1634     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
5531  08e1 721e514a      	bset	20810,#7
5533  08e5 2004          	jra	L3742
5534  08e7               L1742:
5535                     ; 1639     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
5537  08e7 721f514a      	bres	20810,#7
5538  08eb               L3742:
5539                     ; 1643   RTC_WriteProtectionCmd(ENABLE);
5541  08eb a601          	ld	a,#1
5542  08ed cd0226        	call	_RTC_WriteProtectionCmd
5544                     ; 1644 }
5547  08f0 84            	pop	a
5548  08f1 81            	ret
5722                     ; 1652 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5722                     ; 1653 {
5723                     	switch	.text
5724  08f2               _RTC_GetFlagStatus:
5726  08f2 89            	pushw	x
5727  08f3 5203          	subw	sp,#3
5728       00000003      OFST:	set	3
5731                     ; 1654   FlagStatus flagstatus = RESET;
5733                     ; 1655   uint16_t tmpreg1 = 0;
5735                     ; 1656   uint16_t tmpreg2 = 0;
5737                     ; 1659   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5739                     ; 1662   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5741  08f5 c6514c        	ld	a,20812
5742  08f8 5f            	clrw	x
5743  08f9 97            	ld	xl,a
5744  08fa 4f            	clr	a
5745  08fb 02            	rlwa	x,a
5746  08fc 1f02          	ldw	(OFST-1,sp),x
5748                     ; 1663   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5750  08fe c6514d        	ld	a,20813
5751  0901 5f            	clrw	x
5752  0902 97            	ld	xl,a
5753  0903 01            	rrwa	x,a
5754  0904 1a03          	or	a,(OFST+0,sp)
5755  0906 01            	rrwa	x,a
5756  0907 1a02          	or	a,(OFST-1,sp)
5757  0909 01            	rrwa	x,a
5758  090a 1f02          	ldw	(OFST-1,sp),x
5760                     ; 1666   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5762  090c 1e02          	ldw	x,(OFST-1,sp)
5763  090e 01            	rrwa	x,a
5764  090f 1405          	and	a,(OFST+2,sp)
5765  0911 01            	rrwa	x,a
5766  0912 1404          	and	a,(OFST+1,sp)
5767  0914 01            	rrwa	x,a
5768  0915 a30000        	cpw	x,#0
5769  0918 2706          	jreq	L3752
5770                     ; 1668     flagstatus = SET;
5772  091a a601          	ld	a,#1
5773  091c 6b01          	ld	(OFST-2,sp),a
5776  091e 2002          	jra	L5752
5777  0920               L3752:
5778                     ; 1672     flagstatus = RESET;
5780  0920 0f01          	clr	(OFST-2,sp)
5782  0922               L5752:
5783                     ; 1674   return (FlagStatus)flagstatus;
5785  0922 7b01          	ld	a,(OFST-2,sp)
5788  0924 5b05          	addw	sp,#5
5789  0926 81            	ret
5824                     ; 1684 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5824                     ; 1685 {
5825                     	switch	.text
5826  0927               _RTC_ClearFlag:
5828  0927 89            	pushw	x
5829       00000000      OFST:	set	0
5832                     ; 1687   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5834                     ; 1690   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5836  0928 9f            	ld	a,xl
5837  0929 43            	cpl	a
5838  092a c7514d        	ld	20813,a
5839                     ; 1691   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5841  092d 7b01          	ld	a,(OFST+1,sp)
5842  092f 43            	cpl	a
5843  0930 a47f          	and	a,#127
5844  0932 c7514c        	ld	20812,a
5845                     ; 1692 }
5848  0935 85            	popw	x
5849  0936 81            	ret
5913                     ; 1700 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5913                     ; 1701 {
5914                     	switch	.text
5915  0937               _RTC_GetITStatus:
5917  0937 89            	pushw	x
5918  0938 89            	pushw	x
5919       00000002      OFST:	set	2
5922                     ; 1702   ITStatus itstatus = RESET;
5924                     ; 1703   uint8_t enablestatus = 0, tmpreg = 0;
5928                     ; 1706   assert_param(IS_RTC_GET_IT(RTC_IT));
5930                     ; 1709   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5932  0939 9f            	ld	a,xl
5933  093a c45149        	and	a,20809
5934  093d 6b01          	ld	(OFST-1,sp),a
5936                     ; 1712   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5938  093f 1e03          	ldw	x,(OFST+1,sp)
5939  0941 54            	srlw	x
5940  0942 54            	srlw	x
5941  0943 54            	srlw	x
5942  0944 54            	srlw	x
5943  0945 9f            	ld	a,xl
5944  0946 c4514d        	and	a,20813
5945  0949 6b02          	ld	(OFST+0,sp),a
5947                     ; 1715   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5949  094b 0d01          	tnz	(OFST-1,sp)
5950  094d 270a          	jreq	L7462
5952  094f 0d02          	tnz	(OFST+0,sp)
5953  0951 2706          	jreq	L7462
5954                     ; 1717     itstatus = SET;
5956  0953 a601          	ld	a,#1
5957  0955 6b02          	ld	(OFST+0,sp),a
5960  0957 2002          	jra	L1562
5961  0959               L7462:
5962                     ; 1721     itstatus = RESET;
5964  0959 0f02          	clr	(OFST+0,sp)
5966  095b               L1562:
5967                     ; 1724   return (ITStatus)itstatus;
5969  095b 7b02          	ld	a,(OFST+0,sp)
5972  095d 5b04          	addw	sp,#4
5973  095f 81            	ret
6009                     ; 1734 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
6009                     ; 1735 {
6010                     	switch	.text
6011  0960               _RTC_ClearITPendingBit:
6015                     ; 1737   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
6017                     ; 1740   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
6019  0960 54            	srlw	x
6020  0961 54            	srlw	x
6021  0962 54            	srlw	x
6022  0963 54            	srlw	x
6023  0964 9f            	ld	a,xl
6024  0965 43            	cpl	a
6025  0966 c7514d        	ld	20813,a
6026                     ; 1741 }
6029  0969 81            	ret
6072                     ; 1752 static uint8_t ByteToBcd2(uint8_t Value)
6072                     ; 1753 {
6073                     	switch	.text
6074  096a               L3_ByteToBcd2:
6076  096a 88            	push	a
6077  096b 88            	push	a
6078       00000001      OFST:	set	1
6081                     ; 1754   uint8_t bcdhigh = 0;
6083  096c 0f01          	clr	(OFST+0,sp)
6086  096e 2008          	jra	L7172
6087  0970               L3172:
6088                     ; 1758     bcdhigh++;
6090  0970 0c01          	inc	(OFST+0,sp)
6092                     ; 1759     Value -= 10;
6094  0972 7b02          	ld	a,(OFST+1,sp)
6095  0974 a00a          	sub	a,#10
6096  0976 6b02          	ld	(OFST+1,sp),a
6097  0978               L7172:
6098                     ; 1756   while (Value >= 10)
6100  0978 7b02          	ld	a,(OFST+1,sp)
6101  097a a10a          	cp	a,#10
6102  097c 24f2          	jruge	L3172
6103                     ; 1762   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
6105  097e 7b01          	ld	a,(OFST+0,sp)
6106  0980 97            	ld	xl,a
6107  0981 a610          	ld	a,#16
6108  0983 42            	mul	x,a
6109  0984 9f            	ld	a,xl
6110  0985 1a02          	or	a,(OFST+1,sp)
6113  0987 85            	popw	x
6114  0988 81            	ret
6157                     ; 1770 static uint8_t Bcd2ToByte(uint8_t Value)
6157                     ; 1771 {
6158                     	switch	.text
6159  0989               L5_Bcd2ToByte:
6161  0989 88            	push	a
6162  098a 88            	push	a
6163       00000001      OFST:	set	1
6166                     ; 1772   uint8_t tmp = 0;
6168                     ; 1774   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
6170  098b a4f0          	and	a,#240
6171  098d 4e            	swap	a
6172  098e a40f          	and	a,#15
6173  0990 97            	ld	xl,a
6174  0991 a60a          	ld	a,#10
6175  0993 42            	mul	x,a
6176  0994 9f            	ld	a,xl
6177  0995 6b01          	ld	(OFST+0,sp),a
6179                     ; 1776   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
6181  0997 7b02          	ld	a,(OFST+1,sp)
6182  0999 a40f          	and	a,#15
6183  099b 1b01          	add	a,(OFST+0,sp)
6186  099d 85            	popw	x
6187  099e 81            	ret
6200                     	xdef	_RTC_SmoothCalibConfig
6201                     	xdef	_RTC_SynchroShiftConfig
6202                     	xdef	_RTC_ClearITPendingBit
6203                     	xdef	_RTC_GetITStatus
6204                     	xdef	_RTC_ClearFlag
6205                     	xdef	_RTC_GetFlagStatus
6206                     	xdef	_RTC_TamperCmd
6207                     	xdef	_RTC_TamperLevelConfig
6208                     	xdef	_RTC_TamperPinsPrechargeDuration
6209                     	xdef	_RTC_TamperSamplingFreqConfig
6210                     	xdef	_RTC_TamperFilterConfig
6211                     	xdef	_RTC_CalibOutputCmd
6212                     	xdef	_RTC_CalibOutputConfig
6213                     	xdef	_RTC_OutputConfig
6214                     	xdef	_RTC_GetStoreOperation
6215                     	xdef	_RTC_DayLightSavingConfig
6216                     	xdef	_RTC_WakeUpCmd
6217                     	xdef	_RTC_GetWakeUpCounter
6218                     	xdef	_RTC_SetWakeUpCounter
6219                     	xdef	_RTC_WakeUpClockConfig
6220                     	xdef	_RTC_AlarmSubSecondConfig
6221                     	xdef	_RTC_AlarmCmd
6222                     	xdef	_RTC_GetAlarm
6223                     	xdef	_RTC_SetAlarm
6224                     	xdef	_RTC_AlarmStructInit
6225                     	xdef	_RTC_GetSubSecond
6226                     	xdef	_RTC_GetDate
6227                     	xdef	_RTC_GetTime
6228                     	xdef	_RTC_SetDate
6229                     	xdef	_RTC_SetTime
6230                     	xdef	_RTC_DateStructInit
6231                     	xdef	_RTC_TimeStructInit
6232                     	xdef	_RTC_BypassShadowCmd
6233                     	xdef	_RTC_RatioCmd
6234                     	xdef	_RTC_WriteProtectionCmd
6235                     	xdef	_RTC_WaitForSynchro
6236                     	xdef	_RTC_ExitInitMode
6237                     	xdef	_RTC_EnterInitMode
6238                     	xdef	_RTC_ITConfig
6239                     	xdef	_RTC_StructInit
6240                     	xdef	_RTC_Init
6241                     	xdef	_RTC_DeInit
6260                     	end
