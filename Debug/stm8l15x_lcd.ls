   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  54                     ; 45 void LCD_DeInit(void)
  54                     ; 46 {
  56                     	switch	.text
  57  0000               _LCD_DeInit:
  59  0000 88            	push	a
  60       00000001      OFST:	set	1
  63                     ; 47   uint8_t counter = 0;
  65                     ; 49   LCD->CR1 = LCD_CR1_RESET_VALUE;
  67  0001 725f5400      	clr	21504
  68                     ; 50   LCD->CR2 = LCD_CR2_RESET_VALUE;
  70  0005 725f5401      	clr	21505
  71                     ; 51   LCD->CR3 = LCD_CR3_RESET_VALUE;
  73  0009 725f5402      	clr	21506
  74                     ; 52   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  76  000d 725f5403      	clr	21507
  77                     ; 54   for (counter = 0;counter < 0x05; counter++)
  79  0011 0f01          	clr	(OFST+0,sp)
  81  0013               L72:
  82                     ; 56     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  84  0013 7b01          	ld	a,(OFST+0,sp)
  85  0015 5f            	clrw	x
  86  0016 97            	ld	xl,a
  87  0017 724f5404      	clr	(21508,x)
  88                     ; 54   for (counter = 0;counter < 0x05; counter++)
  90  001b 0c01          	inc	(OFST+0,sp)
  94  001d 7b01          	ld	a,(OFST+0,sp)
  95  001f a105          	cp	a,#5
  96  0021 25f0          	jrult	L72
  97                     ; 59   for (counter = 0;counter < 0x16; counter++)
  99  0023 0f01          	clr	(OFST+0,sp)
 101  0025               L53:
 102                     ; 61     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
 104  0025 7b01          	ld	a,(OFST+0,sp)
 105  0027 5f            	clrw	x
 106  0028 97            	ld	xl,a
 107  0029 724f540c      	clr	(21516,x)
 108                     ; 59   for (counter = 0;counter < 0x16; counter++)
 110  002d 0c01          	inc	(OFST+0,sp)
 114  002f 7b01          	ld	a,(OFST+0,sp)
 115  0031 a116          	cp	a,#22
 116  0033 25f0          	jrult	L53
 117                     ; 64   LCD->CR4 = LCD_CR4_RESET_VALUE;
 119  0035 725f542f      	clr	21551
 120                     ; 66 }
 123  0039 84            	pop	a
 124  003a 81            	ret
 527                     ; 77 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 527                     ; 78               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 527                     ; 79               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 527                     ; 80 {
 528                     	switch	.text
 529  003b               _LCD_Init:
 531  003b 89            	pushw	x
 532       00000000      OFST:	set	0
 535                     ; 82   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 537                     ; 83   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 539                     ; 84   assert_param(IS_LCD_DUTY(LCD_Duty));
 541                     ; 85   assert_param(IS_LCD_BIAS(LCD_Bias));
 543                     ; 86   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 545                     ; 88   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 547  003c c65403        	ld	a,21507
 548  003f a40f          	and	a,#15
 549  0041 c75403        	ld	21507,a
 550                     ; 89   LCD->FRQ |= LCD_Prescaler;
 552  0044 9e            	ld	a,xh
 553  0045 ca5403        	or	a,21507
 554  0048 c75403        	ld	21507,a
 555                     ; 91   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 557  004b c65403        	ld	a,21507
 558  004e a4f0          	and	a,#240
 559  0050 c75403        	ld	21507,a
 560                     ; 92   LCD->FRQ |= LCD_Divider;
 562  0053 9f            	ld	a,xl
 563  0054 ca5403        	or	a,21507
 564  0057 c75403        	ld	21507,a
 565                     ; 95   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 567  005a c65400        	ld	a,21504
 568  005d a4f9          	and	a,#249
 569  005f c75400        	ld	21504,a
 570                     ; 96   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 572  0062 7213542f      	bres	21551,#1
 573                     ; 98   if (LCD_Duty == LCD_Duty_1_8)
 575  0066 7b05          	ld	a,(OFST+5,sp)
 576  0068 a120          	cp	a,#32
 577  006a 260f          	jrne	L152
 578                     ; 100     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 580  006c 7b05          	ld	a,(OFST+5,sp)
 581  006e a4f0          	and	a,#240
 582  0070 4e            	swap	a
 583  0071 a40f          	and	a,#15
 584  0073 ca542f        	or	a,21551
 585  0076 c7542f        	ld	21551,a
 587  0079 200a          	jra	L352
 588  007b               L152:
 589                     ; 104     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 591  007b 7b05          	ld	a,(OFST+5,sp)
 592  007d a40f          	and	a,#15
 593  007f ca5400        	or	a,21504
 594  0082 c75400        	ld	21504,a
 595  0085               L352:
 596                     ; 108   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 598  0085 72115400      	bres	21504,#0
 599                     ; 109   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 601  0089 7211542f      	bres	21551,#0
 602                     ; 111   if (LCD_Bias == LCD_Bias_1_4)
 604  008d 7b06          	ld	a,(OFST+6,sp)
 605  008f a110          	cp	a,#16
 606  0091 2619          	jrne	L552
 607                     ; 113     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 609  0093 7b06          	ld	a,(OFST+6,sp)
 610  0095 a40f          	and	a,#15
 611  0097 ca5400        	or	a,21504
 612  009a c75400        	ld	21504,a
 613                     ; 114     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 615  009d 7b06          	ld	a,(OFST+6,sp)
 616  009f a4f0          	and	a,#240
 617  00a1 4e            	swap	a
 618  00a2 a40f          	and	a,#15
 619  00a4 ca542f        	or	a,21551
 620  00a7 c7542f        	ld	21551,a
 622  00aa 200a          	jra	L752
 623  00ac               L552:
 624                     ; 118     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 626  00ac 7b06          	ld	a,(OFST+6,sp)
 627  00ae a40f          	and	a,#15
 628  00b0 ca5400        	or	a,21504
 629  00b3 c75400        	ld	21504,a
 630  00b6               L752:
 631                     ; 121   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 633  00b6 72115401      	bres	21505,#0
 634                     ; 122   LCD->CR2 |= LCD_VoltageSource;
 636  00ba c65401        	ld	a,21505
 637  00bd 1a07          	or	a,(OFST+7,sp)
 638  00bf c75401        	ld	21505,a
 639                     ; 124 }
 642  00c2 85            	popw	x
 643  00c3 81            	ret
 698                     ; 132 void LCD_Cmd(FunctionalState NewState)
 698                     ; 133 {
 699                     	switch	.text
 700  00c4               _LCD_Cmd:
 704                     ; 135   assert_param(IS_FUNCTIONAL_STATE(NewState));
 706                     ; 137   if (NewState != DISABLE)
 708  00c4 4d            	tnz	a
 709  00c5 2706          	jreq	L703
 710                     ; 139     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 712  00c7 721c5402      	bset	21506,#6
 714  00cb 2004          	jra	L113
 715  00cd               L703:
 716                     ; 143     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 718  00cd 721d5402      	bres	21506,#6
 719  00d1               L113:
 720                     ; 146 }
 723  00d1 81            	ret
 758                     ; 154 void LCD_ITConfig(FunctionalState NewState)
 758                     ; 155 {
 759                     	switch	.text
 760  00d2               _LCD_ITConfig:
 764                     ; 157   assert_param(IS_FUNCTIONAL_STATE(NewState));
 766                     ; 159   if (NewState != DISABLE)
 768  00d2 4d            	tnz	a
 769  00d3 2706          	jreq	L133
 770                     ; 161     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
 772  00d5 721a5402      	bset	21506,#5
 774  00d9 2004          	jra	L333
 775  00db               L133:
 776                     ; 165     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
 778  00db 721b5402      	bres	21506,#5
 779  00df               L333:
 780                     ; 168 }
 783  00df 81            	ret
 818                     ; 175 void LCD_HighDriveCmd(FunctionalState NewState)
 818                     ; 176 {
 819                     	switch	.text
 820  00e0               _LCD_HighDriveCmd:
 824                     ; 178   assert_param(IS_FUNCTIONAL_STATE(NewState));
 826                     ; 180   if (NewState != DISABLE)
 828  00e0 4d            	tnz	a
 829  00e1 2706          	jreq	L353
 830                     ; 182     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 832  00e3 72185401      	bset	21505,#4
 834  00e7 2004          	jra	L553
 835  00e9               L353:
 836                     ; 186     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 838  00e9 72195401      	bres	21505,#4
 839  00ed               L553:
 840                     ; 189 }
 843  00ed 81            	ret
 950                     ; 197 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
 950                     ; 198 {
 951                     	switch	.text
 952  00ee               _LCD_PulseOnDurationConfig:
 954  00ee 88            	push	a
 955       00000000      OFST:	set	0
 958                     ; 200   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
 960                     ; 202   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
 962  00ef c65401        	ld	a,21505
 963  00f2 a41f          	and	a,#31
 964  00f4 c75401        	ld	21505,a
 965                     ; 203   LCD->CR2 |= LCD_PulseOnDuration;
 967  00f7 c65401        	ld	a,21505
 968  00fa 1a01          	or	a,(OFST+1,sp)
 969  00fc c75401        	ld	21505,a
 970                     ; 205 }
 973  00ff 84            	pop	a
 974  0100 81            	ret
1071                     ; 212 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1071                     ; 213 {
1072                     	switch	.text
1073  0101               _LCD_DeadTimeConfig:
1075  0101 88            	push	a
1076       00000000      OFST:	set	0
1079                     ; 215   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1081                     ; 217   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1083  0102 c65402        	ld	a,21506
1084  0105 a4f8          	and	a,#248
1085  0107 c75402        	ld	21506,a
1086                     ; 219   LCD->CR3 |= LCD_DeadTime;
1088  010a c65402        	ld	a,21506
1089  010d 1a01          	or	a,(OFST+1,sp)
1090  010f c75402        	ld	21506,a
1091                     ; 221 }
1094  0112 84            	pop	a
1095  0113 81            	ret
1247                     ; 233 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode,
1247                     ; 234                      LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1247                     ; 235 {
1248                     	switch	.text
1249  0114               _LCD_BlinkConfig:
1253                     ; 237   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1255                     ; 238   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1257                     ; 240   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1259  0114 c65400        	ld	a,21504
1260  0117 a43f          	and	a,#63
1261  0119 c75400        	ld	21504,a
1262                     ; 241   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1264  011c 9e            	ld	a,xh
1265  011d ca5400        	or	a,21504
1266  0120 c75400        	ld	21504,a
1267                     ; 243   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1269  0123 c65400        	ld	a,21504
1270  0126 a4c7          	and	a,#199
1271  0128 c75400        	ld	21504,a
1272                     ; 244   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1274  012b 9f            	ld	a,xl
1275  012c ca5400        	or	a,21504
1276  012f c75400        	ld	21504,a
1277                     ; 246 }
1280  0132 81            	ret
1377                     ; 254 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1377                     ; 255 {
1378                     	switch	.text
1379  0133               _LCD_ContrastConfig:
1381  0133 88            	push	a
1382       00000000      OFST:	set	0
1385                     ; 257   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1387                     ; 259   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1389  0134 c65401        	ld	a,21505
1390  0137 a4f1          	and	a,#241
1391  0139 c75401        	ld	21505,a
1392                     ; 260   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1394  013c c65401        	ld	a,21505
1395  013f 1a01          	or	a,(OFST+1,sp)
1396  0141 c75401        	ld	21505,a
1397                     ; 262 }
1400  0144 84            	pop	a
1401  0145 81            	ret
1500                     ; 272 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
1500                     ; 273 {
1501                     	switch	.text
1502  0146               _LCD_PortMaskConfig:
1504  0146 89            	pushw	x
1505       00000000      OFST:	set	0
1508                     ; 275   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
1510                     ; 278   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
1512  0147 9e            	ld	a,xh
1513  0148 5f            	clrw	x
1514  0149 97            	ld	xl,a
1515  014a 7b02          	ld	a,(OFST+2,sp)
1516  014c d75404        	ld	(21508,x),a
1517                     ; 280 }
1520  014f 85            	popw	x
1521  0150 81            	ret
1725                     ; 290 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1725                     ; 291 {
1726                     	switch	.text
1727  0151               _LCD_WriteRAM:
1729  0151 89            	pushw	x
1730       00000000      OFST:	set	0
1733                     ; 293   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1735                     ; 296   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1737  0152 9e            	ld	a,xh
1738  0153 5f            	clrw	x
1739  0154 97            	ld	xl,a
1740  0155 7b02          	ld	a,(OFST+2,sp)
1741  0157 d7540c        	ld	(21516,x),a
1742                     ; 298 }
1745  015a 85            	popw	x
1746  015b 81            	ret
1803                     ; 307 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1803                     ; 308 {
1804                     	switch	.text
1805  015c               _LCD_PageSelect:
1809                     ; 310   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1811                     ; 312   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1813  015c 7215542f      	bres	21551,#2
1814                     ; 313   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1816  0160 ca542f        	or	a,21551
1817  0163 c7542f        	ld	21551,a
1818                     ; 315 }
1821  0166 81            	ret
1877                     ; 321 FlagStatus LCD_GetFlagStatus(void)
1877                     ; 322 {
1878                     	switch	.text
1879  0167               _LCD_GetFlagStatus:
1881  0167 88            	push	a
1882       00000001      OFST:	set	1
1885                     ; 323   FlagStatus status = RESET;
1887                     ; 326   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1889  0168 c65402        	ld	a,21506
1890  016b a510          	bcp	a,#16
1891  016d 2706          	jreq	L7201
1892                     ; 328     status = SET; /* Flag is set */
1894  016f a601          	ld	a,#1
1895  0171 6b01          	ld	(OFST+0,sp),a
1898  0173 2002          	jra	L1301
1899  0175               L7201:
1900                     ; 332     status = RESET; /* Flag is reset*/
1902  0175 0f01          	clr	(OFST+0,sp)
1904  0177               L1301:
1905                     ; 335   return status;
1907  0177 7b01          	ld	a,(OFST+0,sp)
1910  0179 5b01          	addw	sp,#1
1911  017b 81            	ret
1934                     ; 344 void LCD_ClearFlag(void)
1934                     ; 345 {
1935                     	switch	.text
1936  017c               _LCD_ClearFlag:
1940                     ; 347   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1942  017c 72165402      	bset	21506,#3
1943                     ; 349 }
1946  0180 81            	ret
1991                     ; 356 ITStatus LCD_GetITStatus(void)
1991                     ; 357 {
1992                     	switch	.text
1993  0181               _LCD_GetITStatus:
1995  0181 88            	push	a
1996       00000001      OFST:	set	1
1999                     ; 358   ITStatus pendingbitstatus = RESET;
2001                     ; 359   uint8_t enablestatus = 0;
2003                     ; 361   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
2005  0182 c65402        	ld	a,21506
2006  0185 a420          	and	a,#32
2007  0187 6b01          	ld	(OFST+0,sp),a
2009                     ; 363   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
2011  0189 c65402        	ld	a,21506
2012  018c a510          	bcp	a,#16
2013  018e 270a          	jreq	L5601
2015  0190 0d01          	tnz	(OFST+0,sp)
2016  0192 2706          	jreq	L5601
2017                     ; 366     pendingbitstatus = SET;
2019  0194 a601          	ld	a,#1
2020  0196 6b01          	ld	(OFST+0,sp),a
2023  0198 2002          	jra	L7601
2024  019a               L5601:
2025                     ; 371     pendingbitstatus = RESET;
2027  019a 0f01          	clr	(OFST+0,sp)
2029  019c               L7601:
2030                     ; 374   return  pendingbitstatus;
2032  019c 7b01          	ld	a,(OFST+0,sp)
2035  019e 5b01          	addw	sp,#1
2036  01a0 81            	ret
2060                     ; 383 void LCD_ClearITPendingBit(void)
2060                     ; 384 {
2061                     	switch	.text
2062  01a1               _LCD_ClearITPendingBit:
2066                     ; 386   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2068  01a1 72165402      	bset	21506,#3
2069                     ; 388 }
2072  01a5 81            	ret
2085                     	xdef	_LCD_ClearITPendingBit
2086                     	xdef	_LCD_GetITStatus
2087                     	xdef	_LCD_ClearFlag
2088                     	xdef	_LCD_GetFlagStatus
2089                     	xdef	_LCD_PageSelect
2090                     	xdef	_LCD_WriteRAM
2091                     	xdef	_LCD_PortMaskConfig
2092                     	xdef	_LCD_BlinkConfig
2093                     	xdef	_LCD_ContrastConfig
2094                     	xdef	_LCD_DeadTimeConfig
2095                     	xdef	_LCD_PulseOnDurationConfig
2096                     	xdef	_LCD_HighDriveCmd
2097                     	xdef	_LCD_ITConfig
2098                     	xdef	_LCD_Cmd
2099                     	xdef	_LCD_Init
2100                     	xdef	_LCD_DeInit
2119                     	end
