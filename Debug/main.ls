   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  15                     	bsct
  16  0000               _cnt:
  17  0000 0000          	dc.w	0
  18  0002               _alarmmm:
  19  0002 0000          	dc.w	0
  20  0004               _AlarmOccurred:
  21  0004 00            	dc.b	0
  22  0005               _GerCont1:
  23  0005 00            	dc.b	0
  92                     ; 58 void main(void)
  92                     ; 59 { 
  94                     	switch	.text
  95  0000               _main:
  97  0000 88            	push	a
  98       00000001      OFST:	set	1
 101                     ; 61 uint8_t index = 0;
 103                     ; 63    CLK_LSEConfig(CLK_LSE_ON);
 105  0001 a604          	ld	a,#4
 106  0003 cd0000        	call	_CLK_LSEConfig
 109  0006               L13:
 110                     ; 65    while (CLK_GetFlagStatus(CLK_FLAG_LSERDY) == RESET);
 112  0006 a633          	ld	a,#51
 113  0008 cd0000        	call	_CLK_GetFlagStatus
 115  000b 4d            	tnz	a
 116  000c 27f8          	jreq	L13
 117                     ; 67    LSE_StabTime();
 119  000e cd021b        	call	_LSE_StabTime
 121                     ; 69    CLK_RTCClockConfig(CLK_RTCCLKSource_LSE, CLK_RTCCLKDiv_1);
 123  0011 ae1000        	ldw	x,#4096
 124  0014 cd0000        	call	_CLK_RTCClockConfig
 126                     ; 70     CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
 128  0017 ae1201        	ldw	x,#4609
 129  001a cd0000        	call	_CLK_PeripheralClockConfig
 131                     ; 71 		Calendar_Init();
 133  001d cd0249        	call	_Calendar_Init
 135                     ; 73   LCD_GLASS_Init(); LCD_GLASS_Clear();
 137  0020 cd0000        	call	_LCD_GLASS_Init
 141  0023 cd0000        	call	_LCD_GLASS_Clear
 143                     ; 78  EXTI->CR3 |= 0x00;
 145  0026 c650a2        	ld	a,20642
 146                     ; 79   EXTI->CR2 = 0x00; 
 148  0029 725f50a1      	clr	20641
 149                     ; 81   GPIO_Init( BUTTON_GPIO_PORT, USER_GPIO_PIN, GPIO_Mode_In_FL_IT);
 151  002d 4b20          	push	#32
 152  002f 4b02          	push	#2
 153  0031 ae500a        	ldw	x,#20490
 154  0034 cd0000        	call	_GPIO_Init
 156  0037 85            	popw	x
 157                     ; 83 	GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_In_FL_IT);
 159  0038 4b20          	push	#32
 160  003a 4b01          	push	#1
 161  003c ae500a        	ldw	x,#20490
 162  003f cd0000        	call	_GPIO_Init
 164  0042 85            	popw	x
 165                     ; 84 	EXTI->CR3 |= 0x11; //”станавливаем 1 и 2 бит в PBIS -  прерывание по любому фронту
 167  0043 c650a2        	ld	a,20642
 168  0046 aa11          	or	a,#17
 169  0048 c750a2        	ld	20642,a
 170                     ; 89   GPIO_Init( LED_GREEN_PORT, LED_GREEN_PIN, GPIO_Mode_Out_PP_High_Fast); GPIO_LOW(LED_GREEN_PORT,LED_GREEN_PIN);	
 172  004b 4bf0          	push	#240
 173  004d 4b80          	push	#128
 174  004f ae5014        	ldw	x,#20500
 175  0052 cd0000        	call	_GPIO_Init
 177  0055 85            	popw	x
 180  0056 721f5014      	bres	20500,#7
 181                     ; 91   GPIO_Init( LED_BLUE_PORT, LED_BLUE_PIN, GPIO_Mode_Out_PP_High_Fast);GPIO_LOW(LED_BLUE_PORT,LED_BLUE_PIN);		
 183  005a 4bf0          	push	#240
 184  005c 4b80          	push	#128
 185  005e ae500a        	ldw	x,#20490
 186  0061 cd0000        	call	_GPIO_Init
 188  0064 85            	popw	x
 191  0065 721f500a      	bres	20490,#7
 192                     ; 95   GPIO_Init( CTN_GPIO_PORT, CTN_CNTEN_GPIO_PIN, GPIO_Mode_Out_OD_HiZ_Slow);
 194  0069 4b90          	push	#144
 195  006b 4b10          	push	#16
 196  006d ae500a        	ldw	x,#20490
 197  0070 cd0000        	call	_GPIO_Init
 199  0073 85            	popw	x
 200                     ; 100   GPIO_Init( WAKEUP_GPIO_PORT, ICC_WAKEUP_GPIO_PIN, GPIO_Mode_In_FL_IT);
 202  0074 4b20          	push	#32
 203  0076 4b40          	push	#64
 204  0078 ae5014        	ldw	x,#20500
 205  007b cd0000        	call	_GPIO_Init
 207  007e 85            	popw	x
 208                     ; 103   EXTI->CR2 = 0x10; 	
 210  007f 351050a1      	mov	20641,#16
 211                     ; 108   CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 213  0083 ae1001        	ldw	x,#4097
 214  0086 cd0000        	call	_CLK_PeripheralClockConfig
 216                     ; 111   ADC_Icc_Init();
 218  0089 cd0000        	call	_ADC_Icc_Init
 220                     ; 114   Vref_measure();
 222  008c cd0000        	call	_Vref_measure
 224                     ; 117   Auto_test = FALSE;
 226  008f 3f00          	clr	_Auto_test
 227                     ; 120   KeyPressed = FALSE;
 229  0091 3f00          	clr	_KeyPressed
 231  0093 2003          	jra	L14
 232  0095               L53:
 233                     ; 127     Bias_measurement(); //  --> измер€ем ток камн€ и пишем его в пам€ть
 235  0095 cd0000        	call	_Bias_measurement
 237  0098               L14:
 238                     ; 125   while ((GPIOC->IDR & USER_GPIO_PIN) == 0x0) // будет активаци€ передатчика при включении - вариант сервисного режима
 240  0098 c6500b        	ld	a,20491
 241  009b a502          	bcp	a,#2
 242  009d 27f6          	jreq	L53
 243                     ; 135   state_machine = STATE_VREF;  //  готовимс€ помер€ть батарейку
 245  009f 3f13          	clr	_state_machine
 246                     ; 136   LCD_GLASS_DisplayString("BATT:");
 248  00a1 ae0017        	ldw	x,#L54
 249  00a4 cd0000        	call	_LCD_GLASS_DisplayString
 251                     ; 137 	delay_ms(100);
 253  00a7 ae0064        	ldw	x,#100
 254  00aa cd0000        	call	_delay_ms
 256                     ; 138 	Vref_measure();//  мер€ем батарейку и выводим значение на экран
 258  00ad cd0000        	call	_Vref_measure
 260                     ; 139 	delay_ms(200);
 262  00b0 ae00c8        	ldw	x,#200
 263  00b3 cd0000        	call	_delay_ms
 265                     ; 140 	LCD_GLASS_DisplayString("COUNT:");
 267  00b6 ae0010        	ldw	x,#L74
 268  00b9 cd0000        	call	_LCD_GLASS_DisplayString
 270                     ; 141 	delay_ms(100);
 272  00bc ae0064        	ldw	x,#100
 273  00bf cd0000        	call	_delay_ms
 275                     ; 142 	cnt ++; // собсно счЄтчик нажатий :)
 277  00c2 be00          	ldw	x,_cnt
 278  00c4 1c0001        	addw	x,#1
 279  00c7 bf00          	ldw	_cnt,x
 280                     ; 143 		display_temp(); // счЄчик на экран
 282  00c9 ad4d          	call	_display_temp
 284                     ; 144 		delay_ms(200);
 286  00cb ae00c8        	ldw	x,#200
 287  00ce cd0000        	call	_delay_ms
 289                     ; 145   KeyPressed = FALSE;	
 291  00d1 3f00          	clr	_KeyPressed
 292                     ; 146 	LCD_GLASS_Clear();
 294  00d3 cd0000        	call	_LCD_GLASS_Clear
 296                     ; 150 			enableInterrupts(); // теперь можно дЄргать за ноги :)
 299  00d6 9a            rim
 301                     ; 152 		wfi();  // будь готов проснутьс€! по любому событию
 305  00d7 8f            wfi
 307                     ; 153 			halt(); // —ѕјјјјј“ь!
 311  00d8 8e            halt
 313  00d9               L15:
 314                     ; 157 		disableInterrupts();	
 317  00d9 9b            sim
 319                     ; 161 	if (GerCont1 == TRUE)
 322  00da b605          	ld	a,_GerCont1
 323  00dc a101          	cp	a,#1
 324  00de 2605          	jrne	L55
 325                     ; 163 GerCont1 = FALSE;
 327  00e0 3f05          	clr	_GerCont1
 328                     ; 164  Show_Counter(); // показать на LCD только счЄтчик
 330  00e2 cd03cc        	call	_Show_Counter
 332  00e5               L55:
 333                     ; 167 		   if (KeyPressed == TRUE) //  если кнопка, то показать и батарейку
 335  00e5 b600          	ld	a,_KeyPressed
 336  00e7 a101          	cp	a,#1
 337  00e9 261b          	jrne	L75
 338                     ; 169 				  LCD_GLASS_Clear(); 
 340  00eb cd0000        	call	_LCD_GLASS_Clear
 342                     ; 170 					LCD_GLASS_DisplayString("BATT:");
 344  00ee ae0017        	ldw	x,#L54
 345  00f1 cd0000        	call	_LCD_GLASS_DisplayString
 347                     ; 171 	delay_ms(100);
 349  00f4 ae0064        	ldw	x,#100
 350  00f7 cd0000        	call	_delay_ms
 352                     ; 172 	Vref_measure();
 354  00fa cd0000        	call	_Vref_measure
 356                     ; 173 	delay_ms(100);
 358  00fd ae0064        	ldw	x,#100
 359  0100 cd0000        	call	_delay_ms
 361                     ; 174 	LCD_GLASS_Clear();
 363  0103 cd0000        	call	_LCD_GLASS_Clear
 365  0106               L75:
 366                     ; 177 	     if (AlarmOccurred == TRUE) alarm_next_set(); 
 368  0106 b604          	ld	a,_AlarmOccurred
 369  0108 a101          	cp	a,#1
 370  010a 2603          	jrne	L16
 373  010c cd0344        	call	_alarm_next_set
 375  010f               L16:
 376                     ; 181 	enableInterrupts(); // оп€ть прерывани€ нужны
 379  010f 9a            rim
 381                     ; 182   	LCD_GLASS_Clear();
 384  0110 cd0000        	call	_LCD_GLASS_Clear
 386                     ; 183 			KeyPressed = FALSE;		
 388  0113 3f00          	clr	_KeyPressed
 389                     ; 184 			 halt();
 392  0115 8e            halt
 396  0116 20c1          	jra	L15
 453                     .const:	section	.text
 454  0000               L01:
 455  0000 00002710      	dc.l	10000
 456  0004               L21:
 457  0004 000003e8      	dc.l	1000
 458  0008               L41:
 459  0008 00000064      	dc.l	100
 460  000c               L61:
 461  000c 0000000a      	dc.l	10
 462                     ; 189 void display_temp(void)  // формирование и вывод  последовательности символов на дисплей из значений счЄтчика
 462                     ; 190 {
 463                     	switch	.text
 464  0118               _display_temp:
 466  0118 5214          	subw	sp,#20
 467       00000014      OFST:	set	20
 470                     ; 195 		Nbre1Tmp = cnt;
 472  011a be00          	ldw	x,_cnt
 473  011c cd0000        	call	c_itolx
 475  011f 96            	ldw	x,sp
 476  0120 1c0011        	addw	x,#OFST-3
 477  0123 cd0000        	call	c_rtol
 480                     ; 196 		Nbre2Tmp = cnt / 10000;
 482  0126 be00          	ldw	x,_cnt
 483  0128 90ae2710      	ldw	y,#10000
 484  012c cd0000        	call	c_idiv
 486  012f cd0000        	call	c_itolx
 488  0132 96            	ldw	x,sp
 489  0133 1c000d        	addw	x,#OFST-7
 490  0136 cd0000        	call	c_rtol
 493                     ; 197     display_array[0] = Nbre2Tmp + 0x30;
 495  0139 1e0f          	ldw	x,(OFST-5,sp)
 496  013b 1c0030        	addw	x,#48
 497  013e 1f01          	ldw	(OFST-19,sp),x
 499                     ; 199 		Nbre1Tmp = Nbre1Tmp - (Nbre2Tmp * 10000);
 501  0140 96            	ldw	x,sp
 502  0141 1c000d        	addw	x,#OFST-7
 503  0144 cd0000        	call	c_ltor
 505  0147 ae0000        	ldw	x,#L01
 506  014a cd0000        	call	c_lmul
 508  014d 96            	ldw	x,sp
 509  014e 1c0011        	addw	x,#OFST-3
 510  0151 cd0000        	call	c_lgsub
 513                     ; 200     Nbre2Tmp = Nbre1Tmp / 1000;
 515  0154 96            	ldw	x,sp
 516  0155 1c0011        	addw	x,#OFST-3
 517  0158 cd0000        	call	c_ltor
 519  015b ae0004        	ldw	x,#L21
 520  015e cd0000        	call	c_ludv
 522  0161 96            	ldw	x,sp
 523  0162 1c000d        	addw	x,#OFST-7
 524  0165 cd0000        	call	c_rtol
 527                     ; 201     display_array[1] = Nbre2Tmp + 0x30;
 529  0168 1e0f          	ldw	x,(OFST-5,sp)
 530  016a 1c0030        	addw	x,#48
 531  016d 1f03          	ldw	(OFST-17,sp),x
 533                     ; 203 		Nbre1Tmp = Nbre1Tmp - (Nbre2Tmp * 1000);
 535  016f 96            	ldw	x,sp
 536  0170 1c000d        	addw	x,#OFST-7
 537  0173 cd0000        	call	c_ltor
 539  0176 ae0004        	ldw	x,#L21
 540  0179 cd0000        	call	c_lmul
 542  017c 96            	ldw	x,sp
 543  017d 1c0011        	addw	x,#OFST-3
 544  0180 cd0000        	call	c_lgsub
 547                     ; 204     Nbre2Tmp = Nbre1Tmp / 100;
 549  0183 96            	ldw	x,sp
 550  0184 1c0011        	addw	x,#OFST-3
 551  0187 cd0000        	call	c_ltor
 553  018a ae0008        	ldw	x,#L41
 554  018d cd0000        	call	c_ludv
 556  0190 96            	ldw	x,sp
 557  0191 1c000d        	addw	x,#OFST-7
 558  0194 cd0000        	call	c_rtol
 561                     ; 205     display_array[2] = Nbre2Tmp + 0x30;
 563  0197 1e0f          	ldw	x,(OFST-5,sp)
 564  0199 1c0030        	addw	x,#48
 565  019c 1f05          	ldw	(OFST-15,sp),x
 567                     ; 207 		Nbre1Tmp = Nbre1Tmp - (Nbre2Tmp * 100);
 569  019e 96            	ldw	x,sp
 570  019f 1c000d        	addw	x,#OFST-7
 571  01a2 cd0000        	call	c_ltor
 573  01a5 a664          	ld	a,#100
 574  01a7 cd0000        	call	c_smul
 576  01aa 96            	ldw	x,sp
 577  01ab 1c0011        	addw	x,#OFST-3
 578  01ae cd0000        	call	c_lgsub
 581                     ; 208     Nbre2Tmp = Nbre1Tmp / 10;
 583  01b1 96            	ldw	x,sp
 584  01b2 1c0011        	addw	x,#OFST-3
 585  01b5 cd0000        	call	c_ltor
 587  01b8 ae000c        	ldw	x,#L61
 588  01bb cd0000        	call	c_ludv
 590  01be 96            	ldw	x,sp
 591  01bf 1c000d        	addw	x,#OFST-7
 592  01c2 cd0000        	call	c_rtol
 595                     ; 209     display_array[3] = Nbre2Tmp + 0x30;
 597  01c5 1e0f          	ldw	x,(OFST-5,sp)
 598  01c7 1c0030        	addw	x,#48
 599  01ca 1f07          	ldw	(OFST-13,sp),x
 601                     ; 211 		Nbre1Tmp = Nbre1Tmp - (Nbre2Tmp * 10);
 603  01cc 96            	ldw	x,sp
 604  01cd 1c000d        	addw	x,#OFST-7
 605  01d0 cd0000        	call	c_ltor
 607  01d3 a60a          	ld	a,#10
 608  01d5 cd0000        	call	c_smul
 610  01d8 96            	ldw	x,sp
 611  01d9 1c0011        	addw	x,#OFST-3
 612  01dc cd0000        	call	c_lgsub
 615                     ; 212     Nbre2Tmp = Nbre1Tmp;
 617  01df 1e13          	ldw	x,(OFST-1,sp)
 618  01e1 1f0f          	ldw	(OFST-5,sp),x
 619  01e3 1e11          	ldw	x,(OFST-3,sp)
 620  01e5 1f0d          	ldw	(OFST-7,sp),x
 622                     ; 213     display_array[4] = Nbre2Tmp + 0x30;
 624  01e7 1e0f          	ldw	x,(OFST-5,sp)
 625  01e9 1c0030        	addw	x,#48
 626  01ec 1f09          	ldw	(OFST-11,sp),x
 628                     ; 215     Nbre1Tmp = Nbre1Tmp - (10 * Nbre2Tmp);
 630  01ee 96            	ldw	x,sp
 631  01ef 1c000d        	addw	x,#OFST-7
 632  01f2 cd0000        	call	c_ltor
 634  01f5 a60a          	ld	a,#10
 635  01f7 cd0000        	call	c_smul
 637  01fa 96            	ldw	x,sp
 638  01fb 1c0011        	addw	x,#OFST-3
 639  01fe cd0000        	call	c_lgsub
 642                     ; 216     display_array[5] = Nbre1Tmp + 0x30;
 644  0201 1e13          	ldw	x,(OFST-1,sp)
 645  0203 1c0030        	addw	x,#48
 646  0206 1f0b          	ldw	(OFST-9,sp),x
 648                     ; 219 		LCD_GLASS_DisplayStrDeci(display_array);  delay_ms(100); LCD_GLASS_Clear();// вывод собсно
 650  0208 96            	ldw	x,sp
 651  0209 1c0001        	addw	x,#OFST-19
 652  020c cd0000        	call	_LCD_GLASS_DisplayStrDeci
 656  020f ae0064        	ldw	x,#100
 657  0212 cd0000        	call	_delay_ms
 661  0215 cd0000        	call	_LCD_GLASS_Clear
 663                     ; 221 }
 666  0218 5b14          	addw	sp,#20
 667  021a 81            	ret
 695                     ; 224 void LSE_StabTime(void)
 695                     ; 225  {
 696                     	switch	.text
 697  021b               _LSE_StabTime:
 701                     ; 227    CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 703  021b ae0201        	ldw	x,#513
 704  021e cd0000        	call	_CLK_PeripheralClockConfig
 706                     ; 230    TIM4_TimeBaseInit(TIM4_Prescaler_16384, 123);
 708  0221 ae0e7b        	ldw	x,#3707
 709  0224 cd0000        	call	_TIM4_TimeBaseInit
 711                     ; 232    TIM4_ClearFlag(TIM4_FLAG_Update);
 713  0227 a601          	ld	a,#1
 714  0229 cd0000        	call	_TIM4_ClearFlag
 716                     ; 235    TIM4_Cmd(ENABLE);
 718  022c a601          	ld	a,#1
 719  022e cd0000        	call	_TIM4_Cmd
 722  0231               L321:
 723                     ; 238    while ( TIM4_GetFlagStatus(TIM4_FLAG_Update) == RESET );
 725  0231 a601          	ld	a,#1
 726  0233 cd0000        	call	_TIM4_GetFlagStatus
 728  0236 4d            	tnz	a
 729  0237 27f8          	jreq	L321
 730                     ; 240    TIM4_ClearFlag(TIM4_FLAG_Update);
 732  0239 a601          	ld	a,#1
 733  023b cd0000        	call	_TIM4_ClearFlag
 735                     ; 243    TIM4_Cmd(DISABLE);
 737  023e 4f            	clr	a
 738  023f cd0000        	call	_TIM4_Cmd
 740                     ; 245    CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
 742  0242 ae0200        	ldw	x,#512
 743  0245 cd0000        	call	_CLK_PeripheralClockConfig
 745                     ; 246  }
 748  0248 81            	ret
 785                     ; 248  void Calendar_Init(void)
 785                     ; 249  {
 786                     	switch	.text
 787  0249               _Calendar_Init:
 791                     ; 250 	 alarmmm = 01;
 793  0249 ae0001        	ldw	x,#1
 794  024c bf02          	ldw	_alarmmm,x
 795                     ; 251    RTC_InitStr.RTC_HourFormat = RTC_HourFormat_24;
 797  024e 3f0f          	clr	_RTC_InitStr
 798                     ; 252    RTC_InitStr.RTC_AsynchPrediv = 0x7F;
 800  0250 357f0010      	mov	_RTC_InitStr+1,#127
 801                     ; 253    RTC_InitStr.RTC_SynchPrediv = 0x00FF;
 803  0254 ae00ff        	ldw	x,#255
 804  0257 bf11          	ldw	_RTC_InitStr+2,x
 805                     ; 254    RTC_Init(&RTC_InitStr);
 807  0259 ae000f        	ldw	x,#_RTC_InitStr
 808  025c cd0000        	call	_RTC_Init
 810                     ; 256    RTC_DateStructInit(&RTC_DateStr);
 812  025f ae0007        	ldw	x,#_RTC_DateStr
 813  0262 cd0000        	call	_RTC_DateStructInit
 815                     ; 257    RTC_DateStr.RTC_WeekDay = RTC_Weekday_Monday;
 817  0265 35010007      	mov	_RTC_DateStr,#1
 818                     ; 258    RTC_DateStr.RTC_Date = 20;
 820  0269 35140009      	mov	_RTC_DateStr+2,#20
 821                     ; 259    RTC_DateStr.RTC_Month = RTC_Month_September;
 823  026d 35090008      	mov	_RTC_DateStr+1,#9
 824                     ; 260    RTC_DateStr.RTC_Year = 19;
 826  0271 3513000a      	mov	_RTC_DateStr+3,#19
 827                     ; 261    RTC_SetDate(RTC_Format_BIN, &RTC_DateStr);
 829  0275 ae0007        	ldw	x,#_RTC_DateStr
 830  0278 89            	pushw	x
 831  0279 4f            	clr	a
 832  027a cd0000        	call	_RTC_SetDate
 834  027d 85            	popw	x
 835                     ; 263    RTC_TimeStructInit(&RTC_TimeStr);
 837  027e ae000b        	ldw	x,#_RTC_TimeStr
 838  0281 cd0000        	call	_RTC_TimeStructInit
 840                     ; 264    RTC_TimeStr.RTC_Hours   = 18;
 842  0284 3512000b      	mov	_RTC_TimeStr,#18
 843                     ; 265    RTC_TimeStr.RTC_Minutes = 00;
 845  0288 3f0c          	clr	_RTC_TimeStr+1
 846                     ; 266    RTC_TimeStr.RTC_Seconds = 00;
 848  028a 3f0d          	clr	_RTC_TimeStr+2
 849                     ; 267    RTC_SetTime(RTC_Format_BIN, &RTC_TimeStr);
 851  028c ae000b        	ldw	x,#_RTC_TimeStr
 852  028f 89            	pushw	x
 853  0290 4f            	clr	a
 854  0291 cd0000        	call	_RTC_SetTime
 856  0294 85            	popw	x
 857                     ; 270    RTC_AlarmStructInit(&RTC_AlarmStr);
 859  0295 ae0000        	ldw	x,#_RTC_AlarmStr
 860  0298 cd0000        	call	_RTC_AlarmStructInit
 862                     ; 271    RTC_AlarmStr.RTC_AlarmTime.RTC_Hours   = 18;
 864  029b 35120000      	mov	_RTC_AlarmStr,#18
 865                     ; 272    RTC_AlarmStr.RTC_AlarmTime.RTC_Minutes = 01;
 867  029f 35010001      	mov	_RTC_AlarmStr+1,#1
 868                     ; 273    RTC_AlarmStr.RTC_AlarmTime.RTC_Seconds = 00;
 870  02a3 3f02          	clr	_RTC_AlarmStr+2
 871                     ; 274    RTC_AlarmStr.RTC_AlarmMask = RTC_AlarmMask_DateWeekDay;
 873  02a5 35100004      	mov	_RTC_AlarmStr+4,#16
 874                     ; 275    RTC_SetAlarm(RTC_Format_BIN, &RTC_AlarmStr);
 876  02a9 ae0000        	ldw	x,#_RTC_AlarmStr
 877  02ac 89            	pushw	x
 878  02ad 4f            	clr	a
 879  02ae cd0000        	call	_RTC_SetAlarm
 881  02b1 85            	popw	x
 882                     ; 277    RTC_ITConfig(RTC_IT_ALRA, ENABLE);
 884  02b2 4b01          	push	#1
 885  02b4 ae0010        	ldw	x,#16
 886  02b7 cd0000        	call	_RTC_ITConfig
 888  02ba 84            	pop	a
 889                     ; 278    RTC_AlarmCmd(ENABLE);
 891  02bb a601          	ld	a,#1
 892  02bd cd0000        	call	_RTC_AlarmCmd
 894                     ; 279  }
 897  02c0 81            	ret
 947                     ; 281  void Time_Show()  // (uint8_t Line)
 947                     ; 282  {
 948                     	switch	.text
 949  02c1               _Time_Show:
 951  02c1 520c          	subw	sp,#12
 952       0000000c      OFST:	set	12
 955  02c3               L361:
 956                     ; 286    while (RTC_WaitForSynchro() != SUCCESS);
 958  02c3 cd0000        	call	_RTC_WaitForSynchro
 960  02c6 a101          	cp	a,#1
 961  02c8 26f9          	jrne	L361
 962                     ; 289    RTC_GetTime(RTC_Format_BCD, &RTC_TimeStr);
 964  02ca ae000b        	ldw	x,#_RTC_TimeStr
 965  02cd 89            	pushw	x
 966  02ce a601          	ld	a,#1
 967  02d0 cd0000        	call	_RTC_GetTime
 969  02d3 85            	popw	x
 970                     ; 296 	 display_array[0] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Hours & 0xF0) >> 4) + 0x30);
 972  02d4 b60b          	ld	a,_RTC_TimeStr
 973  02d6 a4f0          	and	a,#240
 974  02d8 4e            	swap	a
 975  02d9 a40f          	and	a,#15
 976  02db 5f            	clrw	x
 977  02dc 97            	ld	xl,a
 978  02dd 1c0030        	addw	x,#48
 979  02e0 9f            	ld	a,xl
 980  02e1 5f            	clrw	x
 981  02e2 97            	ld	xl,a
 982  02e3 1f01          	ldw	(OFST-11,sp),x
 984                     ; 297 	 display_array[1] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Hours & 0x0F)) + 0x30);
 986  02e5 b60b          	ld	a,_RTC_TimeStr
 987  02e7 a40f          	and	a,#15
 988  02e9 ab30          	add	a,#48
 989  02eb 5f            	clrw	x
 990  02ec 97            	ld	xl,a
 991  02ed 1f03          	ldw	(OFST-9,sp),x
 993                     ; 298 	 display_array[1] |= DOUBLE_DOT;
 995  02ef 7b03          	ld	a,(OFST-9,sp)
 996  02f1 aa40          	or	a,#64
 997  02f3 6b03          	ld	(OFST-9,sp),a
 999                     ; 299 	 display_array[2] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Minutes & 0xF0) >> 4) + 0x30);
1001  02f5 b60c          	ld	a,_RTC_TimeStr+1
1002  02f7 a4f0          	and	a,#240
1003  02f9 4e            	swap	a
1004  02fa a40f          	and	a,#15
1005  02fc 5f            	clrw	x
1006  02fd 97            	ld	xl,a
1007  02fe 1c0030        	addw	x,#48
1008  0301 9f            	ld	a,xl
1009  0302 5f            	clrw	x
1010  0303 97            	ld	xl,a
1011  0304 1f05          	ldw	(OFST-7,sp),x
1013                     ; 300 	 display_array[3] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Minutes & 0x0F)) + 0x30);
1015  0306 b60c          	ld	a,_RTC_TimeStr+1
1016  0308 a40f          	and	a,#15
1017  030a ab30          	add	a,#48
1018  030c 5f            	clrw	x
1019  030d 97            	ld	xl,a
1020  030e 1f07          	ldw	(OFST-5,sp),x
1022                     ; 301 	 display_array[3] |= DOUBLE_DOT;
1024  0310 7b07          	ld	a,(OFST-5,sp)
1025  0312 aa40          	or	a,#64
1026  0314 6b07          	ld	(OFST-5,sp),a
1028                     ; 302 	 display_array[4] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Seconds & 0xF0) >> 4) + 0x30);
1030  0316 b60d          	ld	a,_RTC_TimeStr+2
1031  0318 a4f0          	and	a,#240
1032  031a 4e            	swap	a
1033  031b a40f          	and	a,#15
1034  031d 5f            	clrw	x
1035  031e 97            	ld	xl,a
1036  031f 1c0030        	addw	x,#48
1037  0322 9f            	ld	a,xl
1038  0323 5f            	clrw	x
1039  0324 97            	ld	xl,a
1040  0325 1f09          	ldw	(OFST-3,sp),x
1042                     ; 303 	 display_array[5] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Seconds & 0x0F)) + 0x30);
1044  0327 b60d          	ld	a,_RTC_TimeStr+2
1045  0329 a40f          	and	a,#15
1046  032b ab30          	add	a,#48
1047  032d 5f            	clrw	x
1048  032e 97            	ld	xl,a
1049  032f 1f0b          	ldw	(OFST-1,sp),x
1051                     ; 305 	 LCD_GLASS_DisplayStrDeci(display_array); delay_ms(100); LCD_GLASS_Clear();
1053  0331 96            	ldw	x,sp
1054  0332 1c0001        	addw	x,#OFST-11
1055  0335 cd0000        	call	_LCD_GLASS_DisplayStrDeci
1059  0338 ae0064        	ldw	x,#100
1060  033b cd0000        	call	_delay_ms
1064  033e cd0000        	call	_LCD_GLASS_Clear
1066                     ; 320  }
1069  0341 5b0c          	addw	sp,#12
1070  0343 81            	ret
1099                     ; 322  void alarm_next_set()  // (uint8_t Line)
1099                     ; 323  {
1100                     	switch	.text
1101  0344               _alarm_next_set:
1105                     ; 324    alarmmm = alarmmm + 01;
1107  0344 be02          	ldw	x,_alarmmm
1108  0346 1c0001        	addw	x,#1
1109  0349 bf02          	ldw	_alarmmm,x
1110                     ; 325 		 if (alarmmm == 60) alarmmm = 00;
1112  034b be02          	ldw	x,_alarmmm
1113  034d a3003c        	cpw	x,#60
1114  0350 2603          	jrne	L771
1117  0352 5f            	clrw	x
1118  0353 bf02          	ldw	_alarmmm,x
1119  0355               L771:
1120                     ; 327    RTC_AlarmStr.RTC_AlarmTime.RTC_Minutes = alarmmm;
1122  0355 450301        	mov	_RTC_AlarmStr+1,_alarmmm+1
1123                     ; 329    RTC_SetAlarm(RTC_Format_BIN, &RTC_AlarmStr);
1125  0358 ae0000        	ldw	x,#_RTC_AlarmStr
1126  035b 89            	pushw	x
1127  035c 4f            	clr	a
1128  035d cd0000        	call	_RTC_SetAlarm
1130  0360 85            	popw	x
1131                     ; 330 	  RTC_ITConfig(RTC_IT_ALRA, ENABLE); RTC_AlarmCmd(ENABLE);
1133  0361 4b01          	push	#1
1134  0363 ae0010        	ldw	x,#16
1135  0366 cd0000        	call	_RTC_ITConfig
1137  0369 84            	pop	a
1140  036a a601          	ld	a,#1
1141  036c cd0000        	call	_RTC_AlarmCmd
1143                     ; 335 		AlarmOccurred = FALSE;
1145  036f 3f04          	clr	_AlarmOccurred
1146                     ; 338  }
1149  0371 81            	ret
1178                     ; 340  void Alarm_Regulate(void)
1178                     ; 341  {
1179                     	switch	.text
1180  0372               _Alarm_Regulate:
1184                     ; 369    RTC_AlarmStr.RTC_AlarmTime.RTC_Hours   = 01;
1186  0372 35010000      	mov	_RTC_AlarmStr,#1
1187                     ; 370    RTC_AlarmStr.RTC_AlarmTime.RTC_Minutes = 02;
1189  0376 35020001      	mov	_RTC_AlarmStr+1,#2
1190                     ; 371    RTC_AlarmStr.RTC_AlarmTime.RTC_Seconds = 00;
1192  037a 3f02          	clr	_RTC_AlarmStr+2
1193                     ; 372    RTC_SetAlarm(RTC_Format_BIN, &RTC_AlarmStr);
1195  037c ae0000        	ldw	x,#_RTC_AlarmStr
1196  037f 89            	pushw	x
1197  0380 4f            	clr	a
1198  0381 cd0000        	call	_RTC_SetAlarm
1200  0384 85            	popw	x
1201                     ; 373 	  RTC_ITConfig(RTC_IT_ALRA, ENABLE); RTC_AlarmCmd(ENABLE);
1203  0385 4b01          	push	#1
1204  0387 ae0010        	ldw	x,#16
1205  038a cd0000        	call	_RTC_ITConfig
1207  038d 84            	pop	a
1210  038e a601          	ld	a,#1
1211  0390 cd0000        	call	_RTC_AlarmCmd
1213                     ; 378 		AlarmOccurred = FALSE;
1215  0393 3f04          	clr	_AlarmOccurred
1216                     ; 380 	  GPIO_TOGGLE(LED_BLUE_PORT,LED_BLUE_PIN);delay_ms(10);	
1218  0395 901e500a      	bcpl	20490,#7
1221  0399 ae000a        	ldw	x,#10
1222  039c cd0000        	call	_delay_ms
1224                     ; 381 					GPIO_TOGGLE(LED_GREEN_PORT,LED_GREEN_PIN);delay_ms(10);
1226  039f 901e5014      	bcpl	20500,#7
1229  03a3 ae000a        	ldw	x,#10
1230  03a6 cd0000        	call	_delay_ms
1232                     ; 382 					GPIO_TOGGLE(LED_GREEN_PORT,LED_GREEN_PIN);delay_ms(10);
1234  03a9 901e5014      	bcpl	20500,#7
1237  03ad ae000a        	ldw	x,#10
1238  03b0 cd0000        	call	_delay_ms
1240                     ; 383 					GPIO_TOGGLE(LED_GREEN_PORT,LED_GREEN_PIN);delay_ms(10);
1242  03b3 901e5014      	bcpl	20500,#7
1245  03b7 ae000a        	ldw	x,#10
1246  03ba cd0000        	call	_delay_ms
1248                     ; 384 					GPIO_TOGGLE(LED_GREEN_PORT,LED_GREEN_PIN);delay_ms(10);
1250  03bd 901e5014      	bcpl	20500,#7
1253  03c1 ae000a        	ldw	x,#10
1254  03c4 cd0000        	call	_delay_ms
1256                     ; 385 					GPIO_TOGGLE(LED_GREEN_PORT,LED_GREEN_PIN);
1258  03c7 901e5014      	bcpl	20500,#7
1259                     ; 387  }
1262  03cb 81            	ret
1290                     ; 389  void Show_Counter(void)
1290                     ; 390  {
1291                     	switch	.text
1292  03cc               _Show_Counter:
1296                     ; 392 	LCD_GLASS_Clear();
1298  03cc cd0000        	call	_LCD_GLASS_Clear
1300                     ; 393 	LCD_GLASS_DisplayString("COUNT:");
1302  03cf ae0010        	ldw	x,#L74
1303  03d2 cd0000        	call	_LCD_GLASS_DisplayString
1305                     ; 394 	delay_ms(100);
1307  03d5 ae0064        	ldw	x,#100
1308  03d8 cd0000        	call	_delay_ms
1310                     ; 395 	cnt ++; // собсно счЄтчик нажатий :)
1312  03db be00          	ldw	x,_cnt
1313  03dd 1c0001        	addw	x,#1
1314  03e0 bf00          	ldw	_cnt,x
1315                     ; 396 		display_temp();delay_ms(100); LCD_GLASS_Clear();
1317  03e2 cd0118        	call	_display_temp
1321  03e5 ae0064        	ldw	x,#100
1322  03e8 cd0000        	call	_delay_ms
1326  03eb cd0000        	call	_LCD_GLASS_Clear
1328                     ; 398 	 } 
1331  03ee 81            	ret
1818                     	xdef	_main
1819                     	xdef	_Show_Counter
1820                     	xdef	_alarm_next_set
1821                     	xdef	_display_temp
1822                     	switch	.ubsct
1823  0000               _RTC_AlarmStr:
1824  0000 000000000000  	ds.b	7
1825                     	xdef	_RTC_AlarmStr
1826  0007               _RTC_DateStr:
1827  0007 00000000      	ds.b	4
1828                     	xdef	_RTC_DateStr
1829  000b               _RTC_TimeStr:
1830  000b 00000000      	ds.b	4
1831                     	xdef	_RTC_TimeStr
1832  000f               _RTC_InitStr:
1833  000f 00000000      	ds.b	4
1834                     	xdef	_RTC_InitStr
1835                     	xdef	_GerCont1
1836                     	xdef	_AlarmOccurred
1837                     	xref.b	_KeyPressed
1838                     	xref.b	_Auto_test
1839                     	xdef	_alarmmm
1840                     	xdef	_cnt
1841  0013               _state_machine:
1842  0013 00            	ds.b	1
1843                     	xdef	_state_machine
1844                     	xdef	_LSE_StabTime
1845                     	xdef	_Alarm_Regulate
1846                     	xdef	_Time_Show
1847                     	xdef	_Calendar_Init
1848                     	xref	_Bias_measurement
1849                     	xref	_Vref_measure
1850                     	xref	_LCD_GLASS_Clear
1851                     	xref	_LCD_GLASS_DisplayStrDeci
1852                     	xref	_LCD_GLASS_DisplayString
1853                     	xref	_LCD_GLASS_Init
1854                     	xref	_TIM4_ClearFlag
1855                     	xref	_TIM4_GetFlagStatus
1856                     	xref	_TIM4_Cmd
1857                     	xref	_TIM4_TimeBaseInit
1858                     	xref	_RTC_AlarmCmd
1859                     	xref	_RTC_SetAlarm
1860                     	xref	_RTC_AlarmStructInit
1861                     	xref	_RTC_GetTime
1862                     	xref	_RTC_SetDate
1863                     	xref	_RTC_SetTime
1864                     	xref	_RTC_DateStructInit
1865                     	xref	_RTC_TimeStructInit
1866                     	xref	_RTC_WaitForSynchro
1867                     	xref	_RTC_ITConfig
1868                     	xref	_RTC_Init
1869                     	xref	_GPIO_Init
1870                     	xref	_CLK_GetFlagStatus
1871                     	xref	_CLK_PeripheralClockConfig
1872                     	xref	_CLK_RTCClockConfig
1873                     	xref	_CLK_LSEConfig
1874                     	xref	_delay_ms
1875                     	xref	_ADC_Icc_Init
1876                     	switch	.const
1877  0010               L74:
1878  0010 434f554e543a  	dc.b	"COUNT:",0
1879  0017               L54:
1880  0017 424154543a00  	dc.b	"BATT:",0
1881                     	xref.b	c_x
1901                     	xref	c_smul
1902                     	xref	c_ludv
1903                     	xref	c_lgsub
1904                     	xref	c_lmul
1905                     	xref	c_ltor
1906                     	xref	c_idiv
1907                     	xref	c_rtol
1908                     	xref	c_itolx
1909                     	end
