   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  15                     .const:	section	.text
  16  0000               _SYSDivFactor:
  17  0000 01            	dc.b	1
  18  0001 02            	dc.b	2
  19  0002 04            	dc.b	4
  20  0003 08            	dc.b	8
  21  0004 10            	dc.b	16
  50                     ; 60 void CLK_DeInit(void)
  50                     ; 61 {
  52                     	switch	.text
  53  0000               _CLK_DeInit:
  57                     ; 62   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  59  0000 351150c2      	mov	20674,#17
  60                     ; 63   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  62  0004 725f50c6      	clr	20678
  63                     ; 64   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  65  0008 725f50c1      	clr	20673
  66                     ; 65   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  68  000c 725f50cb      	clr	20683
  69                     ; 66   CLK->SWR  = CLK_SWR_RESET_VALUE;
  71  0010 350150c8      	mov	20680,#1
  72                     ; 67   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  74  0014 725f50c9      	clr	20681
  75                     ; 68   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  77  0018 350350c0      	mov	20672,#3
  78                     ; 69   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  80  001c 725f50c3      	clr	20675
  81                     ; 70   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  83  0020 358050c4      	mov	20676,#128
  84                     ; 71   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  86  0024 725f50d0      	clr	20688
  87                     ; 72   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  89  0028 725f50ca      	clr	20682
  90                     ; 73   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  92  002c 725f50c5      	clr	20677
  93                     ; 74   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  95  0030 725f50cd      	clr	20685
  96                     ; 75   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  98  0034 725f50cc      	clr	20684
  99                     ; 76   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
 101  0038 725f50ce      	clr	20686
 102                     ; 77   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 104  003c 35b950cf      	mov	20687,#185
 105                     ; 78 }
 108  0040 81            	ret
 163                     ; 85 void CLK_HSICmd(FunctionalState NewState)
 163                     ; 86 {
 164                     	switch	.text
 165  0041               _CLK_HSICmd:
 169                     ; 89   assert_param(IS_FUNCTIONAL_STATE(NewState));
 171                     ; 91   if (NewState != DISABLE)
 173  0041 4d            	tnz	a
 174  0042 2706          	jreq	L74
 175                     ; 94     CLK->ICKCR |= CLK_ICKCR_HSION;
 177  0044 721050c2      	bset	20674,#0
 179  0048 2004          	jra	L15
 180  004a               L74:
 181                     ; 99     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 183  004a 721150c2      	bres	20674,#0
 184  004e               L15:
 185                     ; 101 }
 188  004e 81            	ret
 224                     ; 108 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 224                     ; 109 {
 225                     	switch	.text
 226  004f               _CLK_AdjustHSICalibrationValue:
 230                     ; 111   CLK->HSIUNLCKR = 0xAC;
 232  004f 35ac50ce      	mov	20686,#172
 233                     ; 112   CLK->HSIUNLCKR = 0x35;
 235  0053 353550ce      	mov	20686,#53
 236                     ; 115   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 238  0057 c750cd        	ld	20685,a
 239                     ; 116 }
 242  005a 81            	ret
 277                     ; 123 void CLK_LSICmd(FunctionalState NewState)
 277                     ; 124 {
 278                     	switch	.text
 279  005b               _CLK_LSICmd:
 283                     ; 127   assert_param(IS_FUNCTIONAL_STATE(NewState));
 285                     ; 129   if (NewState != DISABLE)
 287  005b 4d            	tnz	a
 288  005c 2706          	jreq	L701
 289                     ; 132     CLK->ICKCR |= CLK_ICKCR_LSION;
 291  005e 721450c2      	bset	20674,#2
 293  0062 2004          	jra	L111
 294  0064               L701:
 295                     ; 137     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 297  0064 721550c2      	bres	20674,#2
 298  0068               L111:
 299                     ; 139 }
 302  0068 81            	ret
 364                     ; 149 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 364                     ; 150 {
 365                     	switch	.text
 366  0069               _CLK_HSEConfig:
 370                     ; 152   assert_param(IS_CLK_HSE(CLK_HSE));
 372                     ; 156   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 374  0069 721150c6      	bres	20678,#0
 375                     ; 159   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 377  006d 721950c6      	bres	20678,#4
 378                     ; 162   CLK->ECKCR |= (uint8_t)CLK_HSE;
 380  0071 ca50c6        	or	a,20678
 381  0074 c750c6        	ld	20678,a
 382                     ; 163 }
 385  0077 81            	ret
 447                     ; 173 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 447                     ; 174 {
 448                     	switch	.text
 449  0078               _CLK_LSEConfig:
 453                     ; 176   assert_param(IS_CLK_LSE(CLK_LSE));
 455                     ; 180   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 457  0078 721550c6      	bres	20678,#2
 458                     ; 183   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 460  007c 721b50c6      	bres	20678,#5
 461                     ; 186   CLK->ECKCR |= (uint8_t)CLK_LSE;
 463  0080 ca50c6        	or	a,20678
 464  0083 c750c6        	ld	20678,a
 465                     ; 188 }
 468  0086 81            	ret
 542                     ; 196 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 542                     ; 197 {
 543                     	switch	.text
 544  0087               _CLK_SYSCLKSourceConfig:
 548                     ; 199   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 550                     ; 202   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 552  0087 c750c8        	ld	20680,a
 553                     ; 203 }
 556  008a 81            	ret
 654                     ; 211 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
 654                     ; 212 {
 655                     	switch	.text
 656  008b               _CLK_SYSCLKDivConfig:
 660                     ; 214   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
 662                     ; 216   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
 664  008b c750c0        	ld	20672,a
 665                     ; 217 }
 668  008e 81            	ret
 704                     ; 223 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
 704                     ; 224 {
 705                     	switch	.text
 706  008f               _CLK_SYSCLKSourceSwitchCmd:
 710                     ; 226   assert_param(IS_FUNCTIONAL_STATE(NewState));
 712                     ; 228   if (NewState != DISABLE)
 714  008f 4d            	tnz	a
 715  0090 2706          	jreq	L503
 716                     ; 231     CLK->SWCR |= CLK_SWCR_SWEN;
 718  0092 721250c9      	bset	20681,#1
 720  0096 2004          	jra	L703
 721  0098               L503:
 722                     ; 236     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 724  0098 721350c9      	bres	20681,#1
 725  009c               L703:
 726                     ; 238 }
 729  009c 81            	ret
 754                     ; 250 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 754                     ; 251 {
 755                     	switch	.text
 756  009d               _CLK_GetSYSCLKSource:
 760                     ; 252   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 762  009d c650c7        	ld	a,20679
 765  00a0 81            	ret
 789                     ; 261 void CLK_ClockSecuritySystemEnable(void)
 789                     ; 262 {
 790                     	switch	.text
 791  00a1               _CLK_ClockSecuritySystemEnable:
 795                     ; 264   CLK->CSSR |= CLK_CSSR_CSSEN;
 797  00a1 721050ca      	bset	20682,#0
 798                     ; 265 }
 801  00a5 81            	ret
 837                     ; 272 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 837                     ; 273 {
 838                     	switch	.text
 839  00a6               _CLK_ClockSecuritySytemDeglitchCmd:
 843                     ; 275   assert_param(IS_FUNCTIONAL_STATE(NewState));
 845                     ; 277   if (NewState != DISABLE)
 847  00a6 4d            	tnz	a
 848  00a7 2706          	jreq	L743
 849                     ; 280     CLK->CSSR |= CLK_CSSR_CSSDGON;
 851  00a9 721850ca      	bset	20682,#4
 853  00ad 2004          	jra	L153
 854  00af               L743:
 855                     ; 285     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 857  00af 721950ca      	bres	20682,#4
 858  00b3               L153:
 859                     ; 287 }
 862  00b3 81            	ret
 934                     ; 293 uint32_t CLK_GetClockFreq(void)
 934                     ; 294 {
 935                     	switch	.text
 936  00b4               _CLK_GetClockFreq:
 938  00b4 5209          	subw	sp,#9
 939       00000009      OFST:	set	9
 942                     ; 295   uint32_t clockfrequency = 0;
 944                     ; 296   uint32_t sourcefrequency = 0;
 946  00b6 ae0000        	ldw	x,#0
 947  00b9 1f07          	ldw	(OFST-2,sp),x
 948  00bb ae0000        	ldw	x,#0
 949  00be 1f05          	ldw	(OFST-4,sp),x
 951                     ; 297   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 953                     ; 298   uint8_t tmp = 0, presc = 0;
 957                     ; 301   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 959  00c0 c650c7        	ld	a,20679
 960  00c3 6b09          	ld	(OFST+0,sp),a
 962                     ; 303   if ( clocksource == CLK_SYSCLKSource_HSI)
 964  00c5 7b09          	ld	a,(OFST+0,sp)
 965  00c7 a101          	cp	a,#1
 966  00c9 260c          	jrne	L114
 967                     ; 305     sourcefrequency = HSI_VALUE;
 969  00cb ae2400        	ldw	x,#9216
 970  00ce 1f07          	ldw	(OFST-2,sp),x
 971  00d0 ae00f4        	ldw	x,#244
 972  00d3 1f05          	ldw	(OFST-4,sp),x
 975  00d5 2022          	jra	L314
 976  00d7               L114:
 977                     ; 307   else if ( clocksource == CLK_SYSCLKSource_LSI)
 979  00d7 7b09          	ld	a,(OFST+0,sp)
 980  00d9 a102          	cp	a,#2
 981  00db 260c          	jrne	L514
 982                     ; 309     sourcefrequency = LSI_VALUE;
 984  00dd ae9470        	ldw	x,#38000
 985  00e0 1f07          	ldw	(OFST-2,sp),x
 986  00e2 ae0000        	ldw	x,#0
 987  00e5 1f05          	ldw	(OFST-4,sp),x
 990  00e7 2010          	jra	L314
 991  00e9               L514:
 992                     ; 311   else if ( clocksource == CLK_SYSCLKSource_HSE)
 994  00e9 7b09          	ld	a,(OFST+0,sp)
 995  00eb a104          	cp	a,#4
 996  00ed 260a          	jrne	L124
 997                     ; 313     sourcefrequency = HSE_VALUE;
 999  00ef ae2400        	ldw	x,#9216
1000  00f2 1f07          	ldw	(OFST-2,sp),x
1001  00f4 ae00f4        	ldw	x,#244
1002  00f7 1f05          	ldw	(OFST-4,sp),x
1005  00f9               L124:
1006                     ; 317     clockfrequency = LSE_VALUE;
1008  00f9               L314:
1009                     ; 321   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
1011  00f9 c650c0        	ld	a,20672
1012  00fc a407          	and	a,#7
1013  00fe 6b09          	ld	(OFST+0,sp),a
1015                     ; 322   presc = SYSDivFactor[tmp];
1017  0100 7b09          	ld	a,(OFST+0,sp)
1018  0102 5f            	clrw	x
1019  0103 97            	ld	xl,a
1020  0104 d60000        	ld	a,(_SYSDivFactor,x)
1021  0107 6b09          	ld	(OFST+0,sp),a
1023                     ; 325   clockfrequency = sourcefrequency / presc;
1025  0109 7b09          	ld	a,(OFST+0,sp)
1026  010b b703          	ld	c_lreg+3,a
1027  010d 3f02          	clr	c_lreg+2
1028  010f 3f01          	clr	c_lreg+1
1029  0111 3f00          	clr	c_lreg
1030  0113 96            	ldw	x,sp
1031  0114 1c0001        	addw	x,#OFST-8
1032  0117 cd0000        	call	c_rtol
1035  011a 96            	ldw	x,sp
1036  011b 1c0005        	addw	x,#OFST-4
1037  011e cd0000        	call	c_ltor
1039  0121 96            	ldw	x,sp
1040  0122 1c0001        	addw	x,#OFST-8
1041  0125 cd0000        	call	c_ludv
1043  0128 96            	ldw	x,sp
1044  0129 1c0005        	addw	x,#OFST-4
1045  012c cd0000        	call	c_rtol
1048                     ; 327   return((uint32_t)clockfrequency);
1050  012f 96            	ldw	x,sp
1051  0130 1c0005        	addw	x,#OFST-4
1052  0133 cd0000        	call	c_ltor
1056  0136 5b09          	addw	sp,#9
1057  0138 81            	ret
1129                     ; 338 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1129                     ; 339 {
1130                     	switch	.text
1131  0139               _CLK_ITConfig:
1133  0139 89            	pushw	x
1134       00000000      OFST:	set	0
1137                     ; 342   assert_param(IS_CLK_IT(CLK_IT));
1139                     ; 343   assert_param(IS_FUNCTIONAL_STATE(NewState));
1141                     ; 345   if (NewState != DISABLE)
1143  013a 9f            	ld	a,xl
1144  013b 4d            	tnz	a
1145  013c 271d          	jreq	L164
1146                     ; 347     if (CLK_IT == CLK_IT_SWIF)
1148  013e 9e            	ld	a,xh
1149  013f a11c          	cp	a,#28
1150  0141 2606          	jrne	L364
1151                     ; 350       CLK->SWCR |= CLK_SWCR_SWIEN;
1153  0143 721450c9      	bset	20681,#2
1155  0147 202e          	jra	L374
1156  0149               L364:
1157                     ; 352     else if (CLK_IT == CLK_IT_LSECSSF)
1159  0149 7b01          	ld	a,(OFST+1,sp)
1160  014b a12c          	cp	a,#44
1161  014d 2606          	jrne	L764
1162                     ; 355       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
1164  014f 72145190      	bset	20880,#2
1166  0153 2022          	jra	L374
1167  0155               L764:
1168                     ; 360       CLK->CSSR |= CLK_CSSR_CSSDIE;
1170  0155 721450ca      	bset	20682,#2
1171  0159 201c          	jra	L374
1172  015b               L164:
1173                     ; 365     if (CLK_IT == CLK_IT_SWIF)
1175  015b 7b01          	ld	a,(OFST+1,sp)
1176  015d a11c          	cp	a,#28
1177  015f 2606          	jrne	L574
1178                     ; 368       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1180  0161 721550c9      	bres	20681,#2
1182  0165 2010          	jra	L374
1183  0167               L574:
1184                     ; 370     else if (CLK_IT == CLK_IT_LSECSSF)
1186  0167 7b01          	ld	a,(OFST+1,sp)
1187  0169 a12c          	cp	a,#44
1188  016b 2606          	jrne	L105
1189                     ; 373       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
1191  016d 72155190      	bres	20880,#2
1193  0171 2004          	jra	L374
1194  0173               L105:
1195                     ; 378       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1197  0173 721550ca      	bres	20682,#2
1198  0177               L374:
1199                     ; 381 }
1202  0177 85            	popw	x
1203  0178 81            	ret
1344                     ; 391 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
1344                     ; 392 {
1345                     	switch	.text
1346  0179               _CLK_CCOConfig:
1348  0179 89            	pushw	x
1349       00000000      OFST:	set	0
1352                     ; 394   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
1354                     ; 395   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
1356                     ; 398   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
1358  017a 9f            	ld	a,xl
1359  017b 1a01          	or	a,(OFST+1,sp)
1360  017d c750c5        	ld	20677,a
1361                     ; 399 }
1364  0180 85            	popw	x
1365  0181 81            	ret
1511                     ; 409 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1511                     ; 410 {
1512                     	switch	.text
1513  0182               _CLK_RTCClockConfig:
1515  0182 89            	pushw	x
1516       00000000      OFST:	set	0
1519                     ; 412   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1521                     ; 413   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1523                     ; 416   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1525  0183 9f            	ld	a,xl
1526  0184 1a01          	or	a,(OFST+1,sp)
1527  0186 c750c1        	ld	20673,a
1528                     ; 417 }
1531  0189 85            	popw	x
1532  018a 81            	ret
1598                     ; 425 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1598                     ; 426 {
1599                     	switch	.text
1600  018b               _CLK_BEEPClockConfig:
1604                     ; 428   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1606                     ; 431   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1608  018b c750cb        	ld	20683,a
1609                     ; 433 }
1612  018e 81            	ret
1837                     ; 443 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1837                     ; 444 {
1838                     	switch	.text
1839  018f               _CLK_PeripheralClockConfig:
1841  018f 89            	pushw	x
1842  0190 88            	push	a
1843       00000001      OFST:	set	1
1846                     ; 445   uint8_t reg = 0;
1848                     ; 448   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1850                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
1852                     ; 452   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1854  0191 9e            	ld	a,xh
1855  0192 a4f0          	and	a,#240
1856  0194 6b01          	ld	(OFST+0,sp),a
1858                     ; 454   if ( reg == 0x00)
1860  0196 0d01          	tnz	(OFST+0,sp)
1861  0198 2635          	jrne	L5001
1862                     ; 456     if (NewState != DISABLE)
1864  019a 0d03          	tnz	(OFST+2,sp)
1865  019c 2719          	jreq	L7001
1866                     ; 459       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1868  019e 7b02          	ld	a,(OFST+1,sp)
1869  01a0 a40f          	and	a,#15
1870  01a2 5f            	clrw	x
1871  01a3 97            	ld	xl,a
1872  01a4 a601          	ld	a,#1
1873  01a6 5d            	tnzw	x
1874  01a7 2704          	jreq	L05
1875  01a9               L25:
1876  01a9 48            	sll	a
1877  01aa 5a            	decw	x
1878  01ab 26fc          	jrne	L25
1879  01ad               L05:
1880  01ad ca50c3        	or	a,20675
1881  01b0 c750c3        	ld	20675,a
1883  01b3 ac390239      	jpf	L3101
1884  01b7               L7001:
1885                     ; 464       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1887  01b7 7b02          	ld	a,(OFST+1,sp)
1888  01b9 a40f          	and	a,#15
1889  01bb 5f            	clrw	x
1890  01bc 97            	ld	xl,a
1891  01bd a601          	ld	a,#1
1892  01bf 5d            	tnzw	x
1893  01c0 2704          	jreq	L45
1894  01c2               L65:
1895  01c2 48            	sll	a
1896  01c3 5a            	decw	x
1897  01c4 26fc          	jrne	L65
1898  01c6               L45:
1899  01c6 43            	cpl	a
1900  01c7 c450c3        	and	a,20675
1901  01ca c750c3        	ld	20675,a
1902  01cd 206a          	jra	L3101
1903  01cf               L5001:
1904                     ; 467   else if (reg == 0x10)
1906  01cf 7b01          	ld	a,(OFST+0,sp)
1907  01d1 a110          	cp	a,#16
1908  01d3 2633          	jrne	L5101
1909                     ; 469     if (NewState != DISABLE)
1911  01d5 0d03          	tnz	(OFST+2,sp)
1912  01d7 2717          	jreq	L7101
1913                     ; 472       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1915  01d9 7b02          	ld	a,(OFST+1,sp)
1916  01db a40f          	and	a,#15
1917  01dd 5f            	clrw	x
1918  01de 97            	ld	xl,a
1919  01df a601          	ld	a,#1
1920  01e1 5d            	tnzw	x
1921  01e2 2704          	jreq	L06
1922  01e4               L26:
1923  01e4 48            	sll	a
1924  01e5 5a            	decw	x
1925  01e6 26fc          	jrne	L26
1926  01e8               L06:
1927  01e8 ca50c4        	or	a,20676
1928  01eb c750c4        	ld	20676,a
1930  01ee 2049          	jra	L3101
1931  01f0               L7101:
1932                     ; 477       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1934  01f0 7b02          	ld	a,(OFST+1,sp)
1935  01f2 a40f          	and	a,#15
1936  01f4 5f            	clrw	x
1937  01f5 97            	ld	xl,a
1938  01f6 a601          	ld	a,#1
1939  01f8 5d            	tnzw	x
1940  01f9 2704          	jreq	L46
1941  01fb               L66:
1942  01fb 48            	sll	a
1943  01fc 5a            	decw	x
1944  01fd 26fc          	jrne	L66
1945  01ff               L46:
1946  01ff 43            	cpl	a
1947  0200 c450c4        	and	a,20676
1948  0203 c750c4        	ld	20676,a
1949  0206 2031          	jra	L3101
1950  0208               L5101:
1951                     ; 482     if (NewState != DISABLE)
1953  0208 0d03          	tnz	(OFST+2,sp)
1954  020a 2717          	jreq	L5201
1955                     ; 485       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1957  020c 7b02          	ld	a,(OFST+1,sp)
1958  020e a40f          	and	a,#15
1959  0210 5f            	clrw	x
1960  0211 97            	ld	xl,a
1961  0212 a601          	ld	a,#1
1962  0214 5d            	tnzw	x
1963  0215 2704          	jreq	L07
1964  0217               L27:
1965  0217 48            	sll	a
1966  0218 5a            	decw	x
1967  0219 26fc          	jrne	L27
1968  021b               L07:
1969  021b ca50d0        	or	a,20688
1970  021e c750d0        	ld	20688,a
1972  0221 2016          	jra	L3101
1973  0223               L5201:
1974                     ; 490       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1976  0223 7b02          	ld	a,(OFST+1,sp)
1977  0225 a40f          	and	a,#15
1978  0227 5f            	clrw	x
1979  0228 97            	ld	xl,a
1980  0229 a601          	ld	a,#1
1981  022b 5d            	tnzw	x
1982  022c 2704          	jreq	L47
1983  022e               L67:
1984  022e 48            	sll	a
1985  022f 5a            	decw	x
1986  0230 26fc          	jrne	L67
1987  0232               L47:
1988  0232 43            	cpl	a
1989  0233 c450d0        	and	a,20688
1990  0236 c750d0        	ld	20688,a
1991  0239               L3101:
1992                     ; 493 }
1995  0239 5b03          	addw	sp,#3
1996  023b 81            	ret
2071                     ; 503 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
2071                     ; 504 {
2072                     	switch	.text
2073  023c               _CLK_HaltConfig:
2075  023c 89            	pushw	x
2076       00000000      OFST:	set	0
2079                     ; 506   assert_param(IS_CLK_HALT(CLK_Halt));
2081                     ; 507   assert_param(IS_FUNCTIONAL_STATE(NewState));
2083                     ; 509   if (NewState != DISABLE)
2085  023d 9f            	ld	a,xl
2086  023e 4d            	tnz	a
2087  023f 2709          	jreq	L5601
2088                     ; 511     CLK->ICKCR |= (uint8_t)(CLK_Halt);
2090  0241 9e            	ld	a,xh
2091  0242 ca50c2        	or	a,20674
2092  0245 c750c2        	ld	20674,a
2094  0248 2009          	jra	L7601
2095  024a               L5601:
2096                     ; 515     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
2098  024a 7b01          	ld	a,(OFST+1,sp)
2099  024c 43            	cpl	a
2100  024d c450c2        	and	a,20674
2101  0250 c750c2        	ld	20674,a
2102  0253               L7601:
2103                     ; 517 }
2106  0253 85            	popw	x
2107  0254 81            	ret
2143                     ; 527 void CLK_MainRegulatorCmd(FunctionalState NewState)
2143                     ; 528 {
2144                     	switch	.text
2145  0255               _CLK_MainRegulatorCmd:
2149                     ; 530   assert_param(IS_FUNCTIONAL_STATE(NewState));
2151                     ; 532   if (NewState != DISABLE)
2153  0255 4d            	tnz	a
2154  0256 2706          	jreq	L7011
2155                     ; 535     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2157  0258 721350cf      	bres	20687,#1
2159  025c 2004          	jra	L1111
2160  025e               L7011:
2161                     ; 540     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2163  025e 721250cf      	bset	20687,#1
2164  0262               L1111:
2165                     ; 542 }
2168  0262 81            	ret
2391                     ; 549 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2391                     ; 550 {
2392                     	switch	.text
2393  0263               _CLK_GetFlagStatus:
2395  0263 88            	push	a
2396  0264 89            	pushw	x
2397       00000002      OFST:	set	2
2400                     ; 551   uint8_t reg = 0;
2402                     ; 552   uint8_t pos = 0;
2404                     ; 553   FlagStatus bitstatus = RESET;
2406                     ; 556   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2408                     ; 559   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2410  0265 a4f0          	and	a,#240
2411  0267 6b02          	ld	(OFST+0,sp),a
2413                     ; 562   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2415  0269 7b03          	ld	a,(OFST+1,sp)
2416  026b a40f          	and	a,#15
2417  026d 6b01          	ld	(OFST-1,sp),a
2419                     ; 564   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2421  026f 0d02          	tnz	(OFST+0,sp)
2422  0271 2607          	jrne	L7221
2423                     ; 566     reg = CLK->CRTCR;
2425  0273 c650c1        	ld	a,20673
2426  0276 6b02          	ld	(OFST+0,sp),a
2429  0278 2060          	jra	L1321
2430  027a               L7221:
2431                     ; 568   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2433  027a 7b02          	ld	a,(OFST+0,sp)
2434  027c a110          	cp	a,#16
2435  027e 2607          	jrne	L3321
2436                     ; 570     reg = CLK->ICKCR;
2438  0280 c650c2        	ld	a,20674
2439  0283 6b02          	ld	(OFST+0,sp),a
2442  0285 2053          	jra	L1321
2443  0287               L3321:
2444                     ; 572   else if (reg == 0x20) /* The flag to check is in CCOR register */
2446  0287 7b02          	ld	a,(OFST+0,sp)
2447  0289 a120          	cp	a,#32
2448  028b 2607          	jrne	L7321
2449                     ; 574     reg = CLK->CCOR;
2451  028d c650c5        	ld	a,20677
2452  0290 6b02          	ld	(OFST+0,sp),a
2455  0292 2046          	jra	L1321
2456  0294               L7321:
2457                     ; 576   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2459  0294 7b02          	ld	a,(OFST+0,sp)
2460  0296 a130          	cp	a,#48
2461  0298 2607          	jrne	L3421
2462                     ; 578     reg = CLK->ECKCR;
2464  029a c650c6        	ld	a,20678
2465  029d 6b02          	ld	(OFST+0,sp),a
2468  029f 2039          	jra	L1321
2469  02a1               L3421:
2470                     ; 580   else if (reg == 0x40) /* The flag to check is in SWCR register */
2472  02a1 7b02          	ld	a,(OFST+0,sp)
2473  02a3 a140          	cp	a,#64
2474  02a5 2607          	jrne	L7421
2475                     ; 582     reg = CLK->SWCR;
2477  02a7 c650c9        	ld	a,20681
2478  02aa 6b02          	ld	(OFST+0,sp),a
2481  02ac 202c          	jra	L1321
2482  02ae               L7421:
2483                     ; 584   else if (reg == 0x50) /* The flag to check is in CSSR register */
2485  02ae 7b02          	ld	a,(OFST+0,sp)
2486  02b0 a150          	cp	a,#80
2487  02b2 2607          	jrne	L3521
2488                     ; 586     reg = CLK->CSSR;
2490  02b4 c650ca        	ld	a,20682
2491  02b7 6b02          	ld	(OFST+0,sp),a
2494  02b9 201f          	jra	L1321
2495  02bb               L3521:
2496                     ; 588   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2498  02bb 7b02          	ld	a,(OFST+0,sp)
2499  02bd a170          	cp	a,#112
2500  02bf 2607          	jrne	L7521
2501                     ; 590     reg = CLK->REGCSR;
2503  02c1 c650cf        	ld	a,20687
2504  02c4 6b02          	ld	(OFST+0,sp),a
2507  02c6 2012          	jra	L1321
2508  02c8               L7521:
2509                     ; 592   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2511  02c8 7b02          	ld	a,(OFST+0,sp)
2512  02ca a180          	cp	a,#128
2513  02cc 2607          	jrne	L3621
2514                     ; 594     reg = CSSLSE->CSR;
2516  02ce c65190        	ld	a,20880
2517  02d1 6b02          	ld	(OFST+0,sp),a
2520  02d3 2005          	jra	L1321
2521  02d5               L3621:
2522                     ; 598     reg = CLK->CBEEPR;
2524  02d5 c650cb        	ld	a,20683
2525  02d8 6b02          	ld	(OFST+0,sp),a
2527  02da               L1321:
2528                     ; 602   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2530  02da 7b01          	ld	a,(OFST-1,sp)
2531  02dc 5f            	clrw	x
2532  02dd 97            	ld	xl,a
2533  02de a601          	ld	a,#1
2534  02e0 5d            	tnzw	x
2535  02e1 2704          	jreq	L601
2536  02e3               L011:
2537  02e3 48            	sll	a
2538  02e4 5a            	decw	x
2539  02e5 26fc          	jrne	L011
2540  02e7               L601:
2541  02e7 1402          	and	a,(OFST+0,sp)
2542  02e9 2706          	jreq	L7621
2543                     ; 604     bitstatus = SET;
2545  02eb a601          	ld	a,#1
2546  02ed 6b02          	ld	(OFST+0,sp),a
2549  02ef 2002          	jra	L1721
2550  02f1               L7621:
2551                     ; 608     bitstatus = RESET;
2553  02f1 0f02          	clr	(OFST+0,sp)
2555  02f3               L1721:
2556                     ; 612   return((FlagStatus)bitstatus);
2558  02f3 7b02          	ld	a,(OFST+0,sp)
2561  02f5 5b03          	addw	sp,#3
2562  02f7 81            	ret
2585                     ; 620 void CLK_ClearFlag(void)
2585                     ; 621 {
2586                     	switch	.text
2587  02f8               _CLK_ClearFlag:
2591                     ; 624   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2593  02f8 72175190      	bres	20880,#3
2594                     ; 625 }
2597  02fc 81            	ret
2643                     ; 633 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2643                     ; 634 {
2644                     	switch	.text
2645  02fd               _CLK_GetITStatus:
2647  02fd 88            	push	a
2648  02fe 88            	push	a
2649       00000001      OFST:	set	1
2652                     ; 636   ITStatus bitstatus = RESET;
2654                     ; 639   assert_param(IS_CLK_IT(CLK_IT));
2656                     ; 641   if (CLK_IT == CLK_IT_SWIF)
2658  02ff a11c          	cp	a,#28
2659  0301 2611          	jrne	L5231
2660                     ; 644     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2662  0303 c450c9        	and	a,20681
2663  0306 a10c          	cp	a,#12
2664  0308 2606          	jrne	L7231
2665                     ; 646       bitstatus = SET;
2667  030a a601          	ld	a,#1
2668  030c 6b01          	ld	(OFST+0,sp),a
2671  030e 202e          	jra	L3331
2672  0310               L7231:
2673                     ; 650       bitstatus = RESET;
2675  0310 0f01          	clr	(OFST+0,sp)
2677  0312 202a          	jra	L3331
2678  0314               L5231:
2679                     ; 653   else if (CLK_IT == CLK_IT_LSECSSF)
2681  0314 7b02          	ld	a,(OFST+1,sp)
2682  0316 a12c          	cp	a,#44
2683  0318 2613          	jrne	L5331
2684                     ; 656     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2686  031a c65190        	ld	a,20880
2687  031d 1402          	and	a,(OFST+1,sp)
2688  031f a10c          	cp	a,#12
2689  0321 2606          	jrne	L7331
2690                     ; 658       bitstatus = SET;
2692  0323 a601          	ld	a,#1
2693  0325 6b01          	ld	(OFST+0,sp),a
2696  0327 2015          	jra	L3331
2697  0329               L7331:
2698                     ; 662       bitstatus = RESET;
2700  0329 0f01          	clr	(OFST+0,sp)
2702  032b 2011          	jra	L3331
2703  032d               L5331:
2704                     ; 668     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2706  032d c650ca        	ld	a,20682
2707  0330 1402          	and	a,(OFST+1,sp)
2708  0332 a10c          	cp	a,#12
2709  0334 2606          	jrne	L5431
2710                     ; 670       bitstatus = SET;
2712  0336 a601          	ld	a,#1
2713  0338 6b01          	ld	(OFST+0,sp),a
2716  033a 2002          	jra	L3331
2717  033c               L5431:
2718                     ; 674       bitstatus = RESET;
2720  033c 0f01          	clr	(OFST+0,sp)
2722  033e               L3331:
2723                     ; 679   return bitstatus;
2725  033e 7b01          	ld	a,(OFST+0,sp)
2728  0340 85            	popw	x
2729  0341 81            	ret
2765                     ; 689 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2765                     ; 690 {
2766                     	switch	.text
2767  0342               _CLK_ClearITPendingBit:
2771                     ; 693   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2773                     ; 695   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2775  0342 a4f0          	and	a,#240
2776  0344 a120          	cp	a,#32
2777  0346 2606          	jrne	L7631
2778                     ; 698     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2780  0348 72175190      	bres	20880,#3
2782  034c 2004          	jra	L1731
2783  034e               L7631:
2784                     ; 703     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2786  034e 721750c9      	bres	20681,#3
2787  0352               L1731:
2788                     ; 705 }
2791  0352 81            	ret
2815                     ; 713 void CLK_LSEClockSecuritySystemEnable(void)
2815                     ; 714 {
2816                     	switch	.text
2817  0353               _CLK_LSEClockSecuritySystemEnable:
2821                     ; 716   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
2823  0353 72105190      	bset	20880,#0
2824                     ; 717 }
2827  0357 81            	ret
2851                     ; 725 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
2851                     ; 726 {
2852                     	switch	.text
2853  0358               _CLK_RTCCLKSwitchOnLSEFailureEnable:
2857                     ; 728   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
2859  0358 72125190      	bset	20880,#1
2860                     ; 729 }
2863  035c 81            	ret
2888                     	xdef	_SYSDivFactor
2889                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2890                     	xdef	_CLK_LSEClockSecuritySystemEnable
2891                     	xdef	_CLK_ClearITPendingBit
2892                     	xdef	_CLK_GetITStatus
2893                     	xdef	_CLK_ClearFlag
2894                     	xdef	_CLK_GetFlagStatus
2895                     	xdef	_CLK_MainRegulatorCmd
2896                     	xdef	_CLK_HaltConfig
2897                     	xdef	_CLK_PeripheralClockConfig
2898                     	xdef	_CLK_BEEPClockConfig
2899                     	xdef	_CLK_RTCClockConfig
2900                     	xdef	_CLK_CCOConfig
2901                     	xdef	_CLK_ITConfig
2902                     	xdef	_CLK_GetClockFreq
2903                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2904                     	xdef	_CLK_ClockSecuritySystemEnable
2905                     	xdef	_CLK_GetSYSCLKSource
2906                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2907                     	xdef	_CLK_SYSCLKDivConfig
2908                     	xdef	_CLK_SYSCLKSourceConfig
2909                     	xdef	_CLK_LSEConfig
2910                     	xdef	_CLK_HSEConfig
2911                     	xdef	_CLK_LSICmd
2912                     	xdef	_CLK_AdjustHSICalibrationValue
2913                     	xdef	_CLK_HSICmd
2914                     	xdef	_CLK_DeInit
2915                     	xref.b	c_lreg
2916                     	xref.b	c_x
2935                     	xref	c_ludv
2936                     	xref	c_rtol
2937                     	xref	c_ltor
2938                     	end
