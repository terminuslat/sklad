   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  44                     ; 39 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  44                     ; 40 {
  45                     	switch	.text
  46  0000               f_NonHandledInterrupt:
  50  0000               L12:
  51                     ; 44   while (1);
  53  0000 20fe          	jra	L12
  75                     ; 54 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  75                     ; 55 {
  76                     	switch	.text
  77  0002               f_TRAP_IRQHandler:
  81  0002               L53:
  82                     ; 59   while (1);
  84  0002 20fe          	jra	L53
 106                     ; 69 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 106                     ; 70 {
 107                     	switch	.text
 108  0004               f_FLASH_IRQHandler:
 112  0004               L15:
 113                     ; 74   while (1);
 115  0004 20fe          	jra	L15
 138                     ; 84 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 138                     ; 85 {
 139                     	switch	.text
 140  0006               f_DMA1_CHANNEL0_1_IRQHandler:
 144  0006               L56:
 145                     ; 89   while (1);
 147  0006 20fe          	jra	L56
 170                     ; 99 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 170                     ; 100 {
 171                     	switch	.text
 172  0008               f_DMA1_CHANNEL2_3_IRQHandler:
 176  0008               L101:
 177                     ; 104   while (1);
 179  0008 20fe          	jra	L101
 203                     ; 115 INTERRUPT_HANDLER(RTC_IRQHandler,4)
 203                     ; 116 {
 204                     	switch	.text
 205  000a               f_RTC_IRQHandler:
 207  000a 8a            	push	cc
 208  000b 84            	pop	a
 209  000c a4bf          	and	a,#191
 210  000e 88            	push	a
 211  000f 86            	pop	cc
 212  0010 3b0002        	push	c_x+2
 213  0013 be00          	ldw	x,c_x
 214  0015 89            	pushw	x
 215  0016 3b0002        	push	c_y+2
 216  0019 be00          	ldw	x,c_y
 217  001b 89            	pushw	x
 220                     ; 121 AlarmOccurred = TRUE;
 222  001c 35010000      	mov	_AlarmOccurred,#1
 223                     ; 123 									RTC_ClearITPendingBit(RTC_IT_ALRA); 
 225  0020 ae0010        	ldw	x,#16
 226  0023 cd0000        	call	_RTC_ClearITPendingBit
 228                     ; 125 }
 231  0026 85            	popw	x
 232  0027 bf00          	ldw	c_y,x
 233  0029 320002        	pop	c_y+2
 234  002c 85            	popw	x
 235  002d bf00          	ldw	c_x,x
 236  002f 320002        	pop	c_x+2
 237  0032 80            	iret
 260                     ; 133 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 260                     ; 134 {
 261                     	switch	.text
 262  0033               f_EXTIE_F_PVD_IRQHandler:
 266  0033               L521:
 267                     ; 138   while (1);
 269  0033 20fe          	jra	L521
 291                     ; 149 INTERRUPT_HANDLER(EXTIB_IRQHandler,6)
 291                     ; 150 {
 292                     	switch	.text
 293  0035               f_EXTIB_IRQHandler:
 297  0035               L141:
 298                     ; 154   while (1);
 300  0035 20fe          	jra	L141
 322                     ; 165 INTERRUPT_HANDLER(EXTID_IRQHandler,7)
 322                     ; 166 {
 323                     	switch	.text
 324  0037               f_EXTID_IRQHandler:
 328  0037               L551:
 329                     ; 170   while (1);
 331  0037 20fe          	jra	L551
 356                     ; 182 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 356                     ; 183 {
 357                     	switch	.text
 358  0039               f_EXTI0_IRQHandler:
 360  0039 8a            	push	cc
 361  003a 84            	pop	a
 362  003b a4bf          	and	a,#191
 363  003d 88            	push	a
 364  003e 86            	pop	cc
 365  003f 3b0002        	push	c_x+2
 366  0042 be00          	ldw	x,c_x
 367  0044 89            	pushw	x
 368  0045 3b0002        	push	c_y+2
 369  0048 be00          	ldw	x,c_y
 370  004a 89            	pushw	x
 373                     ; 187   disableInterrupts();
 376  004b 9b            sim
 378                     ; 188 	 GerCont1 = TRUE;
 381  004c 35010000      	mov	_GerCont1,#1
 382                     ; 190 EXTI_ClearITPendingBit(EXTI_IT_Pin0);
 384  0050 ae0001        	ldw	x,#1
 385  0053 cd0000        	call	_EXTI_ClearITPendingBit
 387                     ; 191 }
 390  0056 85            	popw	x
 391  0057 bf00          	ldw	c_y,x
 392  0059 320002        	pop	c_y+2
 393  005c 85            	popw	x
 394  005d bf00          	ldw	c_x,x
 395  005f 320002        	pop	c_x+2
 396  0062 80            	iret
 432                     ; 203 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 432                     ; 204 {
 433                     	switch	.text
 434  0063               f_EXTI1_IRQHandler:
 436  0063 8a            	push	cc
 437  0064 84            	pop	a
 438  0065 a4bf          	and	a,#191
 439  0067 88            	push	a
 440  0068 86            	pop	cc
 441       00000004      OFST:	set	4
 442  0069 3b0002        	push	c_x+2
 443  006c be00          	ldw	x,c_x
 444  006e 89            	pushw	x
 445  006f 3b0002        	push	c_y+2
 446  0072 be00          	ldw	x,c_y
 447  0074 89            	pushw	x
 448  0075 5204          	subw	sp,#4
 451                     ; 206   uint32_t i=0;	
 453                     ; 208   disableInterrupts();
 456  0077 9b            sim
 458                     ; 210   KeyPressed = TRUE;
 461  0078 35010000      	mov	_KeyPressed,#1
 462                     ; 316   EXTI_ClearITPendingBit(EXTI_IT_Pin1);
 464  007c ae0002        	ldw	x,#2
 465  007f cd0000        	call	_EXTI_ClearITPendingBit
 467                     ; 320 }
 470  0082 5b04          	addw	sp,#4
 471  0084 85            	popw	x
 472  0085 bf00          	ldw	c_y,x
 473  0087 320002        	pop	c_y+2
 474  008a 85            	popw	x
 475  008b bf00          	ldw	c_x,x
 476  008d 320002        	pop	c_x+2
 477  0090 80            	iret
 499                     ; 330 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 499                     ; 331 {
 500                     	switch	.text
 501  0091               f_EXTI2_IRQHandler:
 505  0091               L712:
 506                     ; 335   while (1);
 508  0091 20fe          	jra	L712
 530                     ; 346 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 530                     ; 347 {
 531                     	switch	.text
 532  0093               f_EXTI3_IRQHandler:
 536  0093               L332:
 537                     ; 351   while (1);
 539  0093 20fe          	jra	L332
 561                     ; 362 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 561                     ; 363 {
 562                     	switch	.text
 563  0095               f_EXTI4_IRQHandler:
 567  0095               L742:
 568                     ; 367   while (1);
 570  0095 20fe          	jra	L742
 592                     ; 378 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 592                     ; 379 {
 593                     	switch	.text
 594  0097               f_EXTI5_IRQHandler:
 598  0097               L362:
 599                     ; 383   while (1);
 601  0097 20fe          	jra	L362
 626                     ; 394 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 626                     ; 395 {
 627                     	switch	.text
 628  0099               f_EXTI6_IRQHandler:
 630  0099 8a            	push	cc
 631  009a 84            	pop	a
 632  009b a4bf          	and	a,#191
 633  009d 88            	push	a
 634  009e 86            	pop	cc
 635  009f 3b0002        	push	c_x+2
 636  00a2 be00          	ldw	x,c_x
 637  00a4 89            	pushw	x
 638  00a5 3b0002        	push	c_y+2
 639  00a8 be00          	ldw	x,c_y
 640  00aa 89            	pushw	x
 643                     ; 396   disableInterrupts();
 646  00ab 9b            sim
 648                     ; 399   EXTI_ClearITPendingBit(EXTI_IT_Pin6);
 651  00ac ae0040        	ldw	x,#64
 652  00af cd0000        	call	_EXTI_ClearITPendingBit
 654                     ; 401   enableInterrupts();
 657  00b2 9a            rim
 659                     ; 403 }
 663  00b3 85            	popw	x
 664  00b4 bf00          	ldw	c_y,x
 665  00b6 320002        	pop	c_y+2
 666  00b9 85            	popw	x
 667  00ba bf00          	ldw	c_x,x
 668  00bc 320002        	pop	c_x+2
 669  00bf 80            	iret
 691                     ; 412 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 691                     ; 413 {
 692                     	switch	.text
 693  00c0               f_EXTI7_IRQHandler:
 697  00c0               L703:
 698                     ; 418   while (1);
 700  00c0 20fe          	jra	L703
 722                     ; 428 INTERRUPT_HANDLER(LCD_IRQHandler,16)
 722                     ; 429 {
 723                     	switch	.text
 724  00c2               f_LCD_IRQHandler:
 728  00c2               L323:
 729                     ; 433   while (1);
 731  00c2 20fe          	jra	L323
 754                     ; 443 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 754                     ; 444 {
 755                     	switch	.text
 756  00c4               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 760  00c4               L733:
 761                     ; 448   while (1);
 763  00c4 20fe          	jra	L733
 786                     ; 459 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 786                     ; 460 {
 787                     	switch	.text
 788  00c6               f_ADC1_COMP_IRQHandler:
 792  00c6               L353:
 793                     ; 464   while (1);
 795  00c6 20fe          	jra	L353
 818                     ; 475 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler,19)
 818                     ; 476 {
 819                     	switch	.text
 820  00c8               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 824  00c8               L763:
 825                     ; 480   while (1);
 827  00c8 20fe          	jra	L763
 850                     ; 491 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler,20)
 850                     ; 492 {
 851                     	switch	.text
 852  00ca               f_TIM2_CAP_IRQHandler:
 856  00ca               L304:
 857                     ; 496   while (1);
 859  00ca 20fe          	jra	L304
 882                     ; 508 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler,21)
 882                     ; 509 {
 883                     	switch	.text
 884  00cc               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 888  00cc               L714:
 889                     ; 513   while (1);
 891  00cc 20fe          	jra	L714
 914                     ; 523 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler,22)
 914                     ; 524 {
 915                     	switch	.text
 916  00ce               f_TIM3_CAP_IRQHandler:
 920  00ce               L334:
 921                     ; 528   while (1);
 923  00ce 20fe          	jra	L334
 946                     ; 538 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 946                     ; 539 {
 947                     	switch	.text
 948  00d0               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 952  00d0               L744:
 953                     ; 543   while (1);
 955  00d0 20fe          	jra	L744
 978                     ; 553 INTERRUPT_HANDLER(TIM1_CAP_IRQHandler,24)
 978                     ; 554 {
 979                     	switch	.text
 980  00d2               f_TIM1_CAP_IRQHandler:
 984  00d2               L364:
 985                     ; 558   while (1);
 987  00d2 20fe          	jra	L364
1010                     ; 569 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
1010                     ; 570 {
1011                     	switch	.text
1012  00d4               f_TIM4_UPD_OVF_TRG_IRQHandler:
1016  00d4               L774:
1017                     ; 574   while (1);
1019  00d4 20fe          	jra	L774
1041                     ; 584 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
1041                     ; 585 {
1042                     	switch	.text
1043  00d6               f_SPI1_IRQHandler:
1047  00d6               L315:
1048                     ; 589   while (1);
1050  00d6 20fe          	jra	L315
1073                     ; 600 INTERRUPT_HANDLER(USART1_TX_IRQHandler,27)
1073                     ; 601 {
1074                     	switch	.text
1075  00d8               f_USART1_TX_IRQHandler:
1079  00d8               L725:
1080                     ; 605   while (1);
1082  00d8 20fe          	jra	L725
1105                     ; 616 INTERRUPT_HANDLER(USART1_RX_IRQHandler,28)
1105                     ; 617 {
1106                     	switch	.text
1107  00da               f_USART1_RX_IRQHandler:
1111  00da               L345:
1112                     ; 621   while (1);
1114  00da 20fe          	jra	L345
1136                     ; 632 INTERRUPT_HANDLER(I2C1_IRQHandler,29)
1136                     ; 633 {
1137                     	switch	.text
1138  00dc               f_I2C1_IRQHandler:
1142  00dc               L755:
1143                     ; 637   while (1);
1145  00dc 20fe          	jra	L755
1157                     	xref.b	_GerCont1
1158                     	xref.b	_AlarmOccurred
1159                     	xref.b	_KeyPressed
1160                     	xdef	f_I2C1_IRQHandler
1161                     	xdef	f_USART1_RX_IRQHandler
1162                     	xdef	f_USART1_TX_IRQHandler
1163                     	xdef	f_SPI1_IRQHandler
1164                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1165                     	xdef	f_TIM1_CAP_IRQHandler
1166                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1167                     	xdef	f_TIM3_CAP_IRQHandler
1168                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
1169                     	xdef	f_TIM2_CAP_IRQHandler
1170                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
1171                     	xdef	f_ADC1_COMP_IRQHandler
1172                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1173                     	xdef	f_LCD_IRQHandler
1174                     	xdef	f_EXTI7_IRQHandler
1175                     	xdef	f_EXTI6_IRQHandler
1176                     	xdef	f_EXTI5_IRQHandler
1177                     	xdef	f_EXTI4_IRQHandler
1178                     	xdef	f_EXTI3_IRQHandler
1179                     	xdef	f_EXTI2_IRQHandler
1180                     	xdef	f_EXTI1_IRQHandler
1181                     	xdef	f_EXTI0_IRQHandler
1182                     	xdef	f_EXTID_IRQHandler
1183                     	xdef	f_EXTIB_IRQHandler
1184                     	xdef	f_EXTIE_F_PVD_IRQHandler
1185                     	xdef	f_RTC_IRQHandler
1186                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1187                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1188                     	xdef	f_FLASH_IRQHandler
1189                     	xdef	f_TRAP_IRQHandler
1190                     	xdef	f_NonHandledInterrupt
1191                     	xref	_RTC_ClearITPendingBit
1192                     	xref	_EXTI_ClearITPendingBit
1193                     	xref.b	c_x
1194                     	xref.b	c_y
1213                     	end
