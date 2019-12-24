   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  15                     .dataeeprom:	section	.bss
  16  0000               _Bias_Current:
  17  0000 00            	ds.b	1
  62                     ; 58 void FLASH_ProgramBias(uint8_t Data)
  62                     ; 59 {
  64                     	switch	.text
  65  0000               _FLASH_ProgramBias:
  67  0000 88            	push	a
  68       00000000      OFST:	set	0
  71                     ; 60   FLASH_Unlock(FLASH_MemType_Data);
  73  0001 a6f7          	ld	a,#247
  74  0003 cd0000        	call	_FLASH_Unlock
  76                     ; 61   Bias_Current = Data;
  78  0006 7b01          	ld	a,(OFST+1,sp)
  79  0008 c70000        	ld	_Bias_Current,a
  80                     ; 62   FLASH_WaitForLastOperation(FLASH_MemType_Data);
  82  000b a6f7          	ld	a,#247
  83  000d cd0000        	call	_FLASH_WaitForLastOperation
  85                     ; 63   FLASH_Lock(FLASH_MemType_Data);
  87  0010 a6f7          	ld	a,#247
  88  0012 cd0000        	call	_FLASH_Lock
  90                     ; 64 }	
  93  0015 84            	pop	a
  94  0016 81            	ret
 133                     ; 72 void test_vdd(void)
 133                     ; 73 {
 134                     	switch	.text
 135  0017               _test_vdd:
 137  0017 89            	pushw	x
 138       00000002      OFST:	set	2
 141                     ; 76   LCD_GLASS_DisplayString("VDD");
 143  0018 ae00c4        	ldw	x,#L54
 144  001b cd0000        	call	_LCD_GLASS_DisplayString
 146                     ; 77   delay_ms(200);
 148  001e ae00c8        	ldw	x,#200
 149  0021 cd0000        	call	_delay_ms
 151                     ; 79   vdd_test = (int)Vref_measure();
 153  0024 cd0497        	call	_Vref_measure
 155  0027 1f01          	ldw	(OFST-1,sp),x
 157                     ; 80   delay_ms(200);
 159  0029 ae00c8        	ldw	x,#200
 160  002c cd0000        	call	_delay_ms
 162                     ; 83   if ((vdd_test>VCC_MAX) || (vdd_test<VCC_MIN))
 164  002f 1e01          	ldw	x,(OFST-1,sp)
 165  0031 a30c1d        	cpw	x,#3101
 166  0034 2407          	jruge	L35
 168  0036 1e01          	ldw	x,(OFST-1,sp)
 169  0038 a30b63        	cpw	x,#2915
 170  003b 2414          	jruge	L74
 171  003d               L35:
 172                     ; 87       LCD_GLASS_ScrollSentence("VDD Not OK ",1,SCROLL_SPEED); //Press reset for exit
 174  003d ae0028        	ldw	x,#40
 175  0040 89            	pushw	x
 176  0041 ae0001        	ldw	x,#1
 177  0044 89            	pushw	x
 178  0045 ae00b8        	ldw	x,#L75
 179  0048 cd0000        	call	_LCD_GLASS_ScrollSentence
 181  004b 5b04          	addw	sp,#4
 182                     ; 88       KeyPressed = FALSE;
 184  004d 3f00          	clr	_KeyPressed
 186  004f 20ec          	jra	L35
 187  0051               L74:
 188                     ; 92   LCD_GLASS_DisplayString("VDD OK");
 190  0051 ae00b1        	ldw	x,#L16
 191  0054 cd0000        	call	_LCD_GLASS_DisplayString
 193                     ; 93   delay_ms(200);
 195  0057 ae00c8        	ldw	x,#200
 196  005a cd0000        	call	_delay_ms
 198                     ; 94 }
 201  005d 85            	popw	x
 202  005e 81            	ret
 241                     ; 102 void test_icc_Run(void)
 241                     ; 103 {
 242                     	switch	.text
 243  005f               _test_icc_Run:
 245  005f 89            	pushw	x
 246       00000002      OFST:	set	2
 249                     ; 106   LCD_GLASS_DisplayString("RUN");
 251  0060 ae00ad        	ldw	x,#L101
 252  0063 cd0000        	call	_LCD_GLASS_DisplayString
 254                     ; 107   delay_ms(200);
 256  0066 ae00c8        	ldw	x,#200
 257  0069 cd0000        	call	_delay_ms
 259                     ; 109   icc_test = (int)Icc_measure_RUN();
 261  006c cd0515        	call	_Icc_measure_RUN
 263  006f cd0000        	call	c_ftoi
 265  0072 1f01          	ldw	(OFST-1,sp),x
 267                     ; 110   delay_ms(200);
 269  0074 ae00c8        	ldw	x,#200
 270  0077 cd0000        	call	_delay_ms
 272                     ; 112   if ((icc_test>ICC_RUN_MAX) || (icc_test<ICC_RUN_MIN))
 274  007a 1e01          	ldw	x,(OFST-1,sp)
 275  007c a30641        	cpw	x,#1601
 276  007f 2407          	jruge	L701
 278  0081 1e01          	ldw	x,(OFST-1,sp)
 279  0083 a303e8        	cpw	x,#1000
 280  0086 2414          	jruge	L301
 281  0088               L701:
 282                     ; 116       LCD_GLASS_ScrollSentence("RUN Not OK ",1,SCROLL_SPEED); //Press reset for exit
 284  0088 ae0028        	ldw	x,#40
 285  008b 89            	pushw	x
 286  008c ae0001        	ldw	x,#1
 287  008f 89            	pushw	x
 288  0090 ae00a1        	ldw	x,#L311
 289  0093 cd0000        	call	_LCD_GLASS_ScrollSentence
 291  0096 5b04          	addw	sp,#4
 292                     ; 117       KeyPressed = FALSE;
 294  0098 3f00          	clr	_KeyPressed
 296  009a 20ec          	jra	L701
 297  009c               L301:
 298                     ; 121   LCD_GLASS_DisplayString("RUN OK");
 300  009c ae009a        	ldw	x,#L511
 301  009f cd0000        	call	_LCD_GLASS_DisplayString
 303                     ; 122   delay_ms(200);
 305  00a2 ae00c8        	ldw	x,#200
 306  00a5 cd0000        	call	_delay_ms
 308                     ; 123 }
 311  00a8 85            	popw	x
 312  00a9 81            	ret
 351                     ; 131 void test_icc_HALT(void)
 351                     ; 132 {
 352                     	switch	.text
 353  00aa               _test_icc_HALT:
 355  00aa 89            	pushw	x
 356       00000002      OFST:	set	2
 359                     ; 135   LCD_GLASS_DisplayString("HALT");
 361  00ab ae0095        	ldw	x,#L531
 362  00ae cd0000        	call	_LCD_GLASS_DisplayString
 364                     ; 136   delay_ms(200);
 366  00b1 ae00c8        	ldw	x,#200
 367  00b4 cd0000        	call	_delay_ms
 369                     ; 139   icc_test = (int)Icc_measure_HALT();
 371  00b7 cd058b        	call	_Icc_measure_HALT
 373  00ba cd0000        	call	c_ftoi
 375  00bd 1f01          	ldw	(OFST-1,sp),x
 377                     ; 140   delay_ms(200);
 379  00bf ae00c8        	ldw	x,#200
 380  00c2 cd0000        	call	_delay_ms
 382                     ; 143   if ((icc_test>ICC_HALT_MAX) || (icc_test<ICC_HALT_MIN))
 384  00c5 1e01          	ldw	x,(OFST-1,sp)
 385  00c7 a30321        	cpw	x,#801
 386  00ca 2407          	jruge	L141
 388  00cc 1e01          	ldw	x,(OFST-1,sp)
 389  00ce a3012c        	cpw	x,#300
 390  00d1 2436          	jruge	L731
 391  00d3               L141:
 392                     ; 145     delay_ms(400);	
 394  00d3 ae0190        	ldw	x,#400
 395  00d6 cd0000        	call	_delay_ms
 397                     ; 146     icc_test = (int)Icc_measure_HALT();
 399  00d9 cd058b        	call	_Icc_measure_HALT
 401  00dc cd0000        	call	c_ftoi
 403  00df 1f01          	ldw	(OFST-1,sp),x
 405                     ; 147     delay_ms(200);		
 407  00e1 ae00c8        	ldw	x,#200
 408  00e4 cd0000        	call	_delay_ms
 410                     ; 150     if ((icc_test>ICC_HALT_MAX) || (icc_test<ICC_HALT_MIN))
 412  00e7 1e01          	ldw	x,(OFST-1,sp)
 413  00e9 a30321        	cpw	x,#801
 414  00ec 2407          	jruge	L741
 416  00ee 1e01          	ldw	x,(OFST-1,sp)
 417  00f0 a3012c        	cpw	x,#300
 418  00f3 2414          	jruge	L731
 419  00f5               L741:
 420                     ; 154         LCD_GLASS_ScrollSentence("ICC HALT Not OK ",1,SCROLL_SPEED); //Press reset for exit
 422  00f5 ae0028        	ldw	x,#40
 423  00f8 89            	pushw	x
 424  00f9 ae0001        	ldw	x,#1
 425  00fc 89            	pushw	x
 426  00fd ae0084        	ldw	x,#L351
 427  0100 cd0000        	call	_LCD_GLASS_ScrollSentence
 429  0103 5b04          	addw	sp,#4
 430                     ; 155         KeyPressed = FALSE;
 432  0105 3f00          	clr	_KeyPressed
 434  0107 20ec          	jra	L741
 435  0109               L731:
 436                     ; 160   LCD_GLASS_DisplayString("HALTOK");
 438  0109 ae007d        	ldw	x,#L551
 439  010c cd0000        	call	_LCD_GLASS_DisplayString
 441                     ; 161   delay_ms(200);
 443  010f ae00c8        	ldw	x,#200
 444  0112 cd0000        	call	_delay_ms
 446                     ; 162 }
 449  0115 85            	popw	x
 450  0116 81            	ret
 489                     ; 170 void test_icc_LP(void)
 489                     ; 171 {
 490                     	switch	.text
 491  0117               _test_icc_LP:
 493  0117 89            	pushw	x
 494       00000002      OFST:	set	2
 497                     ; 174   LCD_GLASS_DisplayString("LP");
 499  0118 ae007a        	ldw	x,#L571
 500  011b cd0000        	call	_LCD_GLASS_DisplayString
 502                     ; 175   delay_ms(200);
 504  011e ae00c8        	ldw	x,#200
 505  0121 cd0000        	call	_delay_ms
 507                     ; 178   icc_test = (int)Icc_measure_LPR();
 509  0124 cd0601        	call	_Icc_measure_LPR
 511  0127 cd0000        	call	c_ftoi
 513  012a 1f01          	ldw	(OFST-1,sp),x
 515                     ; 179   delay_ms(200);
 517  012c ae00c8        	ldw	x,#200
 518  012f cd0000        	call	_delay_ms
 520                     ; 182   if ((icc_test>ICC_LP_MAX) || (icc_test<ICC_LP_MIN))
 522  0132 1e01          	ldw	x,(OFST-1,sp)
 523  0134 a30fdd        	cpw	x,#4061
 524  0137 2407          	jruge	L102
 526  0139 1e01          	ldw	x,(OFST-1,sp)
 527  013b a309c4        	cpw	x,#2500
 528  013e 2436          	jruge	L771
 529  0140               L102:
 530                     ; 185     delay_ms(400);
 532  0140 ae0190        	ldw	x,#400
 533  0143 cd0000        	call	_delay_ms
 535                     ; 186     icc_test = (int)Icc_measure_LPR();
 537  0146 cd0601        	call	_Icc_measure_LPR
 539  0149 cd0000        	call	c_ftoi
 541  014c 1f01          	ldw	(OFST-1,sp),x
 543                     ; 187     delay_ms(200);			
 545  014e ae00c8        	ldw	x,#200
 546  0151 cd0000        	call	_delay_ms
 548                     ; 190     if ((icc_test>ICC_LP_MAX) || (icc_test<ICC_LP_MIN))
 550  0154 1e01          	ldw	x,(OFST-1,sp)
 551  0156 a30fdd        	cpw	x,#4061
 552  0159 2407          	jruge	L702
 554  015b 1e01          	ldw	x,(OFST-1,sp)
 555  015d a309c4        	cpw	x,#2500
 556  0160 2414          	jruge	L771
 557  0162               L702:
 558                     ; 194         LCD_GLASS_ScrollSentence("LP Not OK ",1,SCROLL_SPEED); //press reset for exit
 560  0162 ae0028        	ldw	x,#40
 561  0165 89            	pushw	x
 562  0166 ae0001        	ldw	x,#1
 563  0169 89            	pushw	x
 564  016a ae006f        	ldw	x,#L312
 565  016d cd0000        	call	_LCD_GLASS_ScrollSentence
 567  0170 5b04          	addw	sp,#4
 568                     ; 195         KeyPressed = FALSE;
 570  0172 3f00          	clr	_KeyPressed
 572  0174 20ec          	jra	L702
 573  0176               L771:
 574                     ; 200   LCD_GLASS_DisplayString("LP OK");
 576  0176 ae0069        	ldw	x,#L512
 577  0179 cd0000        	call	_LCD_GLASS_DisplayString
 579                     ; 201   delay_ms(200);
 581  017c ae00c8        	ldw	x,#200
 582  017f cd0000        	call	_delay_ms
 584                     ; 202 }
 587  0182 85            	popw	x
 588  0183 81            	ret
 620                     ; 210 void test_LSE(void)
 620                     ; 211 {
 621                     	switch	.text
 622  0184               _test_LSE:
 626                     ; 215   LCD_GLASS_DisplayString("LSE");
 628  0184 ae0065        	ldw	x,#L722
 629  0187 cd0000        	call	_LCD_GLASS_DisplayString
 631                     ; 217   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 633  018a 4f            	clr	a
 634  018b cd0000        	call	_CLK_SYSCLKDivConfig
 636                     ; 218   CLK_LSEConfig(CLK_LSE_ON);
 638  018e a604          	ld	a,#4
 639  0190 cd0000        	call	_CLK_LSEConfig
 641                     ; 219   delay_ms(LSE_DELAY);	
 643  0193 ae07d0        	ldw	x,#2000
 644  0196 cd0000        	call	_delay_ms
 646                     ; 221   if((CLK->ECKCR & CLK_ECKCR_LSERDY) == RESET)
 648  0199 c650c6        	ld	a,20678
 649  019c a508          	bcp	a,#8
 650  019e 2664          	jrne	L362
 651                     ; 223     LCD_GLASS_DisplayString("LSE");
 653  01a0 ae0065        	ldw	x,#L722
 654  01a3 cd0000        	call	_LCD_GLASS_DisplayString
 656                     ; 224     delay_ms(LSE_DELAY);
 658  01a6 ae07d0        	ldw	x,#2000
 659  01a9 cd0000        	call	_delay_ms
 661                     ; 225     if((CLK->ECKCR & CLK_ECKCR_LSERDY) == RESET)
 663  01ac c650c6        	ld	a,20678
 664  01af a508          	bcp	a,#8
 665  01b1 2651          	jrne	L362
 666                     ; 227       LCD_GLASS_DisplayString("LSE");
 668  01b3 ae0065        	ldw	x,#L722
 669  01b6 cd0000        	call	_LCD_GLASS_DisplayString
 671                     ; 228       delay_ms(LSE_DELAY);
 673  01b9 ae07d0        	ldw	x,#2000
 674  01bc cd0000        	call	_delay_ms
 676                     ; 229       if((CLK->ECKCR & CLK_ECKCR_LSERDY) == RESET)
 678  01bf c650c6        	ld	a,20678
 679  01c2 a508          	bcp	a,#8
 680  01c4 263e          	jrne	L362
 681                     ; 232         CLK_LSEConfig(CLK_LSE_OFF);
 683  01c6 4f            	clr	a
 684  01c7 cd0000        	call	_CLK_LSEConfig
 686                     ; 233         CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_8);
 688  01ca a603          	ld	a,#3
 689  01cc cd0000        	call	_CLK_SYSCLKDivConfig
 691                     ; 234         CLK_HSICmd(ENABLE);
 693  01cf a601          	ld	a,#1
 694  01d1 cd0000        	call	_CLK_HSICmd
 697  01d4               L142:
 698                     ; 235         while (((CLK->ICKCR)& 0x02)!=0x02);
 700  01d4 c650c2        	ld	a,20674
 701  01d7 a402          	and	a,#2
 702  01d9 a102          	cp	a,#2
 703  01db 26f7          	jrne	L142
 704                     ; 236         CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 706  01dd a601          	ld	a,#1
 707  01df cd0000        	call	_CLK_SYSCLKSourceConfig
 709                     ; 237         CLK_SYSCLKSourceSwitchCmd(ENABLE);
 711  01e2 a601          	ld	a,#1
 712  01e4 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 715  01e7               L742:
 716                     ; 238         while (((CLK->SWCR)& 0x01)==0x01);
 718  01e7 c650c9        	ld	a,20681
 719  01ea a401          	and	a,#1
 720  01ec a101          	cp	a,#1
 721  01ee 27f7          	jreq	L742
 722  01f0               L352:
 723                     ; 242           LCD_GLASS_ScrollSentence("LSE Not OK ",1,SCROLL_SPEED); //Press reset for exit
 725  01f0 ae0028        	ldw	x,#40
 726  01f3 89            	pushw	x
 727  01f4 ae0001        	ldw	x,#1
 728  01f7 89            	pushw	x
 729  01f8 ae0059        	ldw	x,#L752
 730  01fb cd0000        	call	_LCD_GLASS_ScrollSentence
 732  01fe 5b04          	addw	sp,#4
 733                     ; 243           KeyPressed = FALSE;
 735  0200 3f00          	clr	_KeyPressed
 737  0202 20ec          	jra	L352
 738  0204               L362:
 739                     ; 250   while (!((CLK->ECKCR)& CLK_ECKCR_LSERDY));	
 741  0204 c650c6        	ld	a,20678
 742  0207 a508          	bcp	a,#8
 743  0209 27f9          	jreq	L362
 744                     ; 253   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSE);
 746  020b a608          	ld	a,#8
 747  020d cd0000        	call	_CLK_SYSCLKSourceConfig
 749                     ; 254   CLK_SYSCLKSourceSwitchCmd(ENABLE);
 751  0210 a601          	ld	a,#1
 752  0212 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 755  0215               L172:
 756                     ; 255   while (((CLK->SWCR)& 0x01)==0x01);
 758  0215 c650c9        	ld	a,20681
 759  0218 a401          	and	a,#1
 760  021a a101          	cp	a,#1
 761  021c 27f7          	jreq	L172
 762                     ; 257   LCD_GLASS_DisplayString("LSE OK");
 764  021e ae0052        	ldw	x,#L572
 765  0221 cd0000        	call	_LCD_GLASS_DisplayString
 767                     ; 261   CLK_LSEConfig(CLK_LSE_OFF);
 769  0224 4f            	clr	a
 770  0225 cd0000        	call	_CLK_LSEConfig
 772                     ; 262   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_8);
 774  0228 a603          	ld	a,#3
 775  022a cd0000        	call	_CLK_SYSCLKDivConfig
 777                     ; 263   CLK_HSICmd(ENABLE);
 779  022d a601          	ld	a,#1
 780  022f cd0000        	call	_CLK_HSICmd
 783  0232               L103:
 784                     ; 264   while (((CLK->ICKCR)& 0x02)!=0x02);
 786  0232 c650c2        	ld	a,20674
 787  0235 a402          	and	a,#2
 788  0237 a102          	cp	a,#2
 789  0239 26f7          	jrne	L103
 790                     ; 265   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 792  023b a601          	ld	a,#1
 793  023d cd0000        	call	_CLK_SYSCLKSourceConfig
 795                     ; 266   CLK_SYSCLKSourceSwitchCmd(ENABLE);
 797  0240 a601          	ld	a,#1
 798  0242 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 801  0245               L703:
 802                     ; 267   while (((CLK->SWCR)& 0x01)==0x01);
 804  0245 c650c9        	ld	a,20681
 805  0248 a401          	and	a,#1
 806  024a a101          	cp	a,#1
 807  024c 27f7          	jreq	L703
 808                     ; 268   delay_ms(100);
 810  024e ae0064        	ldw	x,#100
 811  0251 cd0000        	call	_delay_ms
 813                     ; 269 }
 816  0254 81            	ret
 819                     .const:	section	.text
 820  0000               L313_tab:
 821  0000 0020          	dc.w	32
 822  0002 0020          	dc.w	32
 823  0004 0020          	dc.w	32
 824  0006 0020          	dc.w	32
 825  0008 0020          	dc.w	32
 826  000a 0020          	dc.w	32
 870                     ; 277 void auto_test(void)
 870                     ; 278 {
 871                     	switch	.text
 872  0255               _auto_test:
 874  0255 520c          	subw	sp,#12
 875       0000000c      OFST:	set	12
 878                     ; 279   uint16_t tab[6]={0x20,0x20,0x20,0x20,0x20,0x20};
 880  0257 96            	ldw	x,sp
 881  0258 1c0001        	addw	x,#OFST-11
 882  025b 90ae0000      	ldw	y,#L313_tab
 883  025f a60c          	ld	a,#12
 884  0261 cd0000        	call	c_xymvx
 886                     ; 281   Auto_test = TRUE;
 888  0264 35010000      	mov	_Auto_test,#1
 889                     ; 284   GPIO_LOW(LED_GREEN_PORT,LED_GREEN_PIN);	
 891  0268 721f5014      	bres	20500,#7
 892                     ; 285   GPIO_LOW(LED_BLUE_PORT,LED_BLUE_PIN);		
 894  026c 721f500a      	bres	20490,#7
 895                     ; 288   LCD_GLASS_DisplayString(" TEST ");
 897  0270 ae004b        	ldw	x,#L333
 898  0273 cd0000        	call	_LCD_GLASS_DisplayString
 900                     ; 289   delay_ms(150);
 902  0276 ae0096        	ldw	x,#150
 903  0279 cd0000        	call	_delay_ms
 905                     ; 290   STR_VERSION;
 907  027c ae0056        	ldw	x,#86
 908  027f 1f03          	ldw	(OFST-9,sp),x
 912  0281 ae8031        	ldw	x,#32817
 913  0284 1f05          	ldw	(OFST-7,sp),x
 917  0286 ae8032        	ldw	x,#32818
 918  0289 1f07          	ldw	(OFST-5,sp),x
 922  028b ae0034        	ldw	x,#52
 923  028e 1f09          	ldw	(OFST-3,sp),x
 925                     ; 291   LCD_GLASS_DisplayStrDeci(tab);
 927  0290 96            	ldw	x,sp
 928  0291 1c0001        	addw	x,#OFST-11
 929  0294 cd0000        	call	_LCD_GLASS_DisplayStrDeci
 931                     ; 292   delay_ms(200);
 933  0297 ae00c8        	ldw	x,#200
 934  029a cd0000        	call	_delay_ms
 936                     ; 295   test_LSE();
 938  029d cd0184        	call	_test_LSE
 940                     ; 296   test_vdd();
 942  02a0 cd0017        	call	_test_vdd
 944                     ; 297   test_icc_Run();
 946  02a3 cd005f        	call	_test_icc_Run
 948                     ; 298   test_icc_HALT();
 950  02a6 cd00aa        	call	_test_icc_HALT
 952                     ; 299   test_icc_LP();
 954  02a9 cd0117        	call	_test_icc_LP
 956                     ; 301   Auto_test = FALSE;
 958  02ac 3f00          	clr	_Auto_test
 959  02ae               L533:
 960                     ; 306     LCD_GLASS_ScrollSentence("TEST OK ",1,SCROLL_SPEED);
 962  02ae ae0028        	ldw	x,#40
 963  02b1 89            	pushw	x
 964  02b2 ae0001        	ldw	x,#1
 965  02b5 89            	pushw	x
 966  02b6 ae0042        	ldw	x,#L143
 967  02b9 cd0000        	call	_LCD_GLASS_ScrollSentence
 969  02bc 5b04          	addw	sp,#4
 970                     ; 307     KeyPressed = FALSE;
 972  02be 3f00          	clr	_KeyPressed
 974  02c0 20ec          	jra	L533
1023                     ; 317 void Bias_measurement(void)
1023                     ; 318 {
1024                     	switch	.text
1025  02c2               _Bias_measurement:
1027  02c2 5207          	subw	sp,#7
1028       00000007      OFST:	set	7
1031                     ; 322   LCD_GLASS_ScrollSentence("      ** BIAS CURRENT ** JP1 OFF **",1,SCROLL_SPEED);	
1033  02c4 ae0028        	ldw	x,#40
1034  02c7 89            	pushw	x
1035  02c8 ae0001        	ldw	x,#1
1036  02cb 89            	pushw	x
1037  02cc ae001e        	ldw	x,#L563
1038  02cf cd0000        	call	_LCD_GLASS_ScrollSentence
1040  02d2 5b04          	addw	sp,#4
1041                     ; 324   B_Current = ADC_Icc_Test(MCU_HALT);
1043  02d4 a603          	ld	a,#3
1044  02d6 cd0000        	call	_ADC_Icc_Test
1046  02d9 01            	rrwa	x,a
1047  02da 6b05          	ld	(OFST-2,sp),a
1048  02dc 02            	rlwa	x,a
1050                     ; 325   V_Current = (uint16_t)(B_Current * (Vdd_appli()/ADC_CONV)); 
1052  02dd 7b05          	ld	a,(OFST-2,sp)
1053  02df 5f            	clrw	x
1054  02e0 97            	ld	xl,a
1055  02e1 cd0000        	call	c_itof
1057  02e4 96            	ldw	x,sp
1058  02e5 1c0001        	addw	x,#OFST-6
1059  02e8 cd0000        	call	c_rtol
1062  02eb cd0453        	call	_Vdd_appli
1064  02ee ae001a        	ldw	x,#L373
1065  02f1 cd0000        	call	c_fdiv
1067  02f4 96            	ldw	x,sp
1068  02f5 1c0001        	addw	x,#OFST-6
1069  02f8 cd0000        	call	c_fmul
1071  02fb cd0000        	call	c_ftoi
1073  02fe 1f06          	ldw	(OFST-1,sp),x
1075                     ; 326   V_Current *= 10L;
1077  0300 1e06          	ldw	x,(OFST-1,sp)
1078  0302 a60a          	ld	a,#10
1079  0304 cd0000        	call	c_bmulx
1081  0307 1f06          	ldw	(OFST-1,sp),x
1083                     ; 327   display_MuAmp(V_Current);
1085  0309 1e06          	ldw	x,(OFST-1,sp)
1086  030b cd04cc        	call	_display_MuAmp
1088                     ; 330   FLASH_ProgramBias(B_Current);
1090  030e 7b05          	ld	a,(OFST-2,sp)
1091  0310 cd0000        	call	_FLASH_ProgramBias
1093  0313               L773:
1094                     ; 334     B_Current = ADC_Icc_Test(MCU_HALT);
1096  0313 a603          	ld	a,#3
1097  0315 cd0000        	call	_ADC_Icc_Test
1099  0318 01            	rrwa	x,a
1100  0319 6b05          	ld	(OFST-2,sp),a
1101  031b 02            	rlwa	x,a
1103                     ; 335     V_Current = (uint16_t)(B_Current * (Vdd_appli()/ADC_CONV)); 
1105  031c 7b05          	ld	a,(OFST-2,sp)
1106  031e 5f            	clrw	x
1107  031f 97            	ld	xl,a
1108  0320 cd0000        	call	c_itof
1110  0323 96            	ldw	x,sp
1111  0324 1c0001        	addw	x,#OFST-6
1112  0327 cd0000        	call	c_rtol
1115  032a cd0453        	call	_Vdd_appli
1117  032d ae001a        	ldw	x,#L373
1118  0330 cd0000        	call	c_fdiv
1120  0333 96            	ldw	x,sp
1121  0334 1c0001        	addw	x,#OFST-6
1122  0337 cd0000        	call	c_fmul
1124  033a cd0000        	call	c_ftoi
1126  033d 1f06          	ldw	(OFST-1,sp),x
1128                     ; 336     V_Current *= 10L;
1130  033f 1e06          	ldw	x,(OFST-1,sp)
1131  0341 a60a          	ld	a,#10
1132  0343 cd0000        	call	c_bmulx
1134  0346 1f06          	ldw	(OFST-1,sp),x
1136                     ; 337     display_MuAmp(V_Current);
1138  0348 1e06          	ldw	x,(OFST-1,sp)
1139  034a cd04cc        	call	_display_MuAmp
1141                     ; 338     delay_ms(300);
1143  034d ae012c        	ldw	x,#300
1144  0350 cd0000        	call	_delay_ms
1147  0353 20be          	jra	L773
1236                     ; 350 void convert_into_char(uint16_t number, uint16_t *p_tab)
1236                     ; 351 {
1237                     	switch	.text
1238  0355               _convert_into_char:
1240  0355 89            	pushw	x
1241  0356 520a          	subw	sp,#10
1242       0000000a      OFST:	set	10
1245                     ; 352   uint16_t units=0, tens=0, hundreds=0, thousands=0, misc=0;
1255                     ; 354   units = (((number%10000)%1000)%100)%10;
1257  0358 90ae2710      	ldw	y,#10000
1258  035c 65            	divw	x,y
1259  035d 51            	exgw	x,y
1260  035e 90ae03e8      	ldw	y,#1000
1261  0362 65            	divw	x,y
1262  0363 51            	exgw	x,y
1263  0364 a664          	ld	a,#100
1264  0366 62            	div	x,a
1265  0367 5f            	clrw	x
1266  0368 97            	ld	xl,a
1267  0369 a60a          	ld	a,#10
1268  036b 62            	div	x,a
1269  036c 5f            	clrw	x
1270  036d 97            	ld	xl,a
1271  036e 1f09          	ldw	(OFST-1,sp),x
1273                     ; 355   tens = ((((number-units)/10)%1000)%100)%10;
1275  0370 1e0b          	ldw	x,(OFST+1,sp)
1276  0372 72f009        	subw	x,(OFST-1,sp)
1277  0375 a60a          	ld	a,#10
1278  0377 62            	div	x,a
1279  0378 90ae03e8      	ldw	y,#1000
1280  037c 65            	divw	x,y
1281  037d 51            	exgw	x,y
1282  037e a664          	ld	a,#100
1283  0380 62            	div	x,a
1284  0381 5f            	clrw	x
1285  0382 97            	ld	xl,a
1286  0383 a60a          	ld	a,#10
1287  0385 62            	div	x,a
1288  0386 5f            	clrw	x
1289  0387 97            	ld	xl,a
1290  0388 1f07          	ldw	(OFST-3,sp),x
1292                     ; 356   hundreds = (((number-tens-units)/100))%100%10;
1294  038a 1e0b          	ldw	x,(OFST+1,sp)
1295  038c 72f007        	subw	x,(OFST-3,sp)
1296  038f 72f009        	subw	x,(OFST-1,sp)
1297  0392 a664          	ld	a,#100
1298  0394 62            	div	x,a
1299  0395 a664          	ld	a,#100
1300  0397 62            	div	x,a
1301  0398 5f            	clrw	x
1302  0399 97            	ld	xl,a
1303  039a a60a          	ld	a,#10
1304  039c 62            	div	x,a
1305  039d 5f            	clrw	x
1306  039e 97            	ld	xl,a
1307  039f 1f05          	ldw	(OFST-5,sp),x
1309                     ; 357   thousands = ((number-hundreds-tens-units)/1000)%10;
1311  03a1 1e0b          	ldw	x,(OFST+1,sp)
1312  03a3 72f005        	subw	x,(OFST-5,sp)
1313  03a6 72f007        	subw	x,(OFST-3,sp)
1314  03a9 72f009        	subw	x,(OFST-1,sp)
1315  03ac 90ae03e8      	ldw	y,#1000
1316  03b0 65            	divw	x,y
1317  03b1 a60a          	ld	a,#10
1318  03b3 62            	div	x,a
1319  03b4 5f            	clrw	x
1320  03b5 97            	ld	xl,a
1321  03b6 1f03          	ldw	(OFST-7,sp),x
1323                     ; 358   misc = ((number-thousands-hundreds-tens-units)/10000);
1325  03b8 1e0b          	ldw	x,(OFST+1,sp)
1326  03ba 72f003        	subw	x,(OFST-7,sp)
1327  03bd 72f005        	subw	x,(OFST-5,sp)
1328  03c0 72f007        	subw	x,(OFST-3,sp)
1329  03c3 72f009        	subw	x,(OFST-1,sp)
1330  03c6 90ae2710      	ldw	y,#10000
1331  03ca 65            	divw	x,y
1332  03cb 1f01          	ldw	(OFST-9,sp),x
1334                     ; 360   *(p_tab+4) = units + 0x30;
1336  03cd 1e09          	ldw	x,(OFST-1,sp)
1337  03cf 1c0030        	addw	x,#48
1338  03d2 160f          	ldw	y,(OFST+5,sp)
1339  03d4 90ef08        	ldw	(8,y),x
1340                     ; 361   *(p_tab+3) = tens + 0x30;
1342  03d7 1e07          	ldw	x,(OFST-3,sp)
1343  03d9 1c0030        	addw	x,#48
1344  03dc 160f          	ldw	y,(OFST+5,sp)
1345  03de 90ef06        	ldw	(6,y),x
1346                     ; 362   *(p_tab+2) = hundreds + 0x30;
1348  03e1 1e05          	ldw	x,(OFST-5,sp)
1349  03e3 1c0030        	addw	x,#48
1350  03e6 160f          	ldw	y,(OFST+5,sp)
1351  03e8 90ef04        	ldw	(4,y),x
1352                     ; 363   *(p_tab+1) = thousands + 0x30;
1354  03eb 1e03          	ldw	x,(OFST-7,sp)
1355  03ed 1c0030        	addw	x,#48
1356  03f0 160f          	ldw	y,(OFST+5,sp)
1357  03f2 90ef02        	ldw	(2,y),x
1358                     ; 364   *(p_tab) = misc + 0x30;
1360  03f5 1e01          	ldw	x,(OFST-9,sp)
1361  03f7 1c0030        	addw	x,#48
1362  03fa 160f          	ldw	y,(OFST+5,sp)
1363  03fc 90ff          	ldw	(y),x
1364                     ; 366 }
1367  03fe 5b0c          	addw	sp,#12
1368  0400 81            	ret
1403                     ; 376 void	LPR_Ram(void)
1403                     ; 377 #endif
1403                     ; 378 #ifdef _RAISONANCE_
1403                     ; 379 void	LPR_Ram(void) inram
1403                     ; 380 #endif
1403                     ; 381 #ifdef _IAR_
1403                     ; 382 #pragma location="MY_RAM_FUNC"
1403                     ; 383 void	LPR_Ram(void)
1403                     ; 384 #endif
1403                     ; 385 { 
1404                     .LPRUN:	section	.text
1405  0000               _LPR_Ram:
1407  0000 88            	push	a
1408       00000001      OFST:	set	1
1411                     ; 386   uint8_t i = 0;
1413                     ; 390   FLASH->CR1 = 0x08;
1415  0001 35085050      	mov	20560,#8
1417  0005               L374:
1418                     ; 391   while(((CLK->REGCSR)&0x80)==0x80);
1420  0005 c650cf        	ld	a,20687
1421  0008 a480          	and	a,#128
1422  000a a180          	cp	a,#128
1423  000c 27f7          	jreq	L374
1424                     ; 394   CLK->REGCSR = 0x02;
1426  000e 350250cf      	mov	20687,#2
1428  0012               L305:
1429                     ; 395   while(((CLK->REGCSR)&0x01)==0x01);
1431  0012 c650cf        	ld	a,20687
1432  0015 a401          	and	a,#1
1433  0017 a101          	cp	a,#1
1434  0019 27f7          	jreq	L305
1435                     ; 398   WFE->CR2 = 0x04;
1437  001b 350450a7      	mov	20647,#4
1438                     ; 399   GPIOE->CR2 = 0x44;
1440  001f 35445018      	mov	20504,#68
1441                     ; 401   for (i=0; i<100; i++);
1443  0023 0f01          	clr	(OFST+0,sp)
1445  0025               L705:
1449  0025 0c01          	inc	(OFST+0,sp)
1453  0027 7b01          	ld	a,(OFST+0,sp)
1454  0029 a164          	cp	a,#100
1455  002b 25f8          	jrult	L705
1456                     ; 404   GPIO_LOW(CTN_GPIO_PORT,CTN_CNTEN_GPIO_PIN);
1458  002d 7219500a      	bres	20490,#4
1459                     ; 407   wfe();
1462  0031 728f          wfe
1464                     ; 409   EXTI->SR1 |= 0x40;
1467  0033 721c50a3      	bset	20643,#6
1468                     ; 410   WFE->CR2 = 0x00;
1470  0037 725f50a7      	clr	20647
1471                     ; 413   CLK->REGCSR = 0x00;
1473  003b 725f50cf      	clr	20687
1475  003f               L125:
1476                     ; 414   while(((CLK->REGCSR)&0x1) != 0x1);		
1478  003f c650cf        	ld	a,20687
1479  0042 a401          	and	a,#1
1480  0044 a101          	cp	a,#1
1481  0046 26f7          	jrne	L125
1482                     ; 415 }
1485  0048 84            	pop	a
1486  0049 81            	ret
1516                     ; 427 void LPR_init(void)
1516                     ; 428 {
1517                     	switch	.text
1518  0401               _LPR_init:
1522                     ; 437     CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
1524  0401 4f            	clr	a
1525  0402 cd0000        	call	_CLK_SYSCLKDivConfig
1527                     ; 438     CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);
1529  0405 a602          	ld	a,#2
1530  0407 cd0000        	call	_CLK_SYSCLKSourceConfig
1532                     ; 439     CLK_SYSCLKSourceSwitchCmd(ENABLE);
1534  040a a601          	ld	a,#1
1535  040c cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
1538  040f               L735:
1539                     ; 440     while (((CLK->SWCR)& 0x01)==0x01);
1541  040f c650c9        	ld	a,20681
1542  0412 a401          	and	a,#1
1543  0414 a101          	cp	a,#1
1544  0416 27f7          	jreq	L735
1545                     ; 441     CLK_HSICmd(DISABLE);
1547  0418 4f            	clr	a
1548  0419 cd0000        	call	_CLK_HSICmd
1550                     ; 446   sim();
1553  041c 9b            sim
1555                     ; 450   if (!(_fctcpy('L')))
1558  041d a64c          	ld	a,#76
1559  041f cd0000        	call	__fctcpy
1561  0422 a30000        	cpw	x,#0
1562  0425 2602          	jrne	L345
1563  0427               L545:
1564                     ; 451     while(1);
1566  0427 20fe          	jra	L545
1567  0429               L345:
1568                     ; 454   LPR_Ram(); // Call in RAM
1570  0429 cd0000        	call	_LPR_Ram
1572                     ; 457   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_8);
1574  042c a603          	ld	a,#3
1575  042e cd0000        	call	_CLK_SYSCLKDivConfig
1577                     ; 458   CLK_HSICmd(ENABLE);
1579  0431 a601          	ld	a,#1
1580  0433 cd0000        	call	_CLK_HSICmd
1583  0436               L355:
1584                     ; 459   while (((CLK->ICKCR)& 0x02)!=0x02);
1586  0436 c650c2        	ld	a,20674
1587  0439 a402          	and	a,#2
1588  043b a102          	cp	a,#2
1589  043d 26f7          	jrne	L355
1590                     ; 461   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
1592  043f a601          	ld	a,#1
1593  0441 cd0000        	call	_CLK_SYSCLKSourceConfig
1595                     ; 462   CLK_SYSCLKSourceSwitchCmd(ENABLE);
1597  0444 a601          	ld	a,#1
1598  0446 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
1601  0449               L165:
1602                     ; 463   while (((CLK->SWCR)& 0x01)==0x01);
1604  0449 c650c9        	ld	a,20681
1605  044c a401          	and	a,#1
1606  044e a101          	cp	a,#1
1607  0450 27f7          	jreq	L165
1608                     ; 465 }
1611  0452 81            	ret
1665                     ; 491 float Vdd_appli(void)
1665                     ; 492 {
1666                     	switch	.text
1667  0453               _Vdd_appli:
1669  0453 520c          	subw	sp,#12
1670       0000000c      OFST:	set	12
1673                     ; 497   P_VREFINT_Factory = VREFINT_Factory_CONV_ADDRESS;
1675                     ; 500   MeasurINT = ADC_Supply();	
1677  0455 cd0000        	call	_ADC_Supply
1679  0458 1f07          	ldw	(OFST-5,sp),x
1681                     ; 522     f_Vdd_appli = (VREF/MeasurINT) * ADC_CONV;
1683  045a 1e07          	ldw	x,(OFST-5,sp)
1684  045c cd0000        	call	c_uitof
1686  045f 96            	ldw	x,sp
1687  0460 1c0001        	addw	x,#OFST-11
1688  0463 cd0000        	call	c_rtol
1691  0466 ae0016        	ldw	x,#L716
1692  0469 cd0000        	call	c_ltor
1694  046c 96            	ldw	x,sp
1695  046d 1c0001        	addw	x,#OFST-11
1696  0470 cd0000        	call	c_fdiv
1698  0473 ae001a        	ldw	x,#L373
1699  0476 cd0000        	call	c_fmul
1701  0479 96            	ldw	x,sp
1702  047a 1c0009        	addw	x,#OFST-3
1703  047d cd0000        	call	c_rtol
1706                     ; 526   f_Vdd_appli *= 1000L;
1708  0480 ae03e8        	ldw	x,#1000
1709  0483 cd0000        	call	c_itof
1711  0486 96            	ldw	x,sp
1712  0487 1c0009        	addw	x,#OFST-3
1713  048a cd0000        	call	c_fgmul
1716                     ; 528   return f_Vdd_appli;
1718  048d 96            	ldw	x,sp
1719  048e 1c0009        	addw	x,#OFST-3
1720  0491 cd0000        	call	c_ltor
1724  0494 5b0c          	addw	sp,#12
1725  0496 81            	ret
1772                     ; 537 uint16_t Vref_measure(void)
1772                     ; 538 {
1773                     	switch	.text
1774  0497               _Vref_measure:
1776  0497 520e          	subw	sp,#14
1777       0000000e      OFST:	set	14
1780                     ; 542   Vdd_mV = (uint16_t)Vdd_appli();
1782  0499 adb8          	call	_Vdd_appli
1784  049b cd0000        	call	c_ftoi
1786  049e 1f01          	ldw	(OFST-13,sp),x
1788                     ; 544   convert_into_char (Vdd_mV, tab);
1790  04a0 96            	ldw	x,sp
1791  04a1 1c0003        	addw	x,#OFST-11
1792  04a4 89            	pushw	x
1793  04a5 1e03          	ldw	x,(OFST-11,sp)
1794  04a7 cd0355        	call	_convert_into_char
1796  04aa 85            	popw	x
1797                     ; 547   tab[5] = 'V';
1799  04ab ae0056        	ldw	x,#86
1800  04ae 1f0d          	ldw	(OFST-1,sp),x
1802                     ; 548   tab[4] = ' ';
1804  04b0 ae0020        	ldw	x,#32
1805  04b3 1f0b          	ldw	(OFST-3,sp),x
1807                     ; 549   tab[1] |= DOT; /* To add decimal point for display in volt */
1809  04b5 7b05          	ld	a,(OFST-9,sp)
1810  04b7 aa80          	or	a,#128
1811  04b9 6b05          	ld	(OFST-9,sp),a
1813                     ; 550   tab[0] = ' ';
1815  04bb ae0020        	ldw	x,#32
1816  04be 1f03          	ldw	(OFST-11,sp),x
1818                     ; 552   LCD_GLASS_DisplayStrDeci(tab);
1820  04c0 96            	ldw	x,sp
1821  04c1 1c0003        	addw	x,#OFST-11
1822  04c4 cd0000        	call	_LCD_GLASS_DisplayStrDeci
1824                     ; 554   return Vdd_mV;
1826  04c7 1e01          	ldw	x,(OFST-13,sp)
1829  04c9 5b0e          	addw	sp,#14
1830  04cb 81            	ret
1876                     ; 563 void display_MuAmp (uint16_t Current)
1876                     ; 564 {
1877                     	switch	.text
1878  04cc               _display_MuAmp:
1880  04cc 89            	pushw	x
1881  04cd 520c          	subw	sp,#12
1882       0000000c      OFST:	set	12
1885                     ; 567   convert_into_char((int)Current, tab);
1887  04cf 96            	ldw	x,sp
1888  04d0 1c0001        	addw	x,#OFST-11
1889  04d3 89            	pushw	x
1890  04d4 1e0f          	ldw	x,(OFST+3,sp)
1891  04d6 cd0355        	call	_convert_into_char
1893  04d9 85            	popw	x
1894                     ; 568   tab[5] = 'A';
1896  04da ae0041        	ldw	x,#65
1897  04dd 1f0b          	ldw	(OFST-1,sp),x
1899                     ; 569   tab[4] = 'µ';
1901  04df ae00b5        	ldw	x,#181
1902  04e2 1f09          	ldw	(OFST-3,sp),x
1904                     ; 572   if ( tab[0] != '0')
1906  04e4 1e01          	ldw	x,(OFST-11,sp)
1907  04e6 a30030        	cpw	x,#48
1908  04e9 2708          	jreq	L766
1909                     ; 574     tab[1] |= DOT; /* To add decimal point */
1911  04eb 7b03          	ld	a,(OFST-9,sp)
1912  04ed aa80          	or	a,#128
1913  04ef 6b03          	ld	(OFST-9,sp),a
1916  04f1 2018          	jra	L176
1917  04f3               L766:
1918                     ; 577     tab[0] = tab[1] | DOT ;	
1920  04f3 1e03          	ldw	x,(OFST-9,sp)
1921  04f5 01            	rrwa	x,a
1922  04f6 aa00          	or	a,#0
1923  04f8 01            	rrwa	x,a
1924  04f9 aa80          	or	a,#128
1925  04fb 01            	rrwa	x,a
1926  04fc 1f01          	ldw	(OFST-11,sp),x
1928                     ; 578     tab[1] = tab[2] ;
1930  04fe 1e05          	ldw	x,(OFST-7,sp)
1931  0500 1f03          	ldw	(OFST-9,sp),x
1933                     ; 579     tab[2] = tab[3] ;		
1935  0502 1e07          	ldw	x,(OFST-5,sp)
1936  0504 1f05          	ldw	(OFST-7,sp),x
1938                     ; 580     tab[3] = ' ';
1940  0506 ae0020        	ldw	x,#32
1941  0509 1f07          	ldw	(OFST-5,sp),x
1943  050b               L176:
1944                     ; 583   LCD_GLASS_DisplayStrDeci(tab);
1946  050b 96            	ldw	x,sp
1947  050c 1c0001        	addw	x,#OFST-11
1948  050f cd0000        	call	_LCD_GLASS_DisplayStrDeci
1950                     ; 584 }
1953  0512 5b0e          	addw	sp,#14
1954  0514 81            	ret
2011                     ; 592 float Icc_measure_RUN(void)
2011                     ; 593 {
2012                     	switch	.text
2013  0515               _Icc_measure_RUN:
2015  0515 5216          	subw	sp,#22
2016       00000016      OFST:	set	22
2019                     ; 598   MeasurINT = ADC_Icc_Test(MCU_RUN);
2021  0517 4f            	clr	a
2022  0518 cd0000        	call	_ADC_Icc_Test
2024  051b 1f05          	ldw	(OFST-17,sp),x
2026                     ; 600   Run_Conso = MeasurINT * Vdd_appli()/ADC_CONV;
2028  051d 1e05          	ldw	x,(OFST-17,sp)
2029  051f cd0000        	call	c_uitof
2031  0522 96            	ldw	x,sp
2032  0523 1c0001        	addw	x,#OFST-21
2033  0526 cd0000        	call	c_rtol
2036  0529 cd0453        	call	_Vdd_appli
2038  052c 96            	ldw	x,sp
2039  052d 1c0001        	addw	x,#OFST-21
2040  0530 cd0000        	call	c_fmul
2042  0533 ae001a        	ldw	x,#L373
2043  0536 cd0000        	call	c_fdiv
2045  0539 96            	ldw	x,sp
2046  053a 1c0007        	addw	x,#OFST-15
2047  053d cd0000        	call	c_rtol
2050                     ; 601   Run_Conso *= 10L; 
2052  0540 a60a          	ld	a,#10
2053  0542 cd0000        	call	c_ctof
2055  0545 96            	ldw	x,sp
2056  0546 1c0007        	addw	x,#OFST-15
2057  0549 cd0000        	call	c_fgmul
2060                     ; 603   convert_into_char((int)(Run_Conso*10), tab);
2062  054c 96            	ldw	x,sp
2063  054d 1c000b        	addw	x,#OFST-11
2064  0550 89            	pushw	x
2065  0551 96            	ldw	x,sp
2066  0552 1c0009        	addw	x,#OFST-13
2067  0555 cd0000        	call	c_ltor
2069  0558 ae0012        	ldw	x,#L527
2070  055b cd0000        	call	c_fmul
2072  055e cd0000        	call	c_ftoi
2074  0561 cd0355        	call	_convert_into_char
2076  0564 85            	popw	x
2077                     ; 606   tab[5] = 'A';
2079  0565 ae0041        	ldw	x,#65
2080  0568 1f15          	ldw	(OFST-1,sp),x
2082                     ; 607   tab[4] = 'm';
2084  056a ae006d        	ldw	x,#109
2085  056d 1f13          	ldw	(OFST-3,sp),x
2087                     ; 608   tab[3] = ' ';
2089  056f ae0020        	ldw	x,#32
2090  0572 1f11          	ldw	(OFST-5,sp),x
2092                     ; 609   tab[0] |= DOT; /* To add decimal point for display in volt */
2094  0574 7b0b          	ld	a,(OFST-11,sp)
2095  0576 aa80          	or	a,#128
2096  0578 6b0b          	ld	(OFST-11,sp),a
2098                     ; 611   LCD_GLASS_DisplayStrDeci(tab);
2100  057a 96            	ldw	x,sp
2101  057b 1c000b        	addw	x,#OFST-11
2102  057e cd0000        	call	_LCD_GLASS_DisplayStrDeci
2104                     ; 613   return (Run_Conso);
2106  0581 96            	ldw	x,sp
2107  0582 1c0007        	addw	x,#OFST-15
2108  0585 cd0000        	call	c_ltor
2112  0588 5b16          	addw	sp,#22
2113  058a 81            	ret
2161                     ; 622 float Icc_measure_HALT(void)
2161                     ; 623 {
2162                     	switch	.text
2163  058b               _Icc_measure_HALT:
2165  058b 520a          	subw	sp,#10
2166       0000000a      OFST:	set	10
2169                     ; 628   MeasurINT = 223; //ADC_Icc_Test(MCU_HALT);
2171  058d ae00df        	ldw	x,#223
2172  0590 1f05          	ldw	(OFST-5,sp),x
2174                     ; 631   MeasurINT -=	Bias_Current;
2176  0592 c60000        	ld	a,_Bias_Current
2177  0595 5f            	clrw	x
2178  0596 97            	ld	xl,a
2179  0597 1f03          	ldw	(OFST-7,sp),x
2181  0599 1e05          	ldw	x,(OFST-5,sp)
2182  059b 72f003        	subw	x,(OFST-7,sp)
2183  059e 1f05          	ldw	(OFST-5,sp),x
2185                     ; 632   Current = MeasurINT * Vdd_appli()/ADC_CONV;  
2187  05a0 1e05          	ldw	x,(OFST-5,sp)
2188  05a2 cd0000        	call	c_uitof
2190  05a5 96            	ldw	x,sp
2191  05a6 1c0001        	addw	x,#OFST-9
2192  05a9 cd0000        	call	c_rtol
2195  05ac cd0453        	call	_Vdd_appli
2197  05af 96            	ldw	x,sp
2198  05b0 1c0001        	addw	x,#OFST-9
2199  05b3 cd0000        	call	c_fmul
2201  05b6 ae001a        	ldw	x,#L373
2202  05b9 cd0000        	call	c_fdiv
2204  05bc 96            	ldw	x,sp
2205  05bd 1c0007        	addw	x,#OFST-3
2206  05c0 cd0000        	call	c_rtol
2209                     ; 634   Current *= 10L;
2211  05c3 a60a          	ld	a,#10
2212  05c5 cd0000        	call	c_ctof
2214  05c8 96            	ldw	x,sp
2215  05c9 1c0007        	addw	x,#OFST-3
2216  05cc cd0000        	call	c_fgmul
2219                     ; 636   if ((int) Current<MAX_CURRENT)
2221  05cf 9c            	rvf
2222  05d0 96            	ldw	x,sp
2223  05d1 1c0007        	addw	x,#OFST-3
2224  05d4 cd0000        	call	c_ltor
2226  05d7 cd0000        	call	c_ftoi
2228  05da a3270f        	cpw	x,#9999
2229  05dd 2e0f          	jrsge	L357
2230                     ; 638     display_MuAmp((int)Current);
2232  05df 96            	ldw	x,sp
2233  05e0 1c0007        	addw	x,#OFST-3
2234  05e3 cd0000        	call	c_ltor
2236  05e6 cd0000        	call	c_ftoi
2238  05e9 cd04cc        	call	_display_MuAmp
2241  05ec 2009          	jra	L557
2242  05ee               L357:
2243                     ; 640     LCD_GLASS_Clear();
2245  05ee cd0000        	call	_LCD_GLASS_Clear
2247                     ; 641     LCD_GLASS_DisplayString("Error");
2249  05f1 ae000c        	ldw	x,#L757
2250  05f4 cd0000        	call	_LCD_GLASS_DisplayString
2252  05f7               L557:
2253                     ; 644   return(Current);
2255  05f7 96            	ldw	x,sp
2256  05f8 1c0007        	addw	x,#OFST-3
2257  05fb cd0000        	call	c_ltor
2261  05fe 5b0a          	addw	sp,#10
2262  0600 81            	ret
2312                     ; 653 float Icc_measure_LPR(void)
2312                     ; 654 {
2313                     	switch	.text
2314  0601               _Icc_measure_LPR:
2316  0601 520a          	subw	sp,#10
2317       0000000a      OFST:	set	10
2320                     ; 659   MeasurINT = ADC_Icc_Test(MCU_LPR);
2322  0603 a601          	ld	a,#1
2323  0605 cd0000        	call	_ADC_Icc_Test
2325  0608 1f05          	ldw	(OFST-5,sp),x
2327                     ; 662   MeasurINT -= Bias_Current;
2329  060a c60000        	ld	a,_Bias_Current
2330  060d 5f            	clrw	x
2331  060e 97            	ld	xl,a
2332  060f 1f03          	ldw	(OFST-7,sp),x
2334  0611 1e05          	ldw	x,(OFST-5,sp)
2335  0613 72f003        	subw	x,(OFST-7,sp)
2336  0616 1f05          	ldw	(OFST-5,sp),x
2338                     ; 664   Current = MeasurINT * Vdd_appli()/ADC_CONV; 
2340  0618 1e05          	ldw	x,(OFST-5,sp)
2341  061a cd0000        	call	c_uitof
2343  061d 96            	ldw	x,sp
2344  061e 1c0001        	addw	x,#OFST-9
2345  0621 cd0000        	call	c_rtol
2348  0624 cd0453        	call	_Vdd_appli
2350  0627 96            	ldw	x,sp
2351  0628 1c0001        	addw	x,#OFST-9
2352  062b cd0000        	call	c_fmul
2354  062e ae001a        	ldw	x,#L373
2355  0631 cd0000        	call	c_fdiv
2357  0634 96            	ldw	x,sp
2358  0635 1c0007        	addw	x,#OFST-3
2359  0638 cd0000        	call	c_rtol
2362                     ; 665   Current *= 10L;
2364  063b a60a          	ld	a,#10
2365  063d cd0000        	call	c_ctof
2367  0640 96            	ldw	x,sp
2368  0641 1c0007        	addw	x,#OFST-3
2369  0644 cd0000        	call	c_fgmul
2372                     ; 668   if ((int) Current<MAX_CURRENT)
2374  0647 9c            	rvf
2375  0648 96            	ldw	x,sp
2376  0649 1c0007        	addw	x,#OFST-3
2377  064c cd0000        	call	c_ltor
2379  064f cd0000        	call	c_ftoi
2381  0652 a3270f        	cpw	x,#9999
2382  0655 2e0f          	jrsge	L3001
2383                     ; 670     display_MuAmp((int)Current);
2385  0657 96            	ldw	x,sp
2386  0658 1c0007        	addw	x,#OFST-3
2387  065b cd0000        	call	c_ltor
2389  065e cd0000        	call	c_ftoi
2391  0661 cd04cc        	call	_display_MuAmp
2394  0664 200d          	jra	L5001
2395  0666               L3001:
2396                     ; 674     if (!Auto_test)
2398  0666 3d00          	tnz	_Auto_test
2399  0668 2609          	jrne	L5001
2400                     ; 676       LCD_GLASS_Clear();
2402  066a cd0000        	call	_LCD_GLASS_Clear
2404                     ; 677       LCD_GLASS_DisplayString("Error");
2406  066d ae000c        	ldw	x,#L757
2407  0670 cd0000        	call	_LCD_GLASS_DisplayString
2409  0673               L5001:
2410                     ; 681   return (Current);
2412  0673 96            	ldw	x,sp
2413  0674 1c0007        	addw	x,#OFST-3
2414  0677 cd0000        	call	c_ltor
2418  067a 5b0a          	addw	sp,#10
2419  067c 81            	ret
2467                     ; 690 void Icc_measure_LPR_LCD(void)
2467                     ; 691 {
2468                     	switch	.text
2469  067d               _Icc_measure_LPR_LCD:
2471  067d 520a          	subw	sp,#10
2472       0000000a      OFST:	set	10
2475                     ; 696   MeasurINT = ADC_Icc_Test(MCU_LPR_LCD);
2477  067f a604          	ld	a,#4
2478  0681 cd0000        	call	_ADC_Icc_Test
2480  0684 1f09          	ldw	(OFST-1,sp),x
2482                     ; 699   MeasurINT -= Bias_Current;
2484  0686 c60000        	ld	a,_Bias_Current
2485  0689 5f            	clrw	x
2486  068a 97            	ld	xl,a
2487  068b 1f03          	ldw	(OFST-7,sp),x
2489  068d 1e09          	ldw	x,(OFST-1,sp)
2490  068f 72f003        	subw	x,(OFST-7,sp)
2491  0692 1f09          	ldw	(OFST-1,sp),x
2493                     ; 701   Current = MeasurINT * Vdd_appli()/ADC_CONV; 
2495  0694 1e09          	ldw	x,(OFST-1,sp)
2496  0696 cd0000        	call	c_uitof
2498  0699 96            	ldw	x,sp
2499  069a 1c0001        	addw	x,#OFST-9
2500  069d cd0000        	call	c_rtol
2503  06a0 cd0453        	call	_Vdd_appli
2505  06a3 96            	ldw	x,sp
2506  06a4 1c0001        	addw	x,#OFST-9
2507  06a7 cd0000        	call	c_fmul
2509  06aa ae001a        	ldw	x,#L373
2510  06ad cd0000        	call	c_fdiv
2512  06b0 96            	ldw	x,sp
2513  06b1 1c0005        	addw	x,#OFST-5
2514  06b4 cd0000        	call	c_rtol
2517                     ; 702   Current *= 10L;
2519  06b7 a60a          	ld	a,#10
2520  06b9 cd0000        	call	c_ctof
2522  06bc 96            	ldw	x,sp
2523  06bd 1c0005        	addw	x,#OFST-5
2524  06c0 cd0000        	call	c_fgmul
2527                     ; 704   display_MuAmp((int)Current);
2529  06c3 96            	ldw	x,sp
2530  06c4 1c0005        	addw	x,#OFST-5
2531  06c7 cd0000        	call	c_ltor
2533  06ca cd0000        	call	c_ftoi
2535  06cd cd04cc        	call	_display_MuAmp
2537                     ; 706 }	
2540  06d0 5b0a          	addw	sp,#10
2541  06d2 81            	ret
2595                     	xdef	_LPR_Ram
2596                     	xdef	_test_LSE
2597                     	xref.b	_KeyPressed
2598                     	switch	.ubsct
2599  0000               _Auto_test:
2600  0000 00            	ds.b	1
2601                     	xdef	_Auto_test
2602                     	xdef	_Bias_Current
2603                     	xref	_LCD_GLASS_ScrollSentence
2604                     	xref	_LCD_GLASS_Clear
2605                     	xref	_LCD_GLASS_DisplayStrDeci
2606                     	xref	_LCD_GLASS_DisplayString
2607                     	xdef	_Vdd_appli
2608                     	xdef	_FLASH_ProgramBias
2609                     	xdef	_display_MuAmp
2610                     	xdef	_test_icc_HALT
2611                     	xdef	_test_icc_LP
2612                     	xdef	_test_icc_Run
2613                     	xdef	_test_vdd
2614                     	xdef	_Bias_measurement
2615                     	xdef	_auto_test
2616                     	xdef	_Icc_measure_LPR_LCD
2617                     	xdef	_Icc_measure_LPR
2618                     	xdef	_Icc_measure_HALT
2619                     	xdef	_Icc_measure_RUN
2620                     	xdef	_Vref_measure
2621                     	xdef	_LPR_init
2622                     	xdef	_convert_into_char
2623                     	xref	__fctcpy
2624                     	xref	_FLASH_WaitForLastOperation
2625                     	xref	_FLASH_Lock
2626                     	xref	_FLASH_Unlock
2627                     	xref	_CLK_SYSCLKSourceSwitchCmd
2628                     	xref	_CLK_SYSCLKDivConfig
2629                     	xref	_CLK_SYSCLKSourceConfig
2630                     	xref	_CLK_LSEConfig
2631                     	xref	_CLK_HSICmd
2632                     	xref	_delay_ms
2633                     	xref	_ADC_Icc_Test
2634                     	xref	_ADC_Supply
2635                     	switch	.const
2636  000c               L757:
2637  000c 4572726f7200  	dc.b	"Error",0
2638  0012               L527:
2639  0012 41200000      	dc.w	16672,0
2640  0016               L716:
2641  0016 3f9cac08      	dc.w	16284,-21496
2642  001a               L373:
2643  001a 45800000      	dc.w	17792,0
2644  001e               L563:
2645  001e 202020202020  	dc.b	"      ** BIAS CURR"
2646  0030 454e54202a2a  	dc.b	"ENT ** JP1 OFF **",0
2647  0042               L143:
2648  0042 54455354204f  	dc.b	"TEST OK ",0
2649  004b               L333:
2650  004b 205445535420  	dc.b	" TEST ",0
2651  0052               L572:
2652  0052 4c5345204f4b  	dc.b	"LSE OK",0
2653  0059               L752:
2654  0059 4c5345204e6f  	dc.b	"LSE Not OK ",0
2655  0065               L722:
2656  0065 4c534500      	dc.b	"LSE",0
2657  0069               L512:
2658  0069 4c50204f4b00  	dc.b	"LP OK",0
2659  006f               L312:
2660  006f 4c50204e6f74  	dc.b	"LP Not OK ",0
2661  007a               L571:
2662  007a 4c5000        	dc.b	"LP",0
2663  007d               L551:
2664  007d 48414c544f4b  	dc.b	"HALTOK",0
2665  0084               L351:
2666  0084 494343204841  	dc.b	"ICC HALT Not OK ",0
2667  0095               L531:
2668  0095 48414c5400    	dc.b	"HALT",0
2669  009a               L511:
2670  009a 52554e204f4b  	dc.b	"RUN OK",0
2671  00a1               L311:
2672  00a1 52554e204e6f  	dc.b	"RUN Not OK ",0
2673  00ad               L101:
2674  00ad 52554e00      	dc.b	"RUN",0
2675  00b1               L16:
2676  00b1 564444204f4b  	dc.b	"VDD OK",0
2677  00b8               L75:
2678  00b8 564444204e6f  	dc.b	"VDD Not OK ",0
2679  00c4               L54:
2680  00c4 56444400      	dc.b	"VDD",0
2681                     	xref.b	c_x
2701                     	xref	c_ctof
2702                     	xref	c_fgmul
2703                     	xref	c_uitof
2704                     	xref	c_ltor
2705                     	xref	c_bmulx
2706                     	xref	c_fmul
2707                     	xref	c_rtol
2708                     	xref	c_itof
2709                     	xref	c_fdiv
2710                     	xref	c_xymvx
2711                     	xref	c_ftoi
2712                     	end
