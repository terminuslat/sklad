   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  45                     ; 33 void GPIO_LowPower_Config(void)
  45                     ; 34 {
  47                     	switch	.text
  48  0000               _GPIO_LowPower_Config:
  52                     ; 37   GPIO_Init(GPIOA,GPIO_Pin_2|GPIO_Pin_3|GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7 ,GPIO_Mode_Out_PP_Low_Slow);
  54  0000 4bc0          	push	#192
  55  0002 4bfc          	push	#252
  56  0004 ae5000        	ldw	x,#20480
  57  0007 cd0000        	call	_GPIO_Init
  59  000a 85            	popw	x
  60                     ; 40   GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
  62  000b 4bc0          	push	#192
  63  000d 4bff          	push	#255
  64  000f ae5005        	ldw	x,#20485
  65  0012 cd0000        	call	_GPIO_Init
  67  0015 85            	popw	x
  68                     ; 43   GPIO_Init(GPIOC, GPIO_Pin_0|GPIO_Pin_2|GPIO_Pin_3|GPIO_Pin_5|GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Slow);
  70  0016 4bc0          	push	#192
  71  0018 4b6d          	push	#109
  72  001a ae500a        	ldw	x,#20490
  73  001d cd0000        	call	_GPIO_Init
  75  0020 85            	popw	x
  76                     ; 46   GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
  78  0021 4bc0          	push	#192
  79  0023 4bff          	push	#255
  80  0025 ae500f        	ldw	x,#20495
  81  0028 cd0000        	call	_GPIO_Init
  83  002b 85            	popw	x
  84                     ; 49   GPIO_Init(GPIOE, GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3|GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Slow);
  86  002c 4bc0          	push	#192
  87  002e 4b2f          	push	#47
  88  0030 ae5014        	ldw	x,#20500
  89  0033 cd0000        	call	_GPIO_Init
  91  0036 85            	popw	x
  92                     ; 53   GPIO_Init(GPIOF,GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3|GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7 ,GPIO_Mode_Out_PP_Low_Slow);
  94  0037 4bc0          	push	#192
  95  0039 4bee          	push	#238
  96  003b ae5019        	ldw	x,#20505
  97  003e cd0000        	call	_GPIO_Init
  99  0041 85            	popw	x
 100                     ; 55   GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_PP_High_Slow);
 102  0042 4bd0          	push	#208
 103  0044 4b02          	push	#2
 104  0046 ae500a        	ldw	x,#20490
 105  0049 cd0000        	call	_GPIO_Init
 107  004c 85            	popw	x
 108                     ; 56 }
 111  004d 81            	ret
 166                     ; 64 u16 ADC_Supply(void)
 166                     ; 65 {
 167                     	switch	.text
 168  004e               _ADC_Supply:
 170  004e 5203          	subw	sp,#3
 171       00000003      OFST:	set	3
 174                     ; 70   CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 176  0050 ae1001        	ldw	x,#4097
 177  0053 cd0000        	call	_CLK_PeripheralClockConfig
 179                     ; 73   ADC_DeInit(ADC1);
 181  0056 ae5340        	ldw	x,#21312
 182  0059 cd0000        	call	_ADC_DeInit
 184                     ; 83   ADC_VrefintCmd(ENABLE);
 186  005c a601          	ld	a,#1
 187  005e cd0000        	call	_ADC_VrefintCmd
 189                     ; 84   delay_10us(3);
 191  0061 ae0003        	ldw	x,#3
 192  0064 cd0000        	call	_delay_10us
 194                     ; 87   ADC_Cmd(ADC1, ENABLE);	 
 196  0067 4b01          	push	#1
 197  0069 ae5340        	ldw	x,#21312
 198  006c cd0000        	call	_ADC_Cmd
 200  006f 84            	pop	a
 201                     ; 88   ADC_Init(ADC1, ADC_ConversionMode_Single,
 201                     ; 89   ADC_Resolution_12Bit, ADC_Prescaler_1);
 203  0070 4b00          	push	#0
 204  0072 4b00          	push	#0
 205  0074 4b00          	push	#0
 206  0076 ae5340        	ldw	x,#21312
 207  0079 cd0000        	call	_ADC_Init
 209  007c 5b03          	addw	sp,#3
 210                     ; 91   ADC_SamplingTimeConfig(ADC1, ADC_Group_FastChannels, ADC_SamplingTime_9Cycles);
 212  007e 4b01          	push	#1
 213  0080 4b01          	push	#1
 214  0082 ae5340        	ldw	x,#21312
 215  0085 cd0000        	call	_ADC_SamplingTimeConfig
 217  0088 85            	popw	x
 218                     ; 92   ADC_ChannelCmd(ADC1, ADC_Channel_Vrefint, ENABLE);
 220  0089 4b01          	push	#1
 221  008b ae0010        	ldw	x,#16
 222  008e 89            	pushw	x
 223  008f ae5340        	ldw	x,#21312
 224  0092 cd0000        	call	_ADC_ChannelCmd
 226  0095 5b03          	addw	sp,#3
 227                     ; 93   delay_10us(3);
 229  0097 ae0003        	ldw	x,#3
 230  009a cd0000        	call	_delay_10us
 232                     ; 96   res = 0;
 234  009d 5f            	clrw	x
 235  009e 1f01          	ldw	(OFST-2,sp),x
 237                     ; 97   for(i=8; i>0; i--)
 239  00a0 a608          	ld	a,#8
 240  00a2 6b03          	ld	(OFST+0,sp),a
 242  00a4               L34:
 243                     ; 100     ADC_SoftwareStartConv(ADC1);
 245  00a4 ae5340        	ldw	x,#21312
 246  00a7 cd0000        	call	_ADC_SoftwareStartConv
 249  00aa               L35:
 250                     ; 102     while( ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == 0 );
 252  00aa 4b01          	push	#1
 253  00ac ae5340        	ldw	x,#21312
 254  00af cd0000        	call	_ADC_GetFlagStatus
 256  00b2 5b01          	addw	sp,#1
 257  00b4 4d            	tnz	a
 258  00b5 27f3          	jreq	L35
 259                     ; 104     res += ADC_GetConversionValue(ADC1);
 261  00b7 ae5340        	ldw	x,#21312
 262  00ba cd0000        	call	_ADC_GetConversionValue
 264  00bd 72fb01        	addw	x,(OFST-2,sp)
 265  00c0 1f01          	ldw	(OFST-2,sp),x
 267                     ; 97   for(i=8; i>0; i--)
 269  00c2 0a03          	dec	(OFST+0,sp)
 273  00c4 0d03          	tnz	(OFST+0,sp)
 274  00c6 26dc          	jrne	L34
 275                     ; 108   ADC_VrefintCmd(DISABLE);
 277  00c8 4f            	clr	a
 278  00c9 cd0000        	call	_ADC_VrefintCmd
 280                     ; 110   ADC_DeInit(ADC1);
 282  00cc ae5340        	ldw	x,#21312
 283  00cf cd0000        	call	_ADC_DeInit
 285                     ; 113   ADC_SchmittTriggerConfig(ADC1, ADC_Channel_24, DISABLE);
 287  00d2 4b00          	push	#0
 288  00d4 ae0001        	ldw	x,#1
 289  00d7 89            	pushw	x
 290  00d8 ae5340        	ldw	x,#21312
 291  00db cd0000        	call	_ADC_SchmittTriggerConfig
 293  00de 5b03          	addw	sp,#3
 294                     ; 115   CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 296  00e0 ae1000        	ldw	x,#4096
 297  00e3 cd0000        	call	_CLK_PeripheralClockConfig
 299                     ; 116   ADC_ChannelCmd(ADC1, ADC_Channel_Vrefint, DISABLE);
 301  00e6 4b00          	push	#0
 302  00e8 ae0010        	ldw	x,#16
 303  00eb 89            	pushw	x
 304  00ec ae5340        	ldw	x,#21312
 305  00ef cd0000        	call	_ADC_ChannelCmd
 307  00f2 5b03          	addw	sp,#3
 308                     ; 118   return (res>>3);
 310  00f4 1e01          	ldw	x,(OFST-2,sp)
 311  00f6 54            	srlw	x
 312  00f7 54            	srlw	x
 313  00f8 54            	srlw	x
 316  00f9 5b03          	addw	sp,#3
 317  00fb 81            	ret
 348                     ; 127 void ADC_Icc_Init(void)
 348                     ; 128 {
 349                     	switch	.text
 350  00fc               _ADC_Icc_Init:
 354                     ; 131   CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 356  00fc ae1001        	ldw	x,#4097
 357  00ff cd0000        	call	_CLK_PeripheralClockConfig
 359                     ; 134   ADC_DeInit(ADC1);
 361  0102 ae5340        	ldw	x,#21312
 362  0105 cd0000        	call	_ADC_DeInit
 364                     ; 144   ADC_Cmd(ADC1, ENABLE);
 366  0108 4b01          	push	#1
 367  010a ae5340        	ldw	x,#21312
 368  010d cd0000        	call	_ADC_Cmd
 370  0110 84            	pop	a
 371                     ; 145   ADC_Init(ADC1, ADC_ConversionMode_Single,ADC_Resolution_12Bit, ADC_Prescaler_1);
 373  0111 4b00          	push	#0
 374  0113 4b00          	push	#0
 375  0115 4b00          	push	#0
 376  0117 ae5340        	ldw	x,#21312
 377  011a cd0000        	call	_ADC_Init
 379  011d 5b03          	addw	sp,#3
 380                     ; 147   ADC_SamplingTimeConfig(ADC1, ADC_Group_FastChannels, ADC_SamplingTime_9Cycles);
 382  011f 4b01          	push	#1
 383  0121 4b01          	push	#1
 384  0123 ae5340        	ldw	x,#21312
 385  0126 cd0000        	call	_ADC_SamplingTimeConfig
 387  0129 85            	popw	x
 388                     ; 148   ADC_ChannelCmd(ADC1, ADC_Channel_24, ENABLE);
 390  012a 4b01          	push	#1
 391  012c ae0001        	ldw	x,#1
 392  012f 89            	pushw	x
 393  0130 ae5340        	ldw	x,#21312
 394  0133 cd0000        	call	_ADC_ChannelCmd
 396  0136 5b03          	addw	sp,#3
 397                     ; 151   ADC_SchmittTriggerConfig(ADC1, ADC_Channel_24, DISABLE);
 399  0138 4b00          	push	#0
 400  013a ae0001        	ldw	x,#1
 401  013d 89            	pushw	x
 402  013e ae5340        	ldw	x,#21312
 403  0141 cd0000        	call	_ADC_SchmittTriggerConfig
 405  0144 5b03          	addw	sp,#3
 406                     ; 154   delay_10us(3);
 408  0146 ae0003        	ldw	x,#3
 409  0149 cd0000        	call	_delay_10us
 411                     ; 156 }
 414  014c 81            	ret
 442                     ; 165 void Halt_Init(void)
 442                     ; 166 {
 443                     	switch	.text
 444  014d               _Halt_Init:
 448                     ; 169   PWR->CSR2 = 0x2;
 450  014d 350250b3      	mov	20659,#2
 451                     ; 171   LCD_Cmd(DISABLE);
 453  0151 4f            	clr	a
 454  0152 cd0000        	call	_LCD_Cmd
 457  0155               L101:
 458                     ; 174   while ((LCD->CR3 & 0x40) != 0x00);
 460  0155 c65402        	ld	a,21506
 461  0158 a540          	bcp	a,#64
 462  015a 26f9          	jrne	L101
 463                     ; 177   GPIO_LowPower_Config();
 465  015c cd0000        	call	_GPIO_LowPower_Config
 467                     ; 180   CLK_RTCClockConfig(CLK_RTCCLKSource_Off, CLK_RTCCLKDiv_1);
 469  015f 5f            	clrw	x
 470  0160 cd0000        	call	_CLK_RTCClockConfig
 472                     ; 186     CLK_LSICmd(DISABLE);
 474  0163 4f            	clr	a
 475  0164 cd0000        	call	_CLK_LSICmd
 478  0167               L701:
 479                     ; 187     while ((CLK->ICKCR & 0x04) != 0x00);
 481  0167 c650c2        	ld	a,20674
 482  016a a504          	bcp	a,#4
 483  016c 26f9          	jrne	L701
 484                     ; 191   CLK_PeripheralClockConfig(CLK_Peripheral_RTC, DISABLE);
 486  016e ae1200        	ldw	x,#4608
 487  0171 cd0000        	call	_CLK_PeripheralClockConfig
 489                     ; 192   CLK_PeripheralClockConfig(CLK_Peripheral_LCD, DISABLE);
 491  0174 ae1300        	ldw	x,#4864
 492  0177 cd0000        	call	_CLK_PeripheralClockConfig
 494                     ; 193 }
 497  017a 81            	ret
 567                     ; 202 u16 ADC_Icc_Test(u8 Mcu_State)
 567                     ; 203 {
 568                     	switch	.text
 569  017b               _ADC_Icc_Test:
 571  017b 88            	push	a
 572  017c 5203          	subw	sp,#3
 573       00000003      OFST:	set	3
 576                     ; 208   switch (Mcu_State)
 579                     ; 254       break;		
 580  017e 4a            	dec	a
 581  017f 270b          	jreq	L511
 582  0181 a002          	sub	a,#2
 583  0183 2713          	jreq	L711
 584  0185 4a            	dec	a
 585  0186 2724          	jreq	L121
 586  0188 2031          	jra	L351
 587  018a               L311:
 588                     ; 211     case MCU_RUN:
 588                     ; 212       break;
 590  018a 202f          	jra	L351
 591  018c               L511:
 592                     ; 215     case MCU_LPR:
 592                     ; 216       Halt_Init();
 594  018c adbf          	call	_Halt_Init
 596                     ; 217       sim();
 599  018e 9b            sim
 601                     ; 219       GPIO_HIGH(CTN_GPIO_PORT,CTN_CNTEN_GPIO_PIN);
 604  018f 7218500a      	bset	20490,#4
 605                     ; 222       LPR_init();
 607  0193 cd0000        	call	_LPR_init
 609                     ; 223       break;
 611  0196 2023          	jra	L351
 612  0198               L711:
 613                     ; 226     case MCU_HALT:
 613                     ; 227       /* Init for Halt mode  */
 613                     ; 228       Halt_Init();
 615  0198 adb3          	call	_Halt_Init
 617                     ; 229       sim();	
 620  019a 9b            sim
 622                     ; 232       GPIO_HIGH(CTN_GPIO_PORT,CTN_CNTEN_GPIO_PIN);
 625  019b 7218500a      	bset	20490,#4
 626                     ; 235       GPIO_LOW(CTN_GPIO_PORT,CTN_CNTEN_GPIO_PIN);
 628  019f 7219500a      	bres	20490,#4
 629                     ; 236       delay_10us(1);
 631  01a3 ae0001        	ldw	x,#1
 632  01a6 cd0000        	call	_delay_10us
 634                     ; 240       halt();
 637  01a9 8e            halt
 639                     ; 241       break;
 642  01aa 200f          	jra	L351
 643  01ac               L121:
 644                     ; 243     case MCU_LPR_LCD:
 644                     ; 244       PWR->CSR2 = 0x2;
 646  01ac 350250b3      	mov	20659,#2
 647                     ; 245       sim();
 650  01b0 9b            sim
 652                     ; 247       GPIO_LowPower_Config();
 655  01b1 cd0000        	call	_GPIO_LowPower_Config
 657                     ; 250       GPIO_HIGH(CTN_GPIO_PORT,CTN_CNTEN_GPIO_PIN);
 659  01b4 7218500a      	bset	20490,#4
 660                     ; 253       LPR_init();
 662  01b8 cd0000        	call	_LPR_init
 664                     ; 254       break;		
 666  01bb               L351:
 667                     ; 257   sim();
 670  01bb 9b            sim
 672                     ; 260   ADC_Icc_Init();	
 675  01bc cd00fc        	call	_ADC_Icc_Init
 677                     ; 264   res = 0;
 679  01bf 5f            	clrw	x
 680  01c0 1f01          	ldw	(OFST-2,sp),x
 682                     ; 266   for(i=8; i>0; i--)
 684  01c2 a608          	ld	a,#8
 685  01c4 6b03          	ld	(OFST+0,sp),a
 687  01c6               L551:
 688                     ; 269     ADC_SoftwareStartConv(ADC1);
 690  01c6 ae5340        	ldw	x,#21312
 691  01c9 cd0000        	call	_ADC_SoftwareStartConv
 694  01cc               L561:
 695                     ; 272     while( ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == 0 );
 697  01cc 4b01          	push	#1
 698  01ce ae5340        	ldw	x,#21312
 699  01d1 cd0000        	call	_ADC_GetFlagStatus
 701  01d4 5b01          	addw	sp,#1
 702  01d6 4d            	tnz	a
 703  01d7 27f3          	jreq	L561
 704                     ; 275     res += ADC_GetConversionValue(ADC1);
 706  01d9 ae5340        	ldw	x,#21312
 707  01dc cd0000        	call	_ADC_GetConversionValue
 709  01df 72fb01        	addw	x,(OFST-2,sp)
 710  01e2 1f01          	ldw	(OFST-2,sp),x
 712                     ; 266   for(i=8; i>0; i--)
 714  01e4 0a03          	dec	(OFST+0,sp)
 718  01e6 0d03          	tnz	(OFST+0,sp)
 719  01e8 26dc          	jrne	L551
 720                     ; 279   GPIO_HIGH(CTN_GPIO_PORT,CTN_CNTEN_GPIO_PIN);
 722  01ea 7218500a      	bset	20490,#4
 723                     ; 281   GPIO_Init(BUTTON_GPIO_PORT, USER_GPIO_PIN,GPIO_Mode_In_FL_IT);
 725  01ee 4b20          	push	#32
 726  01f0 4b02          	push	#2
 727  01f2 ae500a        	ldw	x,#20490
 728  01f5 cd0000        	call	_GPIO_Init
 730  01f8 85            	popw	x
 731                     ; 283   rim();
 734  01f9 9a            rim
 736                     ; 286   ADC_Cmd(ADC1, DISABLE);
 739  01fa 4b00          	push	#0
 740  01fc ae5340        	ldw	x,#21312
 741  01ff cd0000        	call	_ADC_Cmd
 743  0202 84            	pop	a
 744                     ; 288   CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 746  0203 ae1000        	ldw	x,#4096
 747  0206 cd0000        	call	_CLK_PeripheralClockConfig
 749                     ; 290   if (Mcu_State !=MCU_LPR_LCD)
 751  0209 7b04          	ld	a,(OFST+1,sp)
 752  020b a104          	cp	a,#4
 753  020d 2709          	jreq	L171
 754                     ; 292     CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
 756  020f ae1201        	ldw	x,#4609
 757  0212 cd0000        	call	_CLK_PeripheralClockConfig
 759                     ; 293     LCD_GLASS_Init();
 761  0215 cd0000        	call	_LCD_GLASS_Init
 763  0218               L171:
 764                     ; 296   return (res>>3);
 766  0218 1e01          	ldw	x,(OFST-2,sp)
 767  021a 54            	srlw	x
 768  021b 54            	srlw	x
 769  021c 54            	srlw	x
 772  021d 5b04          	addw	sp,#4
 773  021f 81            	ret
 786                     	xref	_LCD_GLASS_Init
 787                     	xdef	_Halt_Init
 788                     	xref	_LPR_init
 789                     	xref	_delay_10us
 790                     	xdef	_GPIO_LowPower_Config
 791                     	xdef	_ADC_Icc_Test
 792                     	xdef	_ADC_Icc_Init
 793                     	xdef	_ADC_Supply
 794                     	xref	_ADC_GetFlagStatus
 795                     	xref	_ADC_GetConversionValue
 796                     	xref	_ADC_SchmittTriggerConfig
 797                     	xref	_ADC_SamplingTimeConfig
 798                     	xref	_ADC_SoftwareStartConv
 799                     	xref	_ADC_VrefintCmd
 800                     	xref	_ADC_Cmd
 801                     	xref	_ADC_ChannelCmd
 802                     	xref	_ADC_Init
 803                     	xref	_ADC_DeInit
 804                     	xref	_LCD_Cmd
 805                     	xref	_GPIO_Init
 806                     	xref	_CLK_PeripheralClockConfig
 807                     	xref	_CLK_RTCClockConfig
 808                     	xref	_CLK_LSICmd
 827                     	end
