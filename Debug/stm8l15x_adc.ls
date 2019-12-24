   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
 174                     ; 45 void ADC_DeInit(ADC_TypeDef* ADCx)
 174                     ; 46 {
 176                     	switch	.text
 177  0000               _ADC_DeInit:
 181                     ; 48   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 183  0000 7f            	clr	(x)
 184                     ; 49   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 186  0001 6f01          	clr	(1,x)
 187                     ; 50   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 189  0003 a61f          	ld	a,#31
 190  0005 e702          	ld	(2,x),a
 191                     ; 53   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 193  0007 a6ff          	ld	a,#255
 194  0009 e703          	ld	(3,x),a
 195                     ; 56   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 197  000b a60f          	ld	a,#15
 198  000d e706          	ld	(6,x),a
 199                     ; 57   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 201  000f a6ff          	ld	a,#255
 202  0011 e707          	ld	(7,x),a
 203                     ; 60   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 205  0013 6f08          	clr	(8,x)
 206                     ; 61   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 208  0015 6f09          	clr	(9,x)
 209                     ; 64   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 211  0017 6f0a          	clr	(10,x)
 212                     ; 65   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 214  0019 6f0b          	clr	(11,x)
 215                     ; 66   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 217  001b 6f0c          	clr	(12,x)
 218                     ; 67   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 220  001d 6f0d          	clr	(13,x)
 221                     ; 70   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 223  001f 6f0e          	clr	(14,x)
 224                     ; 71   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 226  0021 6f0f          	clr	(15,x)
 227                     ; 72   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 229  0023 6f10          	clr	(16,x)
 230                     ; 73   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 232  0025 6f11          	clr	(17,x)
 233                     ; 74 }
 236  0027 81            	ret
 383                     ; 87 void ADC_Init(ADC_TypeDef* ADCx,
 383                     ; 88               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 383                     ; 89               ADC_Resolution_TypeDef ADC_Resolution,
 383                     ; 90               ADC_Prescaler_TypeDef ADC_Prescaler)
 383                     ; 91 {
 384                     	switch	.text
 385  0028               _ADC_Init:
 387  0028 89            	pushw	x
 388       00000000      OFST:	set	0
 391                     ; 93   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 393                     ; 94   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 395                     ; 95   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 397                     ; 98   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 399  0029 f6            	ld	a,(x)
 400  002a a49b          	and	a,#155
 401  002c f7            	ld	(x),a
 402                     ; 101   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 404  002d 7b05          	ld	a,(OFST+5,sp)
 405  002f 1a06          	or	a,(OFST+6,sp)
 406  0031 fa            	or	a,(x)
 407  0032 f7            	ld	(x),a
 408                     ; 104   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC );
 410  0033 e601          	ld	a,(1,x)
 411  0035 a47f          	and	a,#127
 412  0037 e701          	ld	(1,x),a
 413                     ; 107   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 415  0039 e601          	ld	a,(1,x)
 416  003b 1a07          	or	a,(OFST+7,sp)
 417  003d e701          	ld	(1,x),a
 418                     ; 108 }
 421  003f 85            	popw	x
 422  0040 81            	ret
 754                     ; 124 void ADC_ChannelCmd(ADC_TypeDef* ADCx,
 754                     ; 125                     ADC_Channel_TypeDef ADC_Channels,
 754                     ; 126                     FunctionalState NewState)
 754                     ; 127 {
 755                     	switch	.text
 756  0041               _ADC_ChannelCmd:
 758  0041 89            	pushw	x
 759  0042 88            	push	a
 760       00000001      OFST:	set	1
 763                     ; 128   uint8_t regindex = 0;
 765                     ; 130   assert_param(IS_FUNCTIONAL_STATE(NewState));
 767                     ; 132   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
 769  0043 7b06          	ld	a,(OFST+5,sp)
 770  0045 6b01          	ld	(OFST+0,sp),a
 772                     ; 134   if (NewState != DISABLE)
 774  0047 0d08          	tnz	(OFST+7,sp)
 775  0049 270f          	jreq	L163
 776                     ; 137     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
 778  004b 01            	rrwa	x,a
 779  004c 1b01          	add	a,(OFST+0,sp)
 780  004e 2401          	jrnc	L21
 781  0050 5c            	incw	x
 782  0051               L21:
 783  0051 02            	rlwa	x,a
 784  0052 e60a          	ld	a,(10,x)
 785  0054 1a07          	or	a,(OFST+6,sp)
 786  0056 e70a          	ld	(10,x),a
 788  0058 2012          	jra	L363
 789  005a               L163:
 790                     ; 142     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
 792  005a 7b02          	ld	a,(OFST+1,sp)
 793  005c 97            	ld	xl,a
 794  005d 7b03          	ld	a,(OFST+2,sp)
 795  005f 1b01          	add	a,(OFST+0,sp)
 796  0061 2401          	jrnc	L41
 797  0063 5c            	incw	x
 798  0064               L41:
 799  0064 02            	rlwa	x,a
 800  0065 7b07          	ld	a,(OFST+6,sp)
 801  0067 43            	cpl	a
 802  0068 e40a          	and	a,(10,x)
 803  006a e70a          	ld	(10,x),a
 804  006c               L363:
 805                     ; 144 }
 808  006c 5b03          	addw	sp,#3
 809  006e 81            	ret
 856                     ; 153 void ADC_Cmd(ADC_TypeDef* ADCx,
 856                     ; 154              FunctionalState NewState)
 856                     ; 155 {
 857                     	switch	.text
 858  006f               _ADC_Cmd:
 860  006f 89            	pushw	x
 861       00000000      OFST:	set	0
 864                     ; 157   assert_param(IS_FUNCTIONAL_STATE(NewState));
 866                     ; 159   if (NewState != DISABLE)
 868  0070 0d05          	tnz	(OFST+5,sp)
 869  0072 2706          	jreq	L114
 870                     ; 162     ADCx->CR1 |= ADC_CR1_ADON;
 872  0074 f6            	ld	a,(x)
 873  0075 aa01          	or	a,#1
 874  0077 f7            	ld	(x),a
 876  0078 2006          	jra	L314
 877  007a               L114:
 878                     ; 167     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 880  007a 1e01          	ldw	x,(OFST+1,sp)
 881  007c f6            	ld	a,(x)
 882  007d a4fe          	and	a,#254
 883  007f f7            	ld	(x),a
 884  0080               L314:
 885                     ; 169 }
 888  0080 85            	popw	x
 889  0081 81            	ret
 973                     ; 180 void ADC_ITConfig(ADC_TypeDef* ADCx,
 973                     ; 181                   ADC_IT_TypeDef ADC_IT,
 973                     ; 182                   FunctionalState NewState)
 973                     ; 183 {
 974                     	switch	.text
 975  0082               _ADC_ITConfig:
 977  0082 89            	pushw	x
 978       00000000      OFST:	set	0
 981                     ; 185   assert_param(IS_FUNCTIONAL_STATE(NewState));
 983                     ; 186   assert_param(IS_ADC_IT(ADC_IT));
 985                     ; 188   if (NewState != DISABLE)
 987  0083 0d06          	tnz	(OFST+6,sp)
 988  0085 2706          	jreq	L754
 989                     ; 191     ADCx->CR1 |= (uint8_t) ADC_IT;
 991  0087 f6            	ld	a,(x)
 992  0088 1a05          	or	a,(OFST+5,sp)
 993  008a f7            	ld	(x),a
 995  008b 2007          	jra	L164
 996  008d               L754:
 997                     ; 196     ADCx->CR1 &= (uint8_t)(~ADC_IT);
 999  008d 1e01          	ldw	x,(OFST+1,sp)
1000  008f 7b05          	ld	a,(OFST+5,sp)
1001  0091 43            	cpl	a
1002  0092 f4            	and	a,(x)
1003  0093 f7            	ld	(x),a
1004  0094               L164:
1005                     ; 198 }
1008  0094 85            	popw	x
1009  0095 81            	ret
1056                     ; 207 void ADC_DMACmd(ADC_TypeDef* ADCx,
1056                     ; 208                 FunctionalState NewState)
1056                     ; 209 {
1057                     	switch	.text
1058  0096               _ADC_DMACmd:
1060  0096 89            	pushw	x
1061       00000000      OFST:	set	0
1064                     ; 211   assert_param(IS_FUNCTIONAL_STATE(NewState));
1066                     ; 213   if (NewState != DISABLE)
1068  0097 0d05          	tnz	(OFST+5,sp)
1069  0099 2708          	jreq	L705
1070                     ; 216     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
1072  009b e60a          	ld	a,(10,x)
1073  009d a47f          	and	a,#127
1074  009f e70a          	ld	(10,x),a
1076  00a1 2008          	jra	L115
1077  00a3               L705:
1078                     ; 221     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
1080  00a3 1e01          	ldw	x,(OFST+1,sp)
1081  00a5 e60a          	ld	a,(10,x)
1082  00a7 aa80          	or	a,#128
1083  00a9 e70a          	ld	(10,x),a
1084  00ab               L115:
1085                     ; 223 }
1088  00ab 85            	popw	x
1089  00ac 81            	ret
1124                     ; 231 void ADC_TempSensorCmd(FunctionalState NewState)
1124                     ; 232 {
1125                     	switch	.text
1126  00ad               _ADC_TempSensorCmd:
1130                     ; 234   assert_param(IS_FUNCTIONAL_STATE(NewState));
1132                     ; 236   if (NewState != DISABLE)
1134  00ad 4d            	tnz	a
1135  00ae 2706          	jreq	L135
1136                     ; 239     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1138  00b0 721a534e      	bset	21326,#5
1140  00b4 2004          	jra	L335
1141  00b6               L135:
1142                     ; 244     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1144  00b6 721b534e      	bres	21326,#5
1145  00ba               L335:
1146                     ; 246 }
1149  00ba 81            	ret
1184                     ; 254 void ADC_VrefintCmd(FunctionalState NewState)
1184                     ; 255 {
1185                     	switch	.text
1186  00bb               _ADC_VrefintCmd:
1190                     ; 257   assert_param(IS_FUNCTIONAL_STATE(NewState));
1192                     ; 259   if (NewState != DISABLE)
1194  00bb 4d            	tnz	a
1195  00bc 2706          	jreq	L355
1196                     ; 262     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1198  00be 7218534e      	bset	21326,#4
1200  00c2 2004          	jra	L555
1201  00c4               L355:
1202                     ; 267     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1204  00c4 7219534e      	bres	21326,#4
1205  00c8               L555:
1206                     ; 269 }
1209  00c8 81            	ret
1247                     ; 276 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
1247                     ; 277 {
1248                     	switch	.text
1249  00c9               _ADC_SoftwareStartConv:
1253                     ; 279   ADCx->CR1 |= ADC_CR1_START;
1255  00c9 f6            	ld	a,(x)
1256  00ca aa02          	or	a,#2
1257  00cc f7            	ld	(x),a
1258                     ; 280 }
1261  00cd 81            	ret
1411                     ; 291 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1411                     ; 292                             ADC_Group_TypeDef ADC_GroupChannels,
1411                     ; 293                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1411                     ; 294 {
1412                     	switch	.text
1413  00ce               _ADC_SamplingTimeConfig:
1415  00ce 89            	pushw	x
1416       00000000      OFST:	set	0
1419                     ; 296   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1421                     ; 297   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1423                     ; 299   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1425  00cf 0d05          	tnz	(OFST+5,sp)
1426  00d1 2712          	jreq	L366
1427                     ; 302     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1429  00d3 e602          	ld	a,(2,x)
1430  00d5 a41f          	and	a,#31
1431  00d7 e702          	ld	(2,x),a
1432                     ; 303     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1434  00d9 7b06          	ld	a,(OFST+6,sp)
1435  00db 4e            	swap	a
1436  00dc 48            	sll	a
1437  00dd a4e0          	and	a,#224
1438  00df ea02          	or	a,(2,x)
1439  00e1 e702          	ld	(2,x),a
1441  00e3 2010          	jra	L566
1442  00e5               L366:
1443                     ; 308     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1445  00e5 1e01          	ldw	x,(OFST+1,sp)
1446  00e7 e601          	ld	a,(1,x)
1447  00e9 a4f8          	and	a,#248
1448  00eb e701          	ld	(1,x),a
1449                     ; 309     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1451  00ed 1e01          	ldw	x,(OFST+1,sp)
1452  00ef e601          	ld	a,(1,x)
1453  00f1 1a06          	or	a,(OFST+6,sp)
1454  00f3 e701          	ld	(1,x),a
1455  00f5               L566:
1456                     ; 311 }
1459  00f5 85            	popw	x
1460  00f6 81            	ret
1527                     ; 322 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx,
1527                     ; 323                               ADC_Channel_TypeDef ADC_Channels,
1527                     ; 324                               FunctionalState NewState)
1527                     ; 325 {
1528                     	switch	.text
1529  00f7               _ADC_SchmittTriggerConfig:
1531  00f7 89            	pushw	x
1532  00f8 88            	push	a
1533       00000001      OFST:	set	1
1536                     ; 326   uint8_t regindex = 0;
1538                     ; 328   assert_param(IS_FUNCTIONAL_STATE(NewState));
1540                     ; 330   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1542  00f9 7b06          	ld	a,(OFST+5,sp)
1543  00fb 6b01          	ld	(OFST+0,sp),a
1545                     ; 332   if (NewState != DISABLE)
1547  00fd 0d08          	tnz	(OFST+7,sp)
1548  00ff 2710          	jreq	L327
1549                     ; 335     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
1551  0101 01            	rrwa	x,a
1552  0102 1b01          	add	a,(OFST+0,sp)
1553  0104 2401          	jrnc	L63
1554  0106 5c            	incw	x
1555  0107               L63:
1556  0107 02            	rlwa	x,a
1557  0108 7b07          	ld	a,(OFST+6,sp)
1558  010a 43            	cpl	a
1559  010b e40e          	and	a,(14,x)
1560  010d e70e          	ld	(14,x),a
1562  010f 2011          	jra	L527
1563  0111               L327:
1564                     ; 340     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
1566  0111 7b02          	ld	a,(OFST+1,sp)
1567  0113 97            	ld	xl,a
1568  0114 7b03          	ld	a,(OFST+2,sp)
1569  0116 1b01          	add	a,(OFST+0,sp)
1570  0118 2401          	jrnc	L04
1571  011a 5c            	incw	x
1572  011b               L04:
1573  011b 02            	rlwa	x,a
1574  011c e60e          	ld	a,(14,x)
1575  011e 1a07          	or	a,(OFST+6,sp)
1576  0120 e70e          	ld	(14,x),a
1577  0122               L527:
1578                     ; 342 }
1581  0122 5b03          	addw	sp,#3
1582  0124 81            	ret
1710                     ; 353 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
1710                     ; 354                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
1710                     ; 355                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
1710                     ; 356 {
1711                     	switch	.text
1712  0125               _ADC_ExternalTrigConfig:
1714  0125 89            	pushw	x
1715       00000000      OFST:	set	0
1718                     ; 358   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
1720                     ; 359   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
1722                     ; 362   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
1724  0126 e601          	ld	a,(1,x)
1725  0128 a487          	and	a,#135
1726  012a e701          	ld	(1,x),a
1727                     ; 365   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | (uint8_t)ADC_ExtEventSelection);
1729  012c 7b06          	ld	a,(OFST+6,sp)
1730  012e 1a05          	or	a,(OFST+5,sp)
1731  0130 ea01          	or	a,(1,x)
1732  0132 e701          	ld	(1,x),a
1733                     ; 366 }
1736  0134 85            	popw	x
1737  0135 81            	ret
1784                     ; 374 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
1784                     ; 375 {
1785                     	switch	.text
1786  0136               _ADC_GetConversionValue:
1788  0136 89            	pushw	x
1789  0137 89            	pushw	x
1790       00000002      OFST:	set	2
1793                     ; 376   uint16_t tmpreg = 0;
1795                     ; 379   tmpreg = (uint16_t)(ADCx->DRH);
1797  0138 e604          	ld	a,(4,x)
1798  013a 5f            	clrw	x
1799  013b 97            	ld	xl,a
1800  013c 1f01          	ldw	(OFST-1,sp),x
1802                     ; 380   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
1804  013e 1e01          	ldw	x,(OFST-1,sp)
1805  0140 1603          	ldw	y,(OFST+1,sp)
1806  0142 90e605        	ld	a,(5,y)
1807  0145 02            	rlwa	x,a
1808  0146 1f01          	ldw	(OFST-1,sp),x
1810                     ; 383   return (uint16_t)(tmpreg) ;
1812  0148 1e01          	ldw	x,(OFST-1,sp)
1815  014a 5b04          	addw	sp,#4
1816  014c 81            	ret
2130                     ; 395 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
2130                     ; 396                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
2130                     ; 397 {
2131                     	switch	.text
2132  014d               _ADC_AnalogWatchdogChannelSelect:
2134  014d 89            	pushw	x
2135       00000000      OFST:	set	0
2138                     ; 399   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
2140                     ; 402   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
2142  014e e602          	ld	a,(2,x)
2143  0150 a4e0          	and	a,#224
2144  0152 e702          	ld	(2,x),a
2145                     ; 405   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
2147  0154 e602          	ld	a,(2,x)
2148  0156 1a05          	or	a,(OFST+5,sp)
2149  0158 e702          	ld	(2,x),a
2150                     ; 406 }
2153  015a 85            	popw	x
2154  015b 81            	ret
2210                     ; 417 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx,
2210                     ; 418                                         uint16_t HighThreshold,
2210                     ; 419                                         uint16_t LowThreshold)
2210                     ; 420 {
2211                     	switch	.text
2212  015c               _ADC_AnalogWatchdogThresholdsConfig:
2214  015c 89            	pushw	x
2215       00000000      OFST:	set	0
2218                     ; 422   assert_param(IS_ADC_THRESHOLD(HighThreshold));
2220                     ; 423   assert_param(IS_ADC_THRESHOLD(LowThreshold));
2222                     ; 426   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
2224  015d 7b05          	ld	a,(OFST+5,sp)
2225  015f 1e01          	ldw	x,(OFST+1,sp)
2226  0161 e706          	ld	(6,x),a
2227                     ; 427   ADCx->HTRL = (uint8_t)(HighThreshold);
2229  0163 7b06          	ld	a,(OFST+6,sp)
2230  0165 1e01          	ldw	x,(OFST+1,sp)
2231  0167 e707          	ld	(7,x),a
2232                     ; 430   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
2234  0169 7b07          	ld	a,(OFST+7,sp)
2235  016b 1e01          	ldw	x,(OFST+1,sp)
2236  016d e708          	ld	(8,x),a
2237                     ; 431   ADCx->LTRL = (uint8_t)(LowThreshold);
2239  016f 7b08          	ld	a,(OFST+8,sp)
2240  0171 1e01          	ldw	x,(OFST+1,sp)
2241  0173 e709          	ld	(9,x),a
2242                     ; 432 }
2245  0175 85            	popw	x
2246  0176 81            	ret
2313                     ; 446 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
2313                     ; 447                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
2313                     ; 448                               uint16_t HighThreshold,
2313                     ; 449                               uint16_t LowThreshold)
2313                     ; 450 {
2314                     	switch	.text
2315  0177               _ADC_AnalogWatchdogConfig:
2317  0177 89            	pushw	x
2318       00000000      OFST:	set	0
2321                     ; 452   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
2323                     ; 453   assert_param(IS_ADC_THRESHOLD(HighThreshold));
2325                     ; 454   assert_param(IS_ADC_THRESHOLD(LowThreshold));
2327                     ; 457   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
2329  0178 e602          	ld	a,(2,x)
2330  017a a4e0          	and	a,#224
2331  017c e702          	ld	(2,x),a
2332                     ; 460   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
2334  017e e602          	ld	a,(2,x)
2335  0180 1a05          	or	a,(OFST+5,sp)
2336  0182 e702          	ld	(2,x),a
2337                     ; 463   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
2339  0184 7b06          	ld	a,(OFST+6,sp)
2340  0186 1e01          	ldw	x,(OFST+1,sp)
2341  0188 e706          	ld	(6,x),a
2342                     ; 464   ADCx->HTRL = (uint8_t)(HighThreshold);
2344  018a 7b07          	ld	a,(OFST+7,sp)
2345  018c 1e01          	ldw	x,(OFST+1,sp)
2346  018e e707          	ld	(7,x),a
2347                     ; 467   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
2349  0190 7b08          	ld	a,(OFST+8,sp)
2350  0192 1e01          	ldw	x,(OFST+1,sp)
2351  0194 e708          	ld	(8,x),a
2352                     ; 468   ADCx->LTRL = (uint8_t)LowThreshold;
2354  0196 7b09          	ld	a,(OFST+9,sp)
2355  0198 1e01          	ldw	x,(OFST+1,sp)
2356  019a e709          	ld	(9,x),a
2357                     ; 469 }
2360  019c 85            	popw	x
2361  019d 81            	ret
2466                     ; 478 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2466                     ; 479 {
2467                     	switch	.text
2468  019e               _ADC_GetFlagStatus:
2470  019e 89            	pushw	x
2471  019f 88            	push	a
2472       00000001      OFST:	set	1
2475                     ; 480   FlagStatus flagstatus = RESET;
2477                     ; 483   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2479                     ; 486   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2481  01a0 e603          	ld	a,(3,x)
2482  01a2 1506          	bcp	a,(OFST+5,sp)
2483  01a4 2706          	jreq	L3131
2484                     ; 489     flagstatus = SET;
2486  01a6 a601          	ld	a,#1
2487  01a8 6b01          	ld	(OFST+0,sp),a
2490  01aa 2002          	jra	L5131
2491  01ac               L3131:
2492                     ; 494     flagstatus = RESET;
2494  01ac 0f01          	clr	(OFST+0,sp)
2496  01ae               L5131:
2497                     ; 498   return  flagstatus;
2499  01ae 7b01          	ld	a,(OFST+0,sp)
2502  01b0 5b03          	addw	sp,#3
2503  01b2 81            	ret
2550                     ; 508 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2550                     ; 509                    ADC_FLAG_TypeDef ADC_FLAG)
2550                     ; 510 {
2551                     	switch	.text
2552  01b3               _ADC_ClearFlag:
2554  01b3 89            	pushw	x
2555       00000000      OFST:	set	0
2558                     ; 512   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2560                     ; 515   ADCx->SR = (uint8_t)~ADC_FLAG;
2562  01b4 7b05          	ld	a,(OFST+5,sp)
2563  01b6 43            	cpl	a
2564  01b7 1e01          	ldw	x,(OFST+1,sp)
2565  01b9 e703          	ld	(3,x),a
2566                     ; 516 }
2569  01bb 85            	popw	x
2570  01bc 81            	ret
2646                     ; 526 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2646                     ; 527                          ADC_IT_TypeDef ADC_IT)
2646                     ; 528 {
2647                     	switch	.text
2648  01bd               _ADC_GetITStatus:
2650  01bd 89            	pushw	x
2651  01be 5203          	subw	sp,#3
2652       00000003      OFST:	set	3
2655                     ; 529   ITStatus itstatus = RESET;
2657                     ; 530   uint8_t itmask = 0, enablestatus = 0;
2661                     ; 533   assert_param(IS_ADC_GET_IT(ADC_IT));
2663                     ; 536   itmask = (uint8_t)(ADC_IT >> 3);
2665  01c0 7b08          	ld	a,(OFST+5,sp)
2666  01c2 44            	srl	a
2667  01c3 44            	srl	a
2668  01c4 44            	srl	a
2669  01c5 6b03          	ld	(OFST+0,sp),a
2671                     ; 537   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | (uint8_t)(itmask & (uint8_t)0x03));
2673  01c7 7b03          	ld	a,(OFST+0,sp)
2674  01c9 a403          	and	a,#3
2675  01cb 6b01          	ld	(OFST-2,sp),a
2677  01cd 7b03          	ld	a,(OFST+0,sp)
2678  01cf a410          	and	a,#16
2679  01d1 44            	srl	a
2680  01d2 44            	srl	a
2681  01d3 1a01          	or	a,(OFST-2,sp)
2682  01d5 6b03          	ld	(OFST+0,sp),a
2684                     ; 540   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2686  01d7 f6            	ld	a,(x)
2687  01d8 1408          	and	a,(OFST+5,sp)
2688  01da 6b02          	ld	(OFST-1,sp),a
2690                     ; 543   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2692  01dc e603          	ld	a,(3,x)
2693  01de 1503          	bcp	a,(OFST+0,sp)
2694  01e0 270a          	jreq	L3041
2696  01e2 0d02          	tnz	(OFST-1,sp)
2697  01e4 2706          	jreq	L3041
2698                     ; 546     itstatus = SET;
2700  01e6 a601          	ld	a,#1
2701  01e8 6b03          	ld	(OFST+0,sp),a
2704  01ea 2002          	jra	L5041
2705  01ec               L3041:
2706                     ; 551     itstatus = RESET;
2708  01ec 0f03          	clr	(OFST+0,sp)
2710  01ee               L5041:
2711                     ; 555   return  itstatus;
2713  01ee 7b03          	ld	a,(OFST+0,sp)
2716  01f0 5b05          	addw	sp,#5
2717  01f2 81            	ret
2774                     ; 565 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2774                     ; 566                            ADC_IT_TypeDef ADC_IT)
2774                     ; 567 {
2775                     	switch	.text
2776  01f3               _ADC_ClearITPendingBit:
2778  01f3 89            	pushw	x
2779  01f4 89            	pushw	x
2780       00000002      OFST:	set	2
2783                     ; 568   uint8_t itmask = 0;
2785                     ; 571   assert_param(IS_ADC_IT(ADC_IT));
2787                     ; 574   itmask = (uint8_t)(ADC_IT >> 3);
2789  01f5 7b07          	ld	a,(OFST+5,sp)
2790  01f7 44            	srl	a
2791  01f8 44            	srl	a
2792  01f9 44            	srl	a
2793  01fa 6b02          	ld	(OFST+0,sp),a
2795                     ; 575   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | (uint8_t)(itmask & (uint8_t)0x03));
2797  01fc 7b02          	ld	a,(OFST+0,sp)
2798  01fe a403          	and	a,#3
2799  0200 6b01          	ld	(OFST-1,sp),a
2801  0202 7b02          	ld	a,(OFST+0,sp)
2802  0204 a410          	and	a,#16
2803  0206 44            	srl	a
2804  0207 44            	srl	a
2805  0208 1a01          	or	a,(OFST-1,sp)
2806  020a 6b02          	ld	(OFST+0,sp),a
2808                     ; 578   ADCx->SR = (uint8_t)~itmask;
2810  020c 7b02          	ld	a,(OFST+0,sp)
2811  020e 43            	cpl	a
2812  020f 1e03          	ldw	x,(OFST+1,sp)
2813  0211 e703          	ld	(3,x),a
2814                     ; 579 }
2817  0213 5b04          	addw	sp,#4
2818  0215 81            	ret
2831                     	xdef	_ADC_ClearITPendingBit
2832                     	xdef	_ADC_GetITStatus
2833                     	xdef	_ADC_ClearFlag
2834                     	xdef	_ADC_GetFlagStatus
2835                     	xdef	_ADC_AnalogWatchdogConfig
2836                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2837                     	xdef	_ADC_AnalogWatchdogChannelSelect
2838                     	xdef	_ADC_GetConversionValue
2839                     	xdef	_ADC_ExternalTrigConfig
2840                     	xdef	_ADC_SchmittTriggerConfig
2841                     	xdef	_ADC_SamplingTimeConfig
2842                     	xdef	_ADC_SoftwareStartConv
2843                     	xdef	_ADC_VrefintCmd
2844                     	xdef	_ADC_TempSensorCmd
2845                     	xdef	_ADC_DMACmd
2846                     	xdef	_ADC_ITConfig
2847                     	xdef	_ADC_Cmd
2848                     	xdef	_ADC_ChannelCmd
2849                     	xdef	_ADC_Init
2850                     	xdef	_ADC_DeInit
2869                     	end
