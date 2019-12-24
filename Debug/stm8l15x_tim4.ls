   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  43                     ; 44 void TIM4_DeInit(void)
  43                     ; 45 {
  45                     	switch	.text
  46  0000               _TIM4_DeInit:
  50                     ; 46   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  52  0000 725f52e0      	clr	21216
  53                     ; 47   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  55  0004 725f52e1      	clr	21217
  56                     ; 48   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  58  0008 725f52e2      	clr	21218
  59                     ; 49   TIM4->IER   = TIM4_IER_RESET_VALUE;
  61  000c 725f52e4      	clr	21220
  62                     ; 50   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  64  0010 725f52e7      	clr	21223
  65                     ; 51   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  67  0014 725f52e8      	clr	21224
  68                     ; 52   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  70  0018 35ff52e9      	mov	21225,#255
  71                     ; 53   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  73  001c 725f52e5      	clr	21221
  74                     ; 54 }
  77  0020 81            	ret
 245                     ; 62 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 245                     ; 63                        uint8_t TIM4_Period)
 245                     ; 64 {
 246                     	switch	.text
 247  0021               _TIM4_TimeBaseInit:
 251                     ; 66   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 253                     ; 68   TIM4->ARR = (uint8_t)(TIM4_Period);
 255  0021 9f            	ld	a,xl
 256  0022 c752e9        	ld	21225,a
 257                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 259  0025 9e            	ld	a,xh
 260  0026 c752e8        	ld	21224,a
 261                     ; 73   TIM4->EGR = TIM4_EventSource_Update;
 263  0029 350152e6      	mov	21222,#1
 264                     ; 74 }
 267  002d 81            	ret
 322                     ; 82 void TIM4_Cmd(FunctionalState NewState)
 322                     ; 83 {
 323                     	switch	.text
 324  002e               _TIM4_Cmd:
 328                     ; 85   assert_param(IS_FUNCTIONAL_STATE(NewState));
 330                     ; 88   if (NewState != DISABLE)
 332  002e 4d            	tnz	a
 333  002f 2706          	jreq	L531
 334                     ; 90     TIM4->CR1 |= TIM4_CR1_CEN ;
 336  0031 721052e0      	bset	21216,#0
 338  0035 2004          	jra	L731
 339  0037               L531:
 340                     ; 94     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 342  0037 721152e0      	bres	21216,#0
 343  003b               L731:
 344                     ; 96 }
 347  003b 81            	ret
 383                     ; 104 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 383                     ; 105 {
 384                     	switch	.text
 385  003c               _TIM4_UpdateDisableConfig:
 389                     ; 107   assert_param(IS_FUNCTIONAL_STATE(NewState));
 391                     ; 110   if (NewState != DISABLE)
 393  003c 4d            	tnz	a
 394  003d 2706          	jreq	L751
 395                     ; 112     TIM4->CR1 |= TIM4_CR1_UDIS ;
 397  003f 721252e0      	bset	21216,#1
 399  0043 2004          	jra	L161
 400  0045               L751:
 401                     ; 116     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 403  0045 721352e0      	bres	21216,#1
 404  0049               L161:
 405                     ; 118 }
 408  0049 81            	ret
 466                     ; 126 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 466                     ; 127 {
 467                     	switch	.text
 468  004a               _TIM4_UpdateRequestConfig:
 472                     ; 129   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 474                     ; 132   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 476  004a a101          	cp	a,#1
 477  004c 2606          	jrne	L112
 478                     ; 134     TIM4->CR1 |= TIM4_CR1_URS ;
 480  004e 721452e0      	bset	21216,#2
 482  0052 2004          	jra	L312
 483  0054               L112:
 484                     ; 138     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 486  0054 721552e0      	bres	21216,#2
 487  0058               L312:
 488                     ; 140 }
 491  0058 81            	ret
 548                     ; 148 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 548                     ; 149 {
 549                     	switch	.text
 550  0059               _TIM4_SelectOnePulseMode:
 554                     ; 151   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 556                     ; 154   if (TIM4_OPMode == TIM4_OPMode_Single)
 558  0059 a101          	cp	a,#1
 559  005b 2606          	jrne	L342
 560                     ; 156     TIM4->CR1 |= TIM4_CR1_OPM ;
 562  005d 721652e0      	bset	21216,#3
 564  0061 2004          	jra	L542
 565  0063               L342:
 566                     ; 160     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 568  0063 721752e0      	bres	21216,#3
 569  0067               L542:
 570                     ; 163 }
 573  0067 81            	ret
 641                     ; 173 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 641                     ; 174                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 641                     ; 175 {
 642                     	switch	.text
 643  0068               _TIM4_PrescalerConfig:
 647                     ; 177   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 649                     ; 178   assert_param(IS_TIM4_Prescaler(Prescaler));
 651                     ; 181   TIM4->PSCR = (uint8_t) Prescaler;
 653  0068 9e            	ld	a,xh
 654  0069 c752e8        	ld	21224,a
 655                     ; 184   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 657  006c 9f            	ld	a,xl
 658  006d a101          	cp	a,#1
 659  006f 2606          	jrne	L103
 660                     ; 186     TIM4->EGR |= TIM4_EGR_UG ;
 662  0071 721052e6      	bset	21222,#0
 664  0075 2004          	jra	L303
 665  0077               L103:
 666                     ; 190     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 668  0077 721152e6      	bres	21222,#0
 669  007b               L303:
 670                     ; 192 }
 673  007b 81            	ret
 709                     ; 200 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 709                     ; 201 {
 710                     	switch	.text
 711  007c               _TIM4_ARRPreloadConfig:
 715                     ; 203   assert_param(IS_FUNCTIONAL_STATE(NewState));
 717                     ; 206   if (NewState != DISABLE)
 719  007c 4d            	tnz	a
 720  007d 2706          	jreq	L323
 721                     ; 208     TIM4->CR1 |= TIM4_CR1_ARPE ;
 723  007f 721e52e0      	bset	21216,#7
 725  0083 2004          	jra	L523
 726  0085               L323:
 727                     ; 212     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 729  0085 721f52e0      	bres	21216,#7
 730  0089               L523:
 731                     ; 214 }
 734  0089 81            	ret
 768                     ; 222 void TIM4_SetCounter(uint8_t Counter)
 768                     ; 223 {
 769                     	switch	.text
 770  008a               _TIM4_SetCounter:
 774                     ; 225   TIM4->CNTR = (uint8_t)(Counter);
 776  008a c752e7        	ld	21223,a
 777                     ; 226 }
 780  008d 81            	ret
 814                     ; 234 void TIM4_SetAutoreload(uint8_t Autoreload)
 814                     ; 235 {
 815                     	switch	.text
 816  008e               _TIM4_SetAutoreload:
 820                     ; 238   TIM4->ARR = (uint8_t)(Autoreload);
 822  008e c752e9        	ld	21225,a
 823                     ; 239 }
 826  0091 81            	ret
 860                     ; 246 uint8_t TIM4_GetCounter(void)
 860                     ; 247 {
 861                     	switch	.text
 862  0092               _TIM4_GetCounter:
 864  0092 88            	push	a
 865       00000001      OFST:	set	1
 868                     ; 248   uint8_t tmpcntr = 0;
 870                     ; 249   tmpcntr = TIM4->CNTR;
 872  0093 c652e7        	ld	a,21223
 873  0096 6b01          	ld	(OFST+0,sp),a
 875                     ; 251   return ((uint8_t)tmpcntr);
 877  0098 7b01          	ld	a,(OFST+0,sp)
 880  009a 5b01          	addw	sp,#1
 881  009c 81            	ret
 905                     ; 259 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 905                     ; 260 {
 906                     	switch	.text
 907  009d               _TIM4_GetPrescaler:
 911                     ; 262   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 913  009d c652e8        	ld	a,21224
 916  00a0 81            	ret
 981                     ; 273 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 981                     ; 274 {
 982                     	switch	.text
 983  00a1               _TIM4_ITConfig:
 985  00a1 89            	pushw	x
 986       00000000      OFST:	set	0
 989                     ; 276   assert_param(IS_TIM4_IT(TIM4_IT));
 991                     ; 277   assert_param(IS_FUNCTIONAL_STATE(NewState));
 993                     ; 279   if (NewState != DISABLE)
 995  00a2 9f            	ld	a,xl
 996  00a3 4d            	tnz	a
 997  00a4 2709          	jreq	L344
 998                     ; 282     TIM4->IER |= (uint8_t)TIM4_IT;
1000  00a6 9e            	ld	a,xh
1001  00a7 ca52e4        	or	a,21220
1002  00aa c752e4        	ld	21220,a
1004  00ad 2009          	jra	L544
1005  00af               L344:
1006                     ; 287     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
1008  00af 7b01          	ld	a,(OFST+1,sp)
1009  00b1 43            	cpl	a
1010  00b2 c452e4        	and	a,21220
1011  00b5 c752e4        	ld	21220,a
1012  00b8               L544:
1013                     ; 289 }
1016  00b8 85            	popw	x
1017  00b9 81            	ret
1074                     ; 297 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1074                     ; 298 {
1075                     	switch	.text
1076  00ba               _TIM4_GenerateEvent:
1080                     ; 300   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1082                     ; 303   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1084  00ba ca52e6        	or	a,21222
1085  00bd c752e6        	ld	21222,a
1086                     ; 304 }
1089  00c0 81            	ret
1148                     ; 314 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1148                     ; 315 {
1149                     	switch	.text
1150  00c1               _TIM4_DMACmd:
1152  00c1 89            	pushw	x
1153       00000000      OFST:	set	0
1156                     ; 317   assert_param(IS_FUNCTIONAL_STATE(NewState));
1158                     ; 318   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1160                     ; 320   if (NewState != DISABLE)
1162  00c2 9f            	ld	a,xl
1163  00c3 4d            	tnz	a
1164  00c4 2709          	jreq	L525
1165                     ; 323     TIM4->DER |= (uint8_t)TIM4_DMASource;
1167  00c6 9e            	ld	a,xh
1168  00c7 ca52e3        	or	a,21219
1169  00ca c752e3        	ld	21219,a
1171  00cd 2009          	jra	L725
1172  00cf               L525:
1173                     ; 328     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1175  00cf 7b01          	ld	a,(OFST+1,sp)
1176  00d1 43            	cpl	a
1177  00d2 c452e3        	and	a,21219
1178  00d5 c752e3        	ld	21219,a
1179  00d8               L725:
1180                     ; 330 }
1183  00d8 85            	popw	x
1184  00d9 81            	ret
1259                     ; 338 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1259                     ; 339 {
1260                     	switch	.text
1261  00da               _TIM4_SelectOutputTrigger:
1263  00da 88            	push	a
1264  00db 88            	push	a
1265       00000001      OFST:	set	1
1268                     ; 340   uint8_t tmpcr2 = 0;
1270                     ; 343   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1272                     ; 345   tmpcr2 = TIM4->CR2;
1274  00dc c652e1        	ld	a,21217
1275  00df 6b01          	ld	(OFST+0,sp),a
1277                     ; 348   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1279  00e1 7b01          	ld	a,(OFST+0,sp)
1280  00e3 a48f          	and	a,#143
1281  00e5 6b01          	ld	(OFST+0,sp),a
1283                     ; 351   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1285  00e7 7b01          	ld	a,(OFST+0,sp)
1286  00e9 1a02          	or	a,(OFST+1,sp)
1287  00eb 6b01          	ld	(OFST+0,sp),a
1289                     ; 353   TIM4->CR2 = tmpcr2;
1291  00ed 7b01          	ld	a,(OFST+0,sp)
1292  00ef c752e1        	ld	21217,a
1293                     ; 354 }
1296  00f2 85            	popw	x
1297  00f3 81            	ret
1333                     ; 362 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1333                     ; 363 {
1334                     	switch	.text
1335  00f4               _TIM4_SelectMasterSlaveMode:
1339                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
1341                     ; 368   if (NewState != DISABLE)
1343  00f4 4d            	tnz	a
1344  00f5 2706          	jreq	L306
1345                     ; 370     TIM4->SMCR |= TIM4_SMCR_MSM;
1347  00f7 721e52e2      	bset	21218,#7
1349  00fb 2004          	jra	L506
1350  00fd               L306:
1351                     ; 374     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1353  00fd 721f52e2      	bres	21218,#7
1354  0101               L506:
1355                     ; 376 }
1358  0101 81            	ret
1442                     ; 384 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1442                     ; 385 {
1443                     	switch	.text
1444  0102               _TIM4_SelectInputTrigger:
1446  0102 88            	push	a
1447  0103 88            	push	a
1448       00000001      OFST:	set	1
1451                     ; 386   uint8_t tmpsmcr = 0;
1453                     ; 389   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1455                     ; 391   tmpsmcr = TIM4->SMCR;
1457  0104 c652e2        	ld	a,21218
1458  0107 6b01          	ld	(OFST+0,sp),a
1460                     ; 394   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1462  0109 7b01          	ld	a,(OFST+0,sp)
1463  010b a48f          	and	a,#143
1464  010d 6b01          	ld	(OFST+0,sp),a
1466                     ; 395   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1468  010f 7b01          	ld	a,(OFST+0,sp)
1469  0111 1a02          	or	a,(OFST+1,sp)
1470  0113 6b01          	ld	(OFST+0,sp),a
1472                     ; 397   TIM4->SMCR = (uint8_t)tmpsmcr;
1474  0115 7b01          	ld	a,(OFST+0,sp)
1475  0117 c752e2        	ld	21218,a
1476                     ; 398 }
1479  011a 85            	popw	x
1480  011b 81            	ret
1504                     ; 405 void TIM4_InternalClockConfig(void)
1504                     ; 406 {
1505                     	switch	.text
1506  011c               _TIM4_InternalClockConfig:
1510                     ; 408   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1512  011c c652e2        	ld	a,21218
1513  011f a4f8          	and	a,#248
1514  0121 c752e2        	ld	21218,a
1515                     ; 409 }
1518  0124 81            	ret
1609                     ; 417 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1609                     ; 418 {
1610                     	switch	.text
1611  0125               _TIM4_SelectSlaveMode:
1613  0125 88            	push	a
1614  0126 88            	push	a
1615       00000001      OFST:	set	1
1618                     ; 419   uint8_t tmpsmcr = 0;
1620                     ; 422   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1622                     ; 424   tmpsmcr = TIM4->SMCR;
1624  0127 c652e2        	ld	a,21218
1625  012a 6b01          	ld	(OFST+0,sp),a
1627                     ; 427   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1629  012c 7b01          	ld	a,(OFST+0,sp)
1630  012e a4f8          	and	a,#248
1631  0130 6b01          	ld	(OFST+0,sp),a
1633                     ; 430   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1635  0132 7b01          	ld	a,(OFST+0,sp)
1636  0134 1a02          	or	a,(OFST+1,sp)
1637  0136 6b01          	ld	(OFST+0,sp),a
1639                     ; 432   TIM4->SMCR = tmpsmcr;
1641  0138 7b01          	ld	a,(OFST+0,sp)
1642  013a c752e2        	ld	21218,a
1643                     ; 433 }
1646  013d 85            	popw	x
1647  013e 81            	ret
1733                     ; 442 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1733                     ; 443 {
1734                     	switch	.text
1735  013f               _TIM4_GetFlagStatus:
1737  013f 88            	push	a
1738       00000001      OFST:	set	1
1741                     ; 444   FlagStatus bitstatus = RESET;
1743                     ; 447   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1745                     ; 449   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1747  0140 c452e5        	and	a,21221
1748  0143 2706          	jreq	L757
1749                     ; 451     bitstatus = SET;
1751  0145 a601          	ld	a,#1
1752  0147 6b01          	ld	(OFST+0,sp),a
1755  0149 2002          	jra	L167
1756  014b               L757:
1757                     ; 455     bitstatus = RESET;
1759  014b 0f01          	clr	(OFST+0,sp)
1761  014d               L167:
1762                     ; 457   return ((FlagStatus)bitstatus);
1764  014d 7b01          	ld	a,(OFST+0,sp)
1767  014f 5b01          	addw	sp,#1
1768  0151 81            	ret
1803                     ; 466 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1803                     ; 467 {
1804                     	switch	.text
1805  0152               _TIM4_ClearFlag:
1809                     ; 469   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1811                     ; 471   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1813  0152 43            	cpl	a
1814  0153 c752e5        	ld	21221,a
1815                     ; 472 }
1818  0156 81            	ret
1882                     ; 482 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1882                     ; 483 {
1883                     	switch	.text
1884  0157               _TIM4_GetITStatus:
1886  0157 88            	push	a
1887  0158 89            	pushw	x
1888       00000002      OFST:	set	2
1891                     ; 484   ITStatus bitstatus = RESET;
1893                     ; 486   uint8_t itStatus = 0x0, itEnable = 0x0;
1897                     ; 489   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1899                     ; 491   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1901  0159 c452e5        	and	a,21221
1902  015c 6b01          	ld	(OFST-1,sp),a
1904                     ; 493   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1906  015e c652e4        	ld	a,21220
1907  0161 1403          	and	a,(OFST+1,sp)
1908  0163 6b02          	ld	(OFST+0,sp),a
1910                     ; 495   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1912  0165 0d01          	tnz	(OFST-1,sp)
1913  0167 270a          	jreq	L3301
1915  0169 0d02          	tnz	(OFST+0,sp)
1916  016b 2706          	jreq	L3301
1917                     ; 497     bitstatus = (ITStatus)SET;
1919  016d a601          	ld	a,#1
1920  016f 6b02          	ld	(OFST+0,sp),a
1923  0171 2002          	jra	L5301
1924  0173               L3301:
1925                     ; 501     bitstatus = (ITStatus)RESET;
1927  0173 0f02          	clr	(OFST+0,sp)
1929  0175               L5301:
1930                     ; 503   return ((ITStatus)bitstatus);
1932  0175 7b02          	ld	a,(OFST+0,sp)
1935  0177 5b03          	addw	sp,#3
1936  0179 81            	ret
1972                     ; 512 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1972                     ; 513 {
1973                     	switch	.text
1974  017a               _TIM4_ClearITPendingBit:
1978                     ; 515   assert_param(IS_TIM4_IT(TIM4_IT));
1980                     ; 518   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1982  017a 43            	cpl	a
1983  017b c752e5        	ld	21221,a
1984                     ; 519 }
1987  017e 81            	ret
2000                     	xdef	_TIM4_ClearITPendingBit
2001                     	xdef	_TIM4_GetITStatus
2002                     	xdef	_TIM4_ClearFlag
2003                     	xdef	_TIM4_GetFlagStatus
2004                     	xdef	_TIM4_SelectSlaveMode
2005                     	xdef	_TIM4_InternalClockConfig
2006                     	xdef	_TIM4_SelectInputTrigger
2007                     	xdef	_TIM4_SelectMasterSlaveMode
2008                     	xdef	_TIM4_SelectOutputTrigger
2009                     	xdef	_TIM4_DMACmd
2010                     	xdef	_TIM4_GenerateEvent
2011                     	xdef	_TIM4_ITConfig
2012                     	xdef	_TIM4_GetPrescaler
2013                     	xdef	_TIM4_GetCounter
2014                     	xdef	_TIM4_SetAutoreload
2015                     	xdef	_TIM4_SetCounter
2016                     	xdef	_TIM4_ARRPreloadConfig
2017                     	xdef	_TIM4_PrescalerConfig
2018                     	xdef	_TIM4_SelectOnePulseMode
2019                     	xdef	_TIM4_UpdateRequestConfig
2020                     	xdef	_TIM4_UpdateDisableConfig
2021                     	xdef	_TIM4_Cmd
2022                     	xdef	_TIM4_TimeBaseInit
2023                     	xdef	_TIM4_DeInit
2042                     	end
