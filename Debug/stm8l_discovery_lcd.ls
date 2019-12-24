   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  15                     	bsct
  16  0000               _KeyPressed:
  17  0000 00            	dc.b	0
  18  0001               _t_bar:
  19  0001 00            	dc.b	0
  20  0002 00            	dc.b	0
  21                     .const:	section	.text
  22  0000               _CapLetterMap:
  23  0000 fe00          	dc.w	-512
  24  0002 6711          	dc.w	26385
  25  0004 1d00          	dc.w	7424
  26  0006 4711          	dc.w	18193
  27  0008 9d00          	dc.w	-25344
  28  000a 9c00          	dc.w	-25600
  29  000c 3f00          	dc.w	16128
  30  000e fa00          	dc.w	-1536
  31  0010 0011          	dc.w	17
  32  0012 5300          	dc.w	21248
  33  0014 9844          	dc.w	-26556
  34  0016 1900          	dc.w	6400
  35  0018 5a42          	dc.w	23106
  36  001a 5a06          	dc.w	23046
  37  001c 5f00          	dc.w	24320
  38  001e fc00          	dc.w	-1024
  39  0020 5f04          	dc.w	24324
  40  0022 fc04          	dc.w	-1020
  41  0024 af00          	dc.w	-20736
  42  0026 0411          	dc.w	1041
  43  0028 5b00          	dc.w	23296
  44  002a 18c0          	dc.w	6336
  45  002c 5a84          	dc.w	23172
  46  002e 00c6          	dc.w	198
  47  0030 0052          	dc.w	82
  48  0032 05c0          	dc.w	1472
  49  0034               _NumberMap:
  50  0034 5f00          	dc.w	24320
  51  0036 4200          	dc.w	16896
  52  0038 f500          	dc.w	-2816
  53  003a 6700          	dc.w	26368
  54  003c ea00          	dc.w	-5632
  55  003e af00          	dc.w	-20736
  56  0040 bf00          	dc.w	-16640
  57  0042 4600          	dc.w	17920
  58  0044 ff00          	dc.w	-256
  59  0046 ef00          	dc.w	-4352
  97                     ; 89 void LCD_GLASS_Init(void)
  97                     ; 90 {
  99                     	switch	.text
 100  0000               _LCD_GLASS_Init:
 104                     ; 93   CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
 106  0000 ae1201        	ldw	x,#4609
 107  0003 cd0000        	call	_CLK_PeripheralClockConfig
 109                     ; 94   CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);
 111  0006 ae1301        	ldw	x,#4865
 112  0009 cd0000        	call	_CLK_PeripheralClockConfig
 114                     ; 99     CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);
 116  000c ae0400        	ldw	x,#1024
 117  000f cd0000        	call	_CLK_RTCClockConfig
 119                     ; 103   LCD_Init(LCD_Prescaler_1, LCD_Divider_31, LCD_Duty_1_4, 
 119                     ; 104                                    LCD_Bias_1_3, LCD_VoltageSource_Internal);
 121  0012 4b00          	push	#0
 122  0014 4b00          	push	#0
 123  0016 4b06          	push	#6
 124  0018 ae000f        	ldw	x,#15
 125  001b cd0000        	call	_LCD_Init
 127  001e 5b03          	addw	sp,#3
 128                     ; 109   LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFF);
 130  0020 ae00ff        	ldw	x,#255
 131  0023 cd0000        	call	_LCD_PortMaskConfig
 133                     ; 110   LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFF);
 135  0026 ae01ff        	ldw	x,#511
 136  0029 cd0000        	call	_LCD_PortMaskConfig
 138                     ; 111   LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0xff);
 140  002c ae02ff        	ldw	x,#767
 141  002f cd0000        	call	_LCD_PortMaskConfig
 143                     ; 114   LCD_ContrastConfig(LCD_Contrast_3V0);
 145  0032 a608          	ld	a,#8
 146  0034 cd0000        	call	_LCD_ContrastConfig
 148                     ; 116   LCD_DeadTimeConfig(LCD_DeadTime_0);
 150  0037 4f            	clr	a
 151  0038 cd0000        	call	_LCD_DeadTimeConfig
 153                     ; 117   LCD_PulseOnDurationConfig(LCD_PulseOnDuration_1);
 155  003b a620          	ld	a,#32
 156  003d cd0000        	call	_LCD_PulseOnDurationConfig
 158                     ; 120   LCD_Cmd(ENABLE);
 160  0040 a601          	ld	a,#1
 161  0042 cd0000        	call	_LCD_Cmd
 163                     ; 121 }
 166  0045 81            	ret
 265                     ; 128 void LCD_contrast()
 265                     ; 129 {
 266                     	switch	.text
 267  0046               _LCD_contrast:
 269  0046 88            	push	a
 270       00000001      OFST:	set	1
 273                     ; 133   contrast = (LCD_Contrast_TypeDef) (LCD->CR2 & LCD_Contrast_3V3);
 275  0047 c65401        	ld	a,21505
 276  004a a40e          	and	a,#14
 277  004c 6b01          	ld	(OFST+0,sp),a
 280  004e 2017          	jra	L17
 281  0050               L56:
 282                     ; 137     contrast+=2;	
 284  0050 0c01          	inc	(OFST+0,sp)
 285  0052 0c01          	inc	(OFST+0,sp)
 287                     ; 138     if (contrast>LCD_Contrast_3V3)
 289  0054 7b01          	ld	a,(OFST+0,sp)
 290  0056 a10f          	cp	a,#15
 291  0058 2502          	jrult	L57
 292                     ; 139      contrast=LCD_Contrast_2V6;
 294  005a 0f01          	clr	(OFST+0,sp)
 296  005c               L57:
 297                     ; 141     LCD_ContrastConfig(contrast);
 299  005c 7b01          	ld	a,(OFST+0,sp)
 300  005e cd0000        	call	_LCD_ContrastConfig
 302                     ; 142     delay_ms(100);
 304  0061 ae0064        	ldw	x,#100
 305  0064 cd0000        	call	_delay_ms
 307  0067               L17:
 308                     ; 135   while ((GPIOC->IDR & USER_GPIO_PIN) == 0x0)
 310  0067 c6500b        	ld	a,20491
 311  006a a502          	bcp	a,#2
 312  006c 27e2          	jreq	L56
 313                     ; 144 }
 316  006e 84            	pop	a
 317  006f 81            	ret
 341                     ; 151 void LCD_bar()
 341                     ; 152 {
 342                     	switch	.text
 343  0070               _LCD_bar:
 347                     ; 154   LCD->RAM[LCD_RAMRegister_11] &= 0x5f;
 349  0070 c65417        	ld	a,21527
 350  0073 a45f          	and	a,#95
 351  0075 c75417        	ld	21527,a
 352                     ; 155   LCD->RAM[LCD_RAMRegister_11] |= t_bar[0]&0xa0;
 354  0078 b601          	ld	a,_t_bar
 355  007a a4a0          	and	a,#160
 356  007c ca5417        	or	a,21527
 357  007f c75417        	ld	21527,a
 358                     ; 158   LCD->RAM[LCD_RAMRegister_8] &= 0xf5;
 360  0082 c65414        	ld	a,21524
 361  0085 a4f5          	and	a,#245
 362  0087 c75414        	ld	21524,a
 363                     ; 159   LCD->RAM[LCD_RAMRegister_8] |= t_bar[1]&0x0a;
 365  008a b602          	ld	a,_t_bar+1
 366  008c a40a          	and	a,#10
 367  008e ca5414        	or	a,21524
 368  0091 c75414        	ld	21524,a
 369                     ; 160 }
 372  0094 81            	ret
 486                     	switch	.const
 487  0048               L61:
 488  0048 00e1          	dc.w	L121
 489  004a 00f8          	dc.w	L521
 490  004c 00f8          	dc.w	L521
 491  004e 00e8          	dc.w	L321
 492  0050 00e8          	dc.w	L321
 493  0052 00e8          	dc.w	L321
 494  0054 00e8          	dc.w	L321
 495  0056 00e8          	dc.w	L321
 496  0058 00e8          	dc.w	L321
 497  005a 00e8          	dc.w	L321
 498  005c 00e8          	dc.w	L321
 499  005e 00e8          	dc.w	L321
 500  0060 00e8          	dc.w	L321
 501                     ; 173 static void LCD_Conv_Char_Seg(uint8_t* c,bool point,bool column, uint8_t* digit)
 501                     ; 174 {
 502                     	switch	.text
 503  0095               L3_LCD_Conv_Char_Seg:
 505  0095 89            	pushw	x
 506  0096 5204          	subw	sp,#4
 507       00000004      OFST:	set	4
 510                     ; 175   uint16_t ch = 0 ;
 512  0098 5f            	clrw	x
 513  0099 1f03          	ldw	(OFST-1,sp),x
 515                     ; 178   switch (*c)
 517  009b 1e05          	ldw	x,(OFST+1,sp)
 518  009d f6            	ld	a,(x)
 520                     ; 228       break;
 521  009e a02d          	sub	a,#45
 522  00a0 a10d          	cp	a,#13
 523  00a2 2407          	jruge	L41
 524  00a4 5f            	clrw	x
 525  00a5 97            	ld	xl,a
 526  00a6 58            	sllw	x
 527  00a7 de0048        	ldw	x,(L61,x)
 528  00aa fc            	jp	(x)
 529  00ab               L41:
 530  00ab a0f3          	sub	a,#-13
 531  00ad 2711          	jreq	L701
 532  00af a00a          	sub	a,#10
 533  00b1 2712          	jreq	L111
 534  00b3 a043          	sub	a,#67
 535  00b5 271c          	jreq	L511
 536  00b7 4a            	dec	a
 537  00b8 2720          	jreq	L711
 538  00ba a047          	sub	a,#71
 539  00bc 270e          	jreq	L311
 540  00be 2038          	jra	L521
 541  00c0               L701:
 542                     ; 180     case ' ' : 
 542                     ; 181       ch = 0x00;
 544  00c0 5f            	clrw	x
 545  00c1 1f03          	ldw	(OFST-1,sp),x
 547                     ; 182       break;
 549  00c3 206b          	jra	L702
 550  00c5               L111:
 551                     ; 184     case '*':
 551                     ; 185       ch = star;
 553  00c5 aea0d7        	ldw	x,#41175
 554  00c8 1f03          	ldw	(OFST-1,sp),x
 556                     ; 186       break;
 558  00ca 2064          	jra	L702
 559  00cc               L311:
 560                     ; 188     case 'µ' :
 560                     ; 189       ch = C_UMAP;
 562  00cc ae6081        	ldw	x,#24705
 563  00cf 1f03          	ldw	(OFST-1,sp),x
 565                     ; 190       break;
 567  00d1 205d          	jra	L702
 568  00d3               L511:
 569                     ; 192     case 'm' :
 569                     ; 193       ch = C_mMap;
 571  00d3 aeb210        	ldw	x,#45584
 572  00d6 1f03          	ldw	(OFST-1,sp),x
 574                     ; 194       break;
 576  00d8 2056          	jra	L702
 577  00da               L711:
 578                     ; 196     case 'n' :
 578                     ; 197       ch = C_nMap;
 580  00da ae2210        	ldw	x,#8720
 581  00dd 1f03          	ldw	(OFST-1,sp),x
 583                     ; 198       break;					
 585  00df 204f          	jra	L702
 586  00e1               L121:
 587                     ; 200     case '-' :
 587                     ; 201       ch = C_minus;
 589  00e1 aea000        	ldw	x,#40960
 590  00e4 1f03          	ldw	(OFST-1,sp),x
 592                     ; 202       break;
 594  00e6 2048          	jra	L702
 595  00e8               L321:
 596                     ; 204     case '0':
 596                     ; 205     case '1':
 596                     ; 206     case '2':
 596                     ; 207     case '3':
 596                     ; 208     case '4':
 596                     ; 209     case '5':
 596                     ; 210     case '6':
 596                     ; 211     case '7':
 596                     ; 212     case '8':
 596                     ; 213     case '9':			
 596                     ; 214       ch = NumberMap[*c-0x30];		
 598  00e8 1e05          	ldw	x,(OFST+1,sp)
 599  00ea f6            	ld	a,(x)
 600  00eb 5f            	clrw	x
 601  00ec 97            	ld	xl,a
 602  00ed 58            	sllw	x
 603  00ee 1d0060        	subw	x,#96
 604  00f1 de0034        	ldw	x,(_NumberMap,x)
 605  00f4 1f03          	ldw	(OFST-1,sp),x
 607                     ; 215       break;
 609  00f6 2038          	jra	L702
 610  00f8               L521:
 611                     ; 217     default:
 611                     ; 218       /* The character c is one letter in upper case*/
 611                     ; 219       if ( (*c < 0x5b) && (*c > 0x40) )
 613  00f8 1e05          	ldw	x,(OFST+1,sp)
 614  00fa f6            	ld	a,(x)
 615  00fb a15b          	cp	a,#91
 616  00fd 2415          	jruge	L112
 618  00ff 1e05          	ldw	x,(OFST+1,sp)
 619  0101 f6            	ld	a,(x)
 620  0102 a141          	cp	a,#65
 621  0104 250e          	jrult	L112
 622                     ; 221         ch = CapLetterMap[*c-'A'];
 624  0106 1e05          	ldw	x,(OFST+1,sp)
 625  0108 f6            	ld	a,(x)
 626  0109 5f            	clrw	x
 627  010a 97            	ld	xl,a
 628  010b 58            	sllw	x
 629  010c 1d0082        	subw	x,#130
 630  010f de0000        	ldw	x,(_CapLetterMap,x)
 631  0112 1f03          	ldw	(OFST-1,sp),x
 633  0114               L112:
 634                     ; 224       if ( (*c <0x7b) && ( *c> 0x60) )
 636  0114 1e05          	ldw	x,(OFST+1,sp)
 637  0116 f6            	ld	a,(x)
 638  0117 a17b          	cp	a,#123
 639  0119 2415          	jruge	L702
 641  011b 1e05          	ldw	x,(OFST+1,sp)
 642  011d f6            	ld	a,(x)
 643  011e a161          	cp	a,#97
 644  0120 250e          	jrult	L702
 645                     ; 226         ch = CapLetterMap[*c-'a'];
 647  0122 1e05          	ldw	x,(OFST+1,sp)
 648  0124 f6            	ld	a,(x)
 649  0125 5f            	clrw	x
 650  0126 97            	ld	xl,a
 651  0127 58            	sllw	x
 652  0128 1d00c2        	subw	x,#194
 653  012b de0000        	ldw	x,(_CapLetterMap,x)
 654  012e 1f03          	ldw	(OFST-1,sp),x
 656  0130               L702:
 657                     ; 232   if (point)
 659  0130 0d09          	tnz	(OFST+5,sp)
 660  0132 2706          	jreq	L512
 661                     ; 234     ch |= 0x0008;
 663  0134 7b04          	ld	a,(OFST+0,sp)
 664  0136 aa08          	or	a,#8
 665  0138 6b04          	ld	(OFST+0,sp),a
 667  013a               L512:
 668                     ; 238   if (column)
 670  013a 0d0a          	tnz	(OFST+6,sp)
 671  013c 2706          	jreq	L712
 672                     ; 240     ch |= 0x0020;
 674  013e 7b04          	ld	a,(OFST+0,sp)
 675  0140 aa20          	or	a,#32
 676  0142 6b04          	ld	(OFST+0,sp),a
 678  0144               L712:
 679                     ; 243   for (i = 12,j=0 ;j<4; i-=4,j++)
 681  0144 a60c          	ld	a,#12
 682  0146 6b01          	ld	(OFST-3,sp),a
 684  0148 0f02          	clr	(OFST-2,sp)
 686  014a               L122:
 687                     ; 245     digit[j] = (ch >> i) & 0x0f; //To isolate the less signifiant dibit
 689  014a 7b0b          	ld	a,(OFST+7,sp)
 690  014c 97            	ld	xl,a
 691  014d 7b0c          	ld	a,(OFST+8,sp)
 692  014f 1b02          	add	a,(OFST-2,sp)
 693  0151 2401          	jrnc	L02
 694  0153 5c            	incw	x
 695  0154               L02:
 696  0154 02            	rlwa	x,a
 697  0155 89            	pushw	x
 698  0156 1e05          	ldw	x,(OFST+1,sp)
 699  0158 7b03          	ld	a,(OFST-1,sp)
 700  015a 4d            	tnz	a
 701  015b 2704          	jreq	L22
 702  015d               L42:
 703  015d 54            	srlw	x
 704  015e 4a            	dec	a
 705  015f 26fc          	jrne	L42
 706  0161               L22:
 707  0161 01            	rrwa	x,a
 708  0162 a40f          	and	a,#15
 709  0164 5f            	clrw	x
 710  0165 85            	popw	x
 711  0166 f7            	ld	(x),a
 712                     ; 243   for (i = 12,j=0 ;j<4; i-=4,j++)
 714  0167 7b01          	ld	a,(OFST-3,sp)
 715  0169 a004          	sub	a,#4
 716  016b 6b01          	ld	(OFST-3,sp),a
 718  016d 0c02          	inc	(OFST-2,sp)
 722  016f 7b02          	ld	a,(OFST-2,sp)
 723  0171 a104          	cp	a,#4
 724  0173 25d5          	jrult	L122
 725                     ; 247 }
 728  0175 5b06          	addw	sp,#6
 729  0177 81            	ret
 806                     ; 262 void LCD_GLASS_WriteChar(uint8_t* ch, bool point, bool column, uint8_t position)
 806                     ; 263 {
 807                     	switch	.text
 808  0178               _LCD_GLASS_WriteChar:
 810  0178 89            	pushw	x
 811  0179 5204          	subw	sp,#4
 812       00000004      OFST:	set	4
 815                     ; 267   LCD_Conv_Char_Seg(ch,point,column,digit);
 817  017b 96            	ldw	x,sp
 818  017c 1c0001        	addw	x,#OFST-3
 819  017f 89            	pushw	x
 820  0180 7b0c          	ld	a,(OFST+8,sp)
 821  0182 88            	push	a
 822  0183 7b0c          	ld	a,(OFST+8,sp)
 823  0185 88            	push	a
 824  0186 1e09          	ldw	x,(OFST+5,sp)
 825  0188 cd0095        	call	L3_LCD_Conv_Char_Seg
 827  018b 5b04          	addw	sp,#4
 828                     ; 269   switch (position)
 830  018d 7b0b          	ld	a,(OFST+7,sp)
 832                     ; 436       default:
 832                     ; 437               break;
 833  018f 4a            	dec	a
 834  0190 2722          	jreq	L722
 835  0192 4a            	dec	a
 836  0193 2603          	jrne	L03
 837  0195 cc025b        	jp	L132
 838  0198               L03:
 839  0198 4a            	dec	a
 840  0199 2603          	jrne	L23
 841  019b cc0303        	jp	L332
 842  019e               L23:
 843  019e 4a            	dec	a
 844  019f 2603          	jrne	L43
 845  01a1 cc03ad        	jp	L532
 846  01a4               L43:
 847  01a4 4a            	dec	a
 848  01a5 2603          	jrne	L63
 849  01a7 cc0458        	jp	L732
 850  01aa               L63:
 851  01aa 4a            	dec	a
 852  01ab 2603          	jrne	L04
 853  01ad cc04f7        	jp	L142
 854  01b0               L04:
 855  01b0 ac930593      	jpf	L503
 856  01b4               L722:
 857                     ; 272     case 1:
 857                     ; 273       LCD->RAM[LCD_RAMRegister_0] &= 0x0fc;
 859  01b4 c6540c        	ld	a,21516
 860  01b7 a4fc          	and	a,#252
 861  01b9 c7540c        	ld	21516,a
 862                     ; 274       LCD->RAM[LCD_RAMRegister_0] |= (uint8_t)(digit[0]& 0x03); // 1M 1E	
 864  01bc 7b01          	ld	a,(OFST-3,sp)
 865  01be a403          	and	a,#3
 866  01c0 ca540c        	or	a,21516
 867  01c3 c7540c        	ld	21516,a
 868                     ; 276       LCD->RAM[LCD_RAMRegister_2] &= 0x3f;
 870  01c6 c6540e        	ld	a,21518
 871  01c9 a43f          	and	a,#63
 872  01cb c7540e        	ld	21518,a
 873                     ; 277       LCD->RAM[LCD_RAMRegister_2] |= (uint8_t)((digit[0]<<4) & 0xc0); // 1G 1B
 875  01ce 7b01          	ld	a,(OFST-3,sp)
 876  01d0 97            	ld	xl,a
 877  01d1 a610          	ld	a,#16
 878  01d3 42            	mul	x,a
 879  01d4 9f            	ld	a,xl
 880  01d5 a4c0          	and	a,#192
 881  01d7 ca540e        	or	a,21518
 882  01da c7540e        	ld	21518,a
 883                     ; 279       LCD->RAM[LCD_RAMRegister_3] &= 0x0cf;
 885  01dd c6540f        	ld	a,21519
 886  01e0 a4cf          	and	a,#207
 887  01e2 c7540f        	ld	21519,a
 888                     ; 280       LCD->RAM[LCD_RAMRegister_3] |= (uint8_t)(digit[1]<<4 & 0x30); // 1C 1D
 890  01e5 7b02          	ld	a,(OFST-2,sp)
 891  01e7 97            	ld	xl,a
 892  01e8 a610          	ld	a,#16
 893  01ea 42            	mul	x,a
 894  01eb 9f            	ld	a,xl
 895  01ec a430          	and	a,#48
 896  01ee ca540f        	or	a,21519
 897  01f1 c7540f        	ld	21519,a
 898                     ; 282       LCD->RAM[LCD_RAMRegister_6] &= 0xf3;
 900  01f4 c65412        	ld	a,21522
 901  01f7 a4f3          	and	a,#243
 902  01f9 c75412        	ld	21522,a
 903                     ; 283       LCD->RAM[LCD_RAMRegister_6] |= (uint8_t)(digit[1]&0x0c); // 1F 1A
 905  01fc 7b02          	ld	a,(OFST-2,sp)
 906  01fe a40c          	and	a,#12
 907  0200 ca5412        	or	a,21522
 908  0203 c75412        	ld	21522,a
 909                     ; 285       LCD->RAM[LCD_RAMRegister_7] &= 0x0fc;
 911  0206 c65413        	ld	a,21523
 912  0209 a4fc          	and	a,#252
 913  020b c75413        	ld	21523,a
 914                     ; 286       LCD->RAM[LCD_RAMRegister_7] |= (uint8_t)(digit[2]&0x03); // 1Col 1P		
 916  020e 7b03          	ld	a,(OFST-1,sp)
 917  0210 a403          	and	a,#3
 918  0212 ca5413        	or	a,21523
 919  0215 c75413        	ld	21523,a
 920                     ; 288       LCD->RAM[LCD_RAMRegister_9] &= 0x3f;
 922  0218 c65415        	ld	a,21525
 923  021b a43f          	and	a,#63
 924  021d c75415        	ld	21525,a
 925                     ; 289       LCD->RAM[LCD_RAMRegister_9] |= (uint8_t)((digit[2]<<4) & 0xc0); // 1Q 1K										
 927  0220 7b03          	ld	a,(OFST-1,sp)
 928  0222 97            	ld	xl,a
 929  0223 a610          	ld	a,#16
 930  0225 42            	mul	x,a
 931  0226 9f            	ld	a,xl
 932  0227 a4c0          	and	a,#192
 933  0229 ca5415        	or	a,21525
 934  022c c75415        	ld	21525,a
 935                     ; 291       LCD->RAM[LCD_RAMRegister_10] &= 0xcf;
 937  022f c65416        	ld	a,21526
 938  0232 a4cf          	and	a,#207
 939  0234 c75416        	ld	21526,a
 940                     ; 292       LCD->RAM[LCD_RAMRegister_10] |= (uint8_t)((digit[3]<<2)& 0x30); // 1DP 1N	
 942  0237 7b04          	ld	a,(OFST+0,sp)
 943  0239 48            	sll	a
 944  023a 48            	sll	a
 945  023b a430          	and	a,#48
 946  023d ca5416        	or	a,21526
 947  0240 c75416        	ld	21526,a
 948                     ; 294       LCD->RAM[LCD_RAMRegister_13] &= 0xf3;
 950  0243 c65419        	ld	a,21529
 951  0246 a4f3          	and	a,#243
 952  0248 c75419        	ld	21529,a
 953                     ; 295       LCD->RAM[LCD_RAMRegister_13] |= (uint8_t)((digit[3]<<2) & 0x0c); // 1H 1J
 955  024b 7b04          	ld	a,(OFST+0,sp)
 956  024d 48            	sll	a
 957  024e 48            	sll	a
 958  024f a40c          	and	a,#12
 959  0251 ca5419        	or	a,21529
 960  0254 c75419        	ld	21529,a
 961                     ; 296       break;
 963  0257 ac930593      	jpf	L503
 964  025b               L132:
 965                     ; 299     case 2:
 965                     ; 300       LCD->RAM[LCD_RAMRegister_0] &= 0x0f3;
 967  025b c6540c        	ld	a,21516
 968  025e a4f3          	and	a,#243
 969  0260 c7540c        	ld	21516,a
 970                     ; 301       LCD->RAM[LCD_RAMRegister_0] |= (uint8_t)((digit[0]<<2)&0x0c); // 2M 2E	
 972  0263 7b01          	ld	a,(OFST-3,sp)
 973  0265 48            	sll	a
 974  0266 48            	sll	a
 975  0267 a40c          	and	a,#12
 976  0269 ca540c        	or	a,21516
 977  026c c7540c        	ld	21516,a
 978                     ; 303       LCD->RAM[LCD_RAMRegister_2] &= 0xcf;
 980  026f c6540e        	ld	a,21518
 981  0272 a4cf          	and	a,#207
 982  0274 c7540e        	ld	21518,a
 983                     ; 304       LCD->RAM[LCD_RAMRegister_2] |= (uint8_t)((digit[0]<<2)&0x30); // 2G 2B
 985  0277 7b01          	ld	a,(OFST-3,sp)
 986  0279 48            	sll	a
 987  027a 48            	sll	a
 988  027b a430          	and	a,#48
 989  027d ca540e        	or	a,21518
 990  0280 c7540e        	ld	21518,a
 991                     ; 306       LCD->RAM[LCD_RAMRegister_3] &= 0x3f;
 993  0283 c6540f        	ld	a,21519
 994  0286 a43f          	and	a,#63
 995  0288 c7540f        	ld	21519,a
 996                     ; 307       LCD->RAM[LCD_RAMRegister_3] |= (uint8_t)((digit[1]<<6) & 0xc0); // 2C 2D
 998  028b 7b02          	ld	a,(OFST-2,sp)
 999  028d 97            	ld	xl,a
1000  028e a640          	ld	a,#64
1001  0290 42            	mul	x,a
1002  0291 9f            	ld	a,xl
1003  0292 a4c0          	and	a,#192
1004  0294 ca540f        	or	a,21519
1005  0297 c7540f        	ld	21519,a
1006                     ; 309       LCD->RAM[LCD_RAMRegister_6] &= 0xfc;
1008  029a c65412        	ld	a,21522
1009  029d a4fc          	and	a,#252
1010  029f c75412        	ld	21522,a
1011                     ; 310       LCD->RAM[LCD_RAMRegister_6] |= (uint8_t)((digit[1]>>2)&0x03); // 2F 2A
1013  02a2 7b02          	ld	a,(OFST-2,sp)
1014  02a4 44            	srl	a
1015  02a5 44            	srl	a
1016  02a6 a403          	and	a,#3
1017  02a8 ca5412        	or	a,21522
1018  02ab c75412        	ld	21522,a
1019                     ; 312       LCD->RAM[LCD_RAMRegister_7] &= 0xf3;
1021  02ae c65413        	ld	a,21523
1022  02b1 a4f3          	and	a,#243
1023  02b3 c75413        	ld	21523,a
1024                     ; 313       LCD->RAM[LCD_RAMRegister_7] |= (uint8_t)((digit[2]<<2)& 0x0c); // 2Col 2P		
1026  02b6 7b03          	ld	a,(OFST-1,sp)
1027  02b8 48            	sll	a
1028  02b9 48            	sll	a
1029  02ba a40c          	and	a,#12
1030  02bc ca5413        	or	a,21523
1031  02bf c75413        	ld	21523,a
1032                     ; 315       LCD->RAM[LCD_RAMRegister_9] &= 0xcf;
1034  02c2 c65415        	ld	a,21525
1035  02c5 a4cf          	and	a,#207
1036  02c7 c75415        	ld	21525,a
1037                     ; 316       LCD->RAM[LCD_RAMRegister_9] |= (uint8_t)((digit[2]<<2)&0x30); // 2Q 2K										
1039  02ca 7b03          	ld	a,(OFST-1,sp)
1040  02cc 48            	sll	a
1041  02cd 48            	sll	a
1042  02ce a430          	and	a,#48
1043  02d0 ca5415        	or	a,21525
1044  02d3 c75415        	ld	21525,a
1045                     ; 318       LCD->RAM[LCD_RAMRegister_10] &= 0x3f;
1047  02d6 c65416        	ld	a,21526
1048  02d9 a43f          	and	a,#63
1049  02db c75416        	ld	21526,a
1050                     ; 319       LCD->RAM[LCD_RAMRegister_10] |= (uint8_t)((digit[3]<<4)& 0xC0); // 2DP 2N	
1052  02de 7b04          	ld	a,(OFST+0,sp)
1053  02e0 97            	ld	xl,a
1054  02e1 a610          	ld	a,#16
1055  02e3 42            	mul	x,a
1056  02e4 9f            	ld	a,xl
1057  02e5 a4c0          	and	a,#192
1058  02e7 ca5416        	or	a,21526
1059  02ea c75416        	ld	21526,a
1060                     ; 321       LCD->RAM[LCD_RAMRegister_13] &= 0xfc;
1062  02ed c65419        	ld	a,21529
1063  02f0 a4fc          	and	a,#252
1064  02f2 c75419        	ld	21529,a
1065                     ; 322       LCD->RAM[LCD_RAMRegister_13] |= (uint8_t)((digit[3])& 0x03); // 2H 2J
1067  02f5 7b04          	ld	a,(OFST+0,sp)
1068  02f7 a403          	and	a,#3
1069  02f9 ca5419        	or	a,21529
1070  02fc c75419        	ld	21529,a
1071                     ; 323       break;
1073  02ff ac930593      	jpf	L503
1074  0303               L332:
1075                     ; 326     case 3:
1075                     ; 327       LCD->RAM[LCD_RAMRegister_0] &= 0xcf;
1077  0303 c6540c        	ld	a,21516
1078  0306 a4cf          	and	a,#207
1079  0308 c7540c        	ld	21516,a
1080                     ; 328       LCD->RAM[LCD_RAMRegister_0] |= (uint8_t)(digit[0]<<4) & 0x30; // 3M 3E	
1082  030b 7b01          	ld	a,(OFST-3,sp)
1083  030d 97            	ld	xl,a
1084  030e a610          	ld	a,#16
1085  0310 42            	mul	x,a
1086  0311 9f            	ld	a,xl
1087  0312 a430          	and	a,#48
1088  0314 ca540c        	or	a,21516
1089  0317 c7540c        	ld	21516,a
1090                     ; 330       LCD->RAM[LCD_RAMRegister_2] &= 0xf3;
1092  031a c6540e        	ld	a,21518
1093  031d a4f3          	and	a,#243
1094  031f c7540e        	ld	21518,a
1095                     ; 331       LCD->RAM[LCD_RAMRegister_2] |= (uint8_t)(digit[0]) & 0x0c; // 3G 3B
1097  0322 7b01          	ld	a,(OFST-3,sp)
1098  0324 a40c          	and	a,#12
1099  0326 ca540e        	or	a,21518
1100  0329 c7540e        	ld	21518,a
1101                     ; 333       LCD->RAM[LCD_RAMRegister_4] &= 0xfc;
1103  032c c65410        	ld	a,21520
1104  032f a4fc          	and	a,#252
1105  0331 c75410        	ld	21520,a
1106                     ; 334       LCD->RAM[LCD_RAMRegister_4] |= (uint8_t)(digit[1]) & 0x03; // 3C 3D
1108  0334 7b02          	ld	a,(OFST-2,sp)
1109  0336 a403          	and	a,#3
1110  0338 ca5410        	or	a,21520
1111  033b c75410        	ld	21520,a
1112                     ; 336       LCD->RAM[LCD_RAMRegister_5] &= 0x3f;
1114  033e c65411        	ld	a,21521
1115  0341 a43f          	and	a,#63
1116  0343 c75411        	ld	21521,a
1117                     ; 337       LCD->RAM[LCD_RAMRegister_5] |= (uint8_t)(digit[1]<<4) & 0xc0; // 3F 3A
1119  0346 7b02          	ld	a,(OFST-2,sp)
1120  0348 97            	ld	xl,a
1121  0349 a610          	ld	a,#16
1122  034b 42            	mul	x,a
1123  034c 9f            	ld	a,xl
1124  034d a4c0          	and	a,#192
1125  034f ca5411        	or	a,21521
1126  0352 c75411        	ld	21521,a
1127                     ; 339       LCD->RAM[LCD_RAMRegister_7] &= 0xcf;
1129  0355 c65413        	ld	a,21523
1130  0358 a4cf          	and	a,#207
1131  035a c75413        	ld	21523,a
1132                     ; 340       LCD->RAM[LCD_RAMRegister_7] |= (uint8_t)(digit[2]<<4)&0x30; // 3Col 3P		
1134  035d 7b03          	ld	a,(OFST-1,sp)
1135  035f 97            	ld	xl,a
1136  0360 a610          	ld	a,#16
1137  0362 42            	mul	x,a
1138  0363 9f            	ld	a,xl
1139  0364 a430          	and	a,#48
1140  0366 ca5413        	or	a,21523
1141  0369 c75413        	ld	21523,a
1142                     ; 342       LCD->RAM[LCD_RAMRegister_9] &= 0xf3;
1144  036c c65415        	ld	a,21525
1145  036f a4f3          	and	a,#243
1146  0371 c75415        	ld	21525,a
1147                     ; 343       LCD->RAM[LCD_RAMRegister_9] |= (uint8_t)(digit[2]) & 0x0C;  // 3Q 3K										
1149  0374 7b03          	ld	a,(OFST-1,sp)
1150  0376 a40c          	and	a,#12
1151  0378 ca5415        	or	a,21525
1152  037b c75415        	ld	21525,a
1153                     ; 345       LCD->RAM[LCD_RAMRegister_11] &= 0xfc;
1155  037e c65417        	ld	a,21527
1156  0381 a4fc          	and	a,#252
1157  0383 c75417        	ld	21527,a
1158                     ; 346       LCD->RAM[LCD_RAMRegister_11] |= (uint8_t)(digit[3]>>2) & 0x03 ; // 3DP 3N	
1160  0386 7b04          	ld	a,(OFST+0,sp)
1161  0388 44            	srl	a
1162  0389 44            	srl	a
1163  038a a403          	and	a,#3
1164  038c ca5417        	or	a,21527
1165  038f c75417        	ld	21527,a
1166                     ; 348       LCD->RAM[LCD_RAMRegister_12] &= 0x3f;
1168  0392 c65418        	ld	a,21528
1169  0395 a43f          	and	a,#63
1170  0397 c75418        	ld	21528,a
1171                     ; 349       LCD->RAM[LCD_RAMRegister_12] |= (uint8_t)(digit[3]<<6) & 0xc0; // 3H 3J
1173  039a 7b04          	ld	a,(OFST+0,sp)
1174  039c 97            	ld	xl,a
1175  039d a640          	ld	a,#64
1176  039f 42            	mul	x,a
1177  03a0 9f            	ld	a,xl
1178  03a1 a4c0          	and	a,#192
1179  03a3 ca5418        	or	a,21528
1180  03a6 c75418        	ld	21528,a
1181                     ; 350       break;
1183  03a9 ac930593      	jpf	L503
1184  03ad               L532:
1185                     ; 353     case 4:
1185                     ; 354       LCD->RAM[LCD_RAMRegister_0] &= 0x3f;
1187  03ad c6540c        	ld	a,21516
1188  03b0 a43f          	and	a,#63
1189  03b2 c7540c        	ld	21516,a
1190                     ; 355       LCD->RAM[LCD_RAMRegister_0] |= (uint8_t)(digit[0]<<6) & 0xc0; // 4M 4E	
1192  03b5 7b01          	ld	a,(OFST-3,sp)
1193  03b7 97            	ld	xl,a
1194  03b8 a640          	ld	a,#64
1195  03ba 42            	mul	x,a
1196  03bb 9f            	ld	a,xl
1197  03bc a4c0          	and	a,#192
1198  03be ca540c        	or	a,21516
1199  03c1 c7540c        	ld	21516,a
1200                     ; 357       LCD->RAM[LCD_RAMRegister_2] &= 0xfc;
1202  03c4 c6540e        	ld	a,21518
1203  03c7 a4fc          	and	a,#252
1204  03c9 c7540e        	ld	21518,a
1205                     ; 358       LCD->RAM[LCD_RAMRegister_2] |= (uint8_t)(digit[0]>>2) & 0x03; // 4G 4B
1207  03cc 7b01          	ld	a,(OFST-3,sp)
1208  03ce 44            	srl	a
1209  03cf 44            	srl	a
1210  03d0 a403          	and	a,#3
1211  03d2 ca540e        	or	a,21518
1212  03d5 c7540e        	ld	21518,a
1213                     ; 360       LCD->RAM[LCD_RAMRegister_4] &= 0xf3;
1215  03d8 c65410        	ld	a,21520
1216  03db a4f3          	and	a,#243
1217  03dd c75410        	ld	21520,a
1218                     ; 361       LCD->RAM[LCD_RAMRegister_4] |= (uint8_t)(digit[1]<<2) & 0x0C; // 4C 4D
1220  03e0 7b02          	ld	a,(OFST-2,sp)
1221  03e2 48            	sll	a
1222  03e3 48            	sll	a
1223  03e4 a40c          	and	a,#12
1224  03e6 ca5410        	or	a,21520
1225  03e9 c75410        	ld	21520,a
1226                     ; 363       LCD->RAM[LCD_RAMRegister_5] &= 0xcf;
1228  03ec c65411        	ld	a,21521
1229  03ef a4cf          	and	a,#207
1230  03f1 c75411        	ld	21521,a
1231                     ; 364       LCD->RAM[LCD_RAMRegister_5] |= (uint8_t)(digit[1]<<2) & 0x30; // 4F 4A
1233  03f4 7b02          	ld	a,(OFST-2,sp)
1234  03f6 48            	sll	a
1235  03f7 48            	sll	a
1236  03f8 a430          	and	a,#48
1237  03fa ca5411        	or	a,21521
1238  03fd c75411        	ld	21521,a
1239                     ; 366       LCD->RAM[LCD_RAMRegister_7] &= 0x3f;
1241  0400 c65413        	ld	a,21523
1242  0403 a43f          	and	a,#63
1243  0405 c75413        	ld	21523,a
1244                     ; 367       LCD->RAM[LCD_RAMRegister_7] |= (uint8_t)(digit[2]<<6) & 0xC0; // 4Col 4P		
1246  0408 7b03          	ld	a,(OFST-1,sp)
1247  040a 97            	ld	xl,a
1248  040b a640          	ld	a,#64
1249  040d 42            	mul	x,a
1250  040e 9f            	ld	a,xl
1251  040f a4c0          	and	a,#192
1252  0411 ca5413        	or	a,21523
1253  0414 c75413        	ld	21523,a
1254                     ; 369       LCD->RAM[LCD_RAMRegister_9] &= 0xfc;				
1256  0417 c65415        	ld	a,21525
1257  041a a4fc          	and	a,#252
1258  041c c75415        	ld	21525,a
1259                     ; 370       LCD->RAM[LCD_RAMRegister_9] |= (uint8_t)(digit[2]>>2) & 0x03 ; // 4Q 4K										
1261  041f 7b03          	ld	a,(OFST-1,sp)
1262  0421 44            	srl	a
1263  0422 44            	srl	a
1264  0423 a403          	and	a,#3
1265  0425 ca5415        	or	a,21525
1266  0428 c75415        	ld	21525,a
1267                     ; 372       LCD->RAM[LCD_RAMRegister_11] &= 0xf3;				
1269  042b c65417        	ld	a,21527
1270  042e a4f3          	and	a,#243
1271  0430 c75417        	ld	21527,a
1272                     ; 373       LCD->RAM[LCD_RAMRegister_11] |= (uint8_t)(digit[3]) & 0x0C; // 4DP 4N	
1274  0433 7b04          	ld	a,(OFST+0,sp)
1275  0435 a40c          	and	a,#12
1276  0437 ca5417        	or	a,21527
1277  043a c75417        	ld	21527,a
1278                     ; 375       LCD->RAM[LCD_RAMRegister_12] &= 0xcf;				
1280  043d c65418        	ld	a,21528
1281  0440 a4cf          	and	a,#207
1282  0442 c75418        	ld	21528,a
1283                     ; 376       LCD->RAM[LCD_RAMRegister_12] |= (uint8_t)(digit[3]<<4) & 0x30; // 4H 4J
1285  0445 7b04          	ld	a,(OFST+0,sp)
1286  0447 97            	ld	xl,a
1287  0448 a610          	ld	a,#16
1288  044a 42            	mul	x,a
1289  044b 9f            	ld	a,xl
1290  044c a430          	and	a,#48
1291  044e ca5418        	or	a,21528
1292  0451 c75418        	ld	21528,a
1293                     ; 377       break;
1295  0454 ac930593      	jpf	L503
1296  0458               L732:
1297                     ; 380     case 5:
1297                     ; 381       LCD->RAM[LCD_RAMRegister_1] &= 0xfc;
1299  0458 c6540d        	ld	a,21517
1300  045b a4fc          	and	a,#252
1301  045d c7540d        	ld	21517,a
1302                     ; 382       LCD->RAM[LCD_RAMRegister_1] |=  (uint8_t)(digit[0]) & 0x03; // 5M 5E	
1304  0460 7b01          	ld	a,(OFST-3,sp)
1305  0462 a403          	and	a,#3
1306  0464 ca540d        	or	a,21517
1307  0467 c7540d        	ld	21517,a
1308                     ; 384       LCD->RAM[LCD_RAMRegister_1] &= 0x3f;
1310  046a c6540d        	ld	a,21517
1311  046d a43f          	and	a,#63
1312  046f c7540d        	ld	21517,a
1313                     ; 385       LCD->RAM[LCD_RAMRegister_1] |=  (uint8_t)(digit[0]<<4) & 0xc0; // 5G 5B
1315  0472 7b01          	ld	a,(OFST-3,sp)
1316  0474 97            	ld	xl,a
1317  0475 a610          	ld	a,#16
1318  0477 42            	mul	x,a
1319  0478 9f            	ld	a,xl
1320  0479 a4c0          	and	a,#192
1321  047b ca540d        	or	a,21517
1322  047e c7540d        	ld	21517,a
1323                     ; 387       LCD->RAM[LCD_RAMRegister_4] &= 0xcf;				
1325  0481 c65410        	ld	a,21520
1326  0484 a4cf          	and	a,#207
1327  0486 c75410        	ld	21520,a
1328                     ; 388       LCD->RAM[LCD_RAMRegister_4] |= (uint8_t)(digit[1]<<4) & 0x30; // 5C 5D
1330  0489 7b02          	ld	a,(OFST-2,sp)
1331  048b 97            	ld	xl,a
1332  048c a610          	ld	a,#16
1333  048e 42            	mul	x,a
1334  048f 9f            	ld	a,xl
1335  0490 a430          	and	a,#48
1336  0492 ca5410        	or	a,21520
1337  0495 c75410        	ld	21520,a
1338                     ; 390       LCD->RAM[LCD_RAMRegister_5] &= 0xf3;				
1340  0498 c65411        	ld	a,21521
1341  049b a4f3          	and	a,#243
1342  049d c75411        	ld	21521,a
1343                     ; 391       LCD->RAM[LCD_RAMRegister_5] |=  (uint8_t)(digit[1]) & 0x0c; // 5F 5A
1345  04a0 7b02          	ld	a,(OFST-2,sp)
1346  04a2 a40c          	and	a,#12
1347  04a4 ca5411        	or	a,21521
1348  04a7 c75411        	ld	21521,a
1349                     ; 395       LCD->RAM[LCD_RAMRegister_8] &= 0xfe;
1351  04aa 72115414      	bres	21524,#0
1352                     ; 396       LCD->RAM[LCD_RAMRegister_8] |=  (uint8_t)(digit[2]) & 0x01; //  5P	
1354  04ae 7b03          	ld	a,(OFST-1,sp)
1355  04b0 a401          	and	a,#1
1356  04b2 ca5414        	or	a,21524
1357  04b5 c75414        	ld	21524,a
1358                     ; 398       LCD->RAM[LCD_RAMRegister_8] &= 0x3f;					
1360  04b8 c65414        	ld	a,21524
1361  04bb a43f          	and	a,#63
1362  04bd c75414        	ld	21524,a
1363                     ; 399       LCD->RAM[LCD_RAMRegister_8] |=  (uint8_t)(digit[2]<<4) & 0xc0; // 5Q 5K										
1365  04c0 7b03          	ld	a,(OFST-1,sp)
1366  04c2 97            	ld	xl,a
1367  04c3 a610          	ld	a,#16
1368  04c5 42            	mul	x,a
1369  04c6 9f            	ld	a,xl
1370  04c7 a4c0          	and	a,#192
1371  04c9 ca5414        	or	a,21524
1372  04cc c75414        	ld	21524,a
1373                     ; 401       LCD->RAM[LCD_RAMRegister_11] &= 0xef;				
1375  04cf 72195417      	bres	21527,#4
1376                     ; 402       LCD->RAM[LCD_RAMRegister_11] |=  (uint8_t)(digit[3]<<2) & 0x10; // 5N	
1378  04d3 7b04          	ld	a,(OFST+0,sp)
1379  04d5 48            	sll	a
1380  04d6 48            	sll	a
1381  04d7 a410          	and	a,#16
1382  04d9 ca5417        	or	a,21527
1383  04dc c75417        	ld	21527,a
1384                     ; 404       LCD->RAM[LCD_RAMRegister_12] &= 0xf3;				
1386  04df c65418        	ld	a,21528
1387  04e2 a4f3          	and	a,#243
1388  04e4 c75418        	ld	21528,a
1389                     ; 405       LCD->RAM[LCD_RAMRegister_12] |=  (uint8_t)(digit[3]<<2) & 0x0C; // 5H 5J
1391  04e7 7b04          	ld	a,(OFST+0,sp)
1392  04e9 48            	sll	a
1393  04ea 48            	sll	a
1394  04eb a40c          	and	a,#12
1395  04ed ca5418        	or	a,21528
1396  04f0 c75418        	ld	21528,a
1397                     ; 406       break;
1399  04f3 ac930593      	jpf	L503
1400  04f7               L142:
1401                     ; 409     case 6:
1401                     ; 410       LCD->RAM[LCD_RAMRegister_1] &= 0xf3;
1403  04f7 c6540d        	ld	a,21517
1404  04fa a4f3          	and	a,#243
1405  04fc c7540d        	ld	21517,a
1406                     ; 411       LCD->RAM[LCD_RAMRegister_1] |=  (uint8_t)(digit[0]<<2) & 0x0C; // 6M 6E	
1408  04ff 7b01          	ld	a,(OFST-3,sp)
1409  0501 48            	sll	a
1410  0502 48            	sll	a
1411  0503 a40c          	and	a,#12
1412  0505 ca540d        	or	a,21517
1413  0508 c7540d        	ld	21517,a
1414                     ; 413       LCD->RAM[LCD_RAMRegister_1] &= 0xcf;				
1416  050b c6540d        	ld	a,21517
1417  050e a4cf          	and	a,#207
1418  0510 c7540d        	ld	21517,a
1419                     ; 414       LCD->RAM[LCD_RAMRegister_1] |=  (uint8_t)(digit[0]<<2) & 0x30; // 6G 6B
1421  0513 7b01          	ld	a,(OFST-3,sp)
1422  0515 48            	sll	a
1423  0516 48            	sll	a
1424  0517 a430          	and	a,#48
1425  0519 ca540d        	or	a,21517
1426  051c c7540d        	ld	21517,a
1427                     ; 416       LCD->RAM[LCD_RAMRegister_4] &= 0x3f;				
1429  051f c65410        	ld	a,21520
1430  0522 a43f          	and	a,#63
1431  0524 c75410        	ld	21520,a
1432                     ; 417       LCD->RAM[LCD_RAMRegister_4] |= (uint8_t)(digit[1]<<6) & 0xc0; // 6C 6D
1434  0527 7b02          	ld	a,(OFST-2,sp)
1435  0529 97            	ld	xl,a
1436  052a a640          	ld	a,#64
1437  052c 42            	mul	x,a
1438  052d 9f            	ld	a,xl
1439  052e a4c0          	and	a,#192
1440  0530 ca5410        	or	a,21520
1441  0533 c75410        	ld	21520,a
1442                     ; 419       LCD->RAM[LCD_RAMRegister_5] &= 0xfc;				
1444  0536 c65411        	ld	a,21521
1445  0539 a4fc          	and	a,#252
1446  053b c75411        	ld	21521,a
1447                     ; 420       LCD->RAM[LCD_RAMRegister_5] |=  (uint8_t)(digit[1]>>2) & 0x03; // 6F 6A
1449  053e 7b02          	ld	a,(OFST-2,sp)
1450  0540 44            	srl	a
1451  0541 44            	srl	a
1452  0542 a403          	and	a,#3
1453  0544 ca5411        	or	a,21521
1454  0547 c75411        	ld	21521,a
1455                     ; 422       LCD->RAM[LCD_RAMRegister_8] &= 0xfb;
1457  054a 72155414      	bres	21524,#2
1458                     ; 423       LCD->RAM[LCD_RAMRegister_8] |=  (uint8_t)(digit[2]<<2) & 0x04; //  6P	
1460  054e 7b03          	ld	a,(OFST-1,sp)
1461  0550 48            	sll	a
1462  0551 48            	sll	a
1463  0552 a404          	and	a,#4
1464  0554 ca5414        	or	a,21524
1465  0557 c75414        	ld	21524,a
1466                     ; 426       LCD->RAM[LCD_RAMRegister_8] &= 0xcf;					
1468  055a c65414        	ld	a,21524
1469  055d a4cf          	and	a,#207
1470  055f c75414        	ld	21524,a
1471                     ; 427       LCD->RAM[LCD_RAMRegister_8] |=  (uint8_t)(digit[2]<<2) & 0x30; // 6Q 6K	
1473  0562 7b03          	ld	a,(OFST-1,sp)
1474  0564 48            	sll	a
1475  0565 48            	sll	a
1476  0566 a430          	and	a,#48
1477  0568 ca5414        	or	a,21524
1478  056b c75414        	ld	21524,a
1479                     ; 429       LCD->RAM[LCD_RAMRegister_11] &= 0xbf;				
1481  056e 721d5417      	bres	21527,#6
1482                     ; 430       LCD->RAM[LCD_RAMRegister_11] |=  (uint8_t)(digit[3]<<4) & 0x40; // 6N	
1484  0572 7b04          	ld	a,(OFST+0,sp)
1485  0574 97            	ld	xl,a
1486  0575 a610          	ld	a,#16
1487  0577 42            	mul	x,a
1488  0578 9f            	ld	a,xl
1489  0579 a440          	and	a,#64
1490  057b ca5417        	or	a,21527
1491  057e c75417        	ld	21527,a
1492                     ; 432       LCD->RAM[LCD_RAMRegister_12] &= 0xfc;				
1494  0581 c65418        	ld	a,21528
1495  0584 a4fc          	and	a,#252
1496  0586 c75418        	ld	21528,a
1497                     ; 433       LCD->RAM[LCD_RAMRegister_12] |= (uint8_t)(digit[3]) & 0x03; // 6H	6J
1499  0589 7b04          	ld	a,(OFST+0,sp)
1500  058b a403          	and	a,#3
1501  058d ca5418        	or	a,21528
1502  0590 c75418        	ld	21528,a
1503                     ; 434       break;
1505  0593               L342:
1506                     ; 436       default:
1506                     ; 437               break;
1508  0593               L503:
1509                     ; 441 	LCD_bar();
1511  0593 cd0070        	call	_LCD_bar
1513                     ; 442 }
1516  0596 5b06          	addw	sp,#6
1517  0598 81            	ret
1564                     ; 449 void LCD_GLASS_DisplayString(uint8_t* ptr)
1564                     ; 450 {
1565                     	switch	.text
1566  0599               _LCD_GLASS_DisplayString:
1568  0599 89            	pushw	x
1569  059a 88            	push	a
1570       00000001      OFST:	set	1
1573                     ; 451   uint8_t i = 0x01;
1575  059b a601          	ld	a,#1
1576  059d 6b01          	ld	(OFST+0,sp),a
1578                     ; 453 	LCD_GLASS_Clear();
1580  059f cd063c        	call	_LCD_GLASS_Clear
1583  05a2 2017          	jra	L333
1584  05a4               L133:
1585                     ; 458     LCD_GLASS_WriteChar(ptr, FALSE, FALSE, i);
1587  05a4 7b01          	ld	a,(OFST+0,sp)
1588  05a6 88            	push	a
1589  05a7 4b00          	push	#0
1590  05a9 4b00          	push	#0
1591  05ab 1e05          	ldw	x,(OFST+4,sp)
1592  05ad cd0178        	call	_LCD_GLASS_WriteChar
1594  05b0 5b03          	addw	sp,#3
1595                     ; 461     ptr++;
1597  05b2 1e02          	ldw	x,(OFST+1,sp)
1598  05b4 1c0001        	addw	x,#1
1599  05b7 1f02          	ldw	(OFST+1,sp),x
1600                     ; 464     i++;
1602  05b9 0c01          	inc	(OFST+0,sp)
1604  05bb               L333:
1605                     ; 455   while ((*ptr != 0) & (i < 8))
1607  05bb 1e02          	ldw	x,(OFST+1,sp)
1608  05bd 7d            	tnz	(x)
1609  05be 2706          	jreq	L733
1611  05c0 7b01          	ld	a,(OFST+0,sp)
1612  05c2 a108          	cp	a,#8
1613  05c4 25de          	jrult	L133
1614  05c6               L733:
1615                     ; 466 }
1618  05c6 5b03          	addw	sp,#3
1619  05c8 81            	ret
1675                     ; 474 void LCD_GLASS_DisplayStrDeci(uint16_t* ptr)
1675                     ; 475 {
1676                     	switch	.text
1677  05c9               _LCD_GLASS_DisplayStrDeci:
1679  05c9 89            	pushw	x
1680  05ca 89            	pushw	x
1681       00000002      OFST:	set	2
1684                     ; 476   uint8_t i = 0x01;
1686  05cb a601          	ld	a,#1
1687  05cd 6b02          	ld	(OFST+0,sp),a
1689                     ; 479 	LCD_GLASS_Clear();
1691  05cf ad6b          	call	_LCD_GLASS_Clear
1694  05d1 2059          	jra	L773
1695  05d3               L573:
1696                     ; 483     char_tmp = (*ptr) & 0x00ff;
1698  05d3 1e03          	ldw	x,(OFST+1,sp)
1699  05d5 e601          	ld	a,(1,x)
1700  05d7 a4ff          	and	a,#255
1701  05d9 6b01          	ld	(OFST-1,sp),a
1703                     ; 485     switch ((*ptr) & 0xf000)
1705  05db 1e03          	ldw	x,(OFST+1,sp)
1706  05dd fe            	ldw	x,(x)
1707  05de 01            	rrwa	x,a
1708  05df 9f            	ld	a,xl
1709  05e0 a4f0          	and	a,#240
1710  05e2 97            	ld	xl,a
1711  05e3 4f            	clr	a
1712  05e4 02            	rlwa	x,a
1714                     ; 497           break;
1715  05e5 1d4000        	subw	x,#16384
1716  05e8 2729          	jreq	L343
1717  05ea 1d4000        	subw	x,#16384
1718  05ed 2712          	jreq	L143
1719  05ef               L543:
1720                     ; 495       default:
1720                     ; 496           LCD_GLASS_WriteChar(&char_tmp, POINT_OFF, COLUMN_OFF, i);		
1722  05ef 7b02          	ld	a,(OFST+0,sp)
1723  05f1 88            	push	a
1724  05f2 4b00          	push	#0
1725  05f4 4b00          	push	#0
1726  05f6 96            	ldw	x,sp
1727  05f7 1c0004        	addw	x,#OFST+2
1728  05fa cd0178        	call	_LCD_GLASS_WriteChar
1730  05fd 5b03          	addw	sp,#3
1731                     ; 497           break;
1733  05ff 2022          	jra	L504
1734  0601               L143:
1735                     ; 487       case DOT:
1735                     ; 488           /* Display one character on LCD with decimal point */
1735                     ; 489           LCD_GLASS_WriteChar(&char_tmp, POINT_ON, COLUMN_OFF, i);
1737  0601 7b02          	ld	a,(OFST+0,sp)
1738  0603 88            	push	a
1739  0604 4b00          	push	#0
1740  0606 4b01          	push	#1
1741  0608 96            	ldw	x,sp
1742  0609 1c0004        	addw	x,#OFST+2
1743  060c cd0178        	call	_LCD_GLASS_WriteChar
1745  060f 5b03          	addw	sp,#3
1746                     ; 490           break;
1748  0611 2010          	jra	L504
1749  0613               L343:
1750                     ; 491       case DOUBLE_DOT:
1750                     ; 492           /* Display one character on LCD with decimal point */
1750                     ; 493           LCD_GLASS_WriteChar(&char_tmp, POINT_OFF, COLUMN_ON, i);
1752  0613 7b02          	ld	a,(OFST+0,sp)
1753  0615 88            	push	a
1754  0616 4b01          	push	#1
1755  0618 4b00          	push	#0
1756  061a 96            	ldw	x,sp
1757  061b 1c0004        	addw	x,#OFST+2
1758  061e cd0178        	call	_LCD_GLASS_WriteChar
1760  0621 5b03          	addw	sp,#3
1761                     ; 494           break;
1763  0623               L504:
1764                     ; 499     ptr++;
1766  0623 1e03          	ldw	x,(OFST+1,sp)
1767  0625 1c0002        	addw	x,#2
1768  0628 1f03          	ldw	(OFST+1,sp),x
1769                     ; 502     i++;
1771  062a 0c02          	inc	(OFST+0,sp)
1773  062c               L773:
1774                     ; 481   while ((*ptr != 0) & (i < 8))
1776  062c 1e03          	ldw	x,(OFST+1,sp)
1777  062e e601          	ld	a,(1,x)
1778  0630 fa            	or	a,(x)
1779  0631 2706          	jreq	L704
1781  0633 7b02          	ld	a,(OFST+0,sp)
1782  0635 a108          	cp	a,#8
1783  0637 259a          	jrult	L573
1784  0639               L704:
1785                     ; 504 }
1788  0639 5b04          	addw	sp,#4
1789  063b 81            	ret
1823                     ; 511 void LCD_GLASS_Clear(void)
1823                     ; 512 {
1824                     	switch	.text
1825  063c               _LCD_GLASS_Clear:
1827  063c 88            	push	a
1828       00000001      OFST:	set	1
1831                     ; 513   uint8_t counter = 0;
1833                     ; 515   for (counter = 0; counter <= LCD_RAMRegister_13; counter++)
1835  063d 0f01          	clr	(OFST+0,sp)
1837  063f               L724:
1838                     ; 517     LCD->RAM[counter] = LCD_RAM_RESET_VALUE;
1840  063f 7b01          	ld	a,(OFST+0,sp)
1841  0641 5f            	clrw	x
1842  0642 97            	ld	xl,a
1843  0643 724f540c      	clr	(21516,x)
1844                     ; 515   for (counter = 0; counter <= LCD_RAMRegister_13; counter++)
1846  0647 0c01          	inc	(OFST+0,sp)
1850  0649 7b01          	ld	a,(OFST+0,sp)
1851  064b a10e          	cp	a,#14
1852  064d 25f0          	jrult	L724
1853                     ; 519 }
1856  064f 84            	pop	a
1857  0650 81            	ret
1860                     	switch	.const
1861  0062               L534_str:
1862  0062 00            	dc.b	0
1863  0063 000000000000  	ds.b	6
1966                     ; 531 void LCD_GLASS_ScrollSentence(uint8_t* ptr, uint16_t nScroll, uint16_t ScrollSpeed)
1966                     ; 532 {
1967                     	switch	.text
1968  0651               _LCD_GLASS_ScrollSentence:
1970  0651 89            	pushw	x
1971  0652 520c          	subw	sp,#12
1972       0000000c      OFST:	set	12
1975                     ; 536   uint8_t str[7]="";
1977  0654 96            	ldw	x,sp
1978  0655 1c0002        	addw	x,#OFST-10
1979  0658 90ae0062      	ldw	y,#L534_str
1980  065c a607          	ld	a,#7
1981  065e cd0000        	call	c_xymvx
1983                     ; 539   if (ptr == 0) return;
1985  0661 1e0d          	ldw	x,(OFST+1,sp)
1986  0663 2603          	jrne	L45
1987  0665 cc072d        	jp	L25
1988  0668               L45:
1991                     ; 542   for (ptr1=ptr,Str_size = 0 ; *ptr1 != 0; Str_size++,ptr1++) ;
1993  0668 1e0d          	ldw	x,(OFST+1,sp)
1994  066a 1f09          	ldw	(OFST-3,sp),x
1996  066c 0f0b          	clr	(OFST-1,sp)
1999  066e 2009          	jra	L715
2000  0670               L315:
2004  0670 0c0b          	inc	(OFST-1,sp)
2006  0672 1e09          	ldw	x,(OFST-3,sp)
2007  0674 1c0001        	addw	x,#1
2008  0677 1f09          	ldw	(OFST-3,sp),x
2010  0679               L715:
2013  0679 1e09          	ldw	x,(OFST-3,sp)
2014  067b 7d            	tnz	(x)
2015  067c 26f2          	jrne	L315
2016                     ; 544   ptr1 = ptr;
2018  067e 1e0d          	ldw	x,(OFST+1,sp)
2019  0680 1f09          	ldw	(OFST-3,sp),x
2021                     ; 546   LCD_GLASS_DisplayString(ptr);
2023  0682 1e0d          	ldw	x,(OFST+1,sp)
2024  0684 cd0599        	call	_LCD_GLASS_DisplayString
2026                     ; 547   delay_ms(ScrollSpeed);
2028  0687 1e13          	ldw	x,(OFST+7,sp)
2029  0689 cd0000        	call	_delay_ms
2031                     ; 550   for (Repetition=0; Repetition<nScroll; Repetition++)
2033  068c 0f01          	clr	(OFST-11,sp)
2036  068e ac420742      	jpf	L725
2037  0692               L325:
2038                     ; 552     for (Char_Nb=0; Char_Nb<Str_size; Char_Nb++)
2040  0692 0f0c          	clr	(OFST+0,sp)
2043  0694 ac370737      	jpf	L735
2044  0698               L335:
2045                     ; 554       *(str) =* (ptr1+((Char_Nb+1)%Str_size));
2047  0698 7b0c          	ld	a,(OFST+0,sp)
2048  069a 5f            	clrw	x
2049  069b 97            	ld	xl,a
2050  069c 5c            	incw	x
2051  069d 7b0b          	ld	a,(OFST-1,sp)
2052  069f 905f          	clrw	y
2053  06a1 9097          	ld	yl,a
2054  06a3 cd0000        	call	c_idiv
2056  06a6 51            	exgw	x,y
2057  06a7 72fb09        	addw	x,(OFST-3,sp)
2058  06aa f6            	ld	a,(x)
2059  06ab 6b02          	ld	(OFST-10,sp),a
2061                     ; 555       *(str+1) =* (ptr1+((Char_Nb+2)%Str_size));
2063  06ad 7b0c          	ld	a,(OFST+0,sp)
2064  06af 5f            	clrw	x
2065  06b0 97            	ld	xl,a
2066  06b1 5c            	incw	x
2067  06b2 5c            	incw	x
2068  06b3 7b0b          	ld	a,(OFST-1,sp)
2069  06b5 905f          	clrw	y
2070  06b7 9097          	ld	yl,a
2071  06b9 cd0000        	call	c_idiv
2073  06bc 51            	exgw	x,y
2074  06bd 72fb09        	addw	x,(OFST-3,sp)
2075  06c0 f6            	ld	a,(x)
2076  06c1 6b03          	ld	(OFST-9,sp),a
2078                     ; 556       *(str+2) =* (ptr1+((Char_Nb+3)%Str_size));
2080  06c3 7b0c          	ld	a,(OFST+0,sp)
2081  06c5 5f            	clrw	x
2082  06c6 97            	ld	xl,a
2083  06c7 1c0003        	addw	x,#3
2084  06ca 7b0b          	ld	a,(OFST-1,sp)
2085  06cc 905f          	clrw	y
2086  06ce 9097          	ld	yl,a
2087  06d0 cd0000        	call	c_idiv
2089  06d3 51            	exgw	x,y
2090  06d4 72fb09        	addw	x,(OFST-3,sp)
2091  06d7 f6            	ld	a,(x)
2092  06d8 6b04          	ld	(OFST-8,sp),a
2094                     ; 557       *(str+3) =* (ptr1+((Char_Nb+4)%Str_size));
2096  06da 7b0c          	ld	a,(OFST+0,sp)
2097  06dc 5f            	clrw	x
2098  06dd 97            	ld	xl,a
2099  06de 1c0004        	addw	x,#4
2100  06e1 7b0b          	ld	a,(OFST-1,sp)
2101  06e3 905f          	clrw	y
2102  06e5 9097          	ld	yl,a
2103  06e7 cd0000        	call	c_idiv
2105  06ea 51            	exgw	x,y
2106  06eb 72fb09        	addw	x,(OFST-3,sp)
2107  06ee f6            	ld	a,(x)
2108  06ef 6b05          	ld	(OFST-7,sp),a
2110                     ; 558       *(str+4) =* (ptr1+((Char_Nb+5)%Str_size));
2112  06f1 7b0c          	ld	a,(OFST+0,sp)
2113  06f3 5f            	clrw	x
2114  06f4 97            	ld	xl,a
2115  06f5 1c0005        	addw	x,#5
2116  06f8 7b0b          	ld	a,(OFST-1,sp)
2117  06fa 905f          	clrw	y
2118  06fc 9097          	ld	yl,a
2119  06fe cd0000        	call	c_idiv
2121  0701 51            	exgw	x,y
2122  0702 72fb09        	addw	x,(OFST-3,sp)
2123  0705 f6            	ld	a,(x)
2124  0706 6b06          	ld	(OFST-6,sp),a
2126                     ; 559       *(str+5) =* (ptr1+((Char_Nb+6)%Str_size));
2128  0708 7b0c          	ld	a,(OFST+0,sp)
2129  070a 5f            	clrw	x
2130  070b 97            	ld	xl,a
2131  070c 1c0006        	addw	x,#6
2132  070f 7b0b          	ld	a,(OFST-1,sp)
2133  0711 905f          	clrw	y
2134  0713 9097          	ld	yl,a
2135  0715 cd0000        	call	c_idiv
2137  0718 51            	exgw	x,y
2138  0719 72fb09        	addw	x,(OFST-3,sp)
2139  071c f6            	ld	a,(x)
2140  071d 6b07          	ld	(OFST-5,sp),a
2142                     ; 560       LCD_GLASS_Clear();
2144  071f cd063c        	call	_LCD_GLASS_Clear
2146                     ; 561       LCD_GLASS_DisplayString(str);
2148  0722 96            	ldw	x,sp
2149  0723 1c0002        	addw	x,#OFST-10
2150  0726 cd0599        	call	_LCD_GLASS_DisplayString
2152                     ; 564       if (KeyPressed)
2154  0729 3d00          	tnz	_KeyPressed
2155  072b 2703          	jreq	L345
2156                     ; 565               return;   		
2157  072d               L25:
2160  072d 5b0e          	addw	sp,#14
2161  072f 81            	ret
2162  0730               L345:
2163                     ; 566       delay_ms(ScrollSpeed);
2165  0730 1e13          	ldw	x,(OFST+7,sp)
2166  0732 cd0000        	call	_delay_ms
2168                     ; 552     for (Char_Nb=0; Char_Nb<Str_size; Char_Nb++)
2170  0735 0c0c          	inc	(OFST+0,sp)
2172  0737               L735:
2175  0737 7b0c          	ld	a,(OFST+0,sp)
2176  0739 110b          	cp	a,(OFST-1,sp)
2177  073b 2403          	jruge	L65
2178  073d cc0698        	jp	L335
2179  0740               L65:
2180                     ; 550   for (Repetition=0; Repetition<nScroll; Repetition++)
2182  0740 0c01          	inc	(OFST-11,sp)
2184  0742               L725:
2187  0742 7b01          	ld	a,(OFST-11,sp)
2188  0744 5f            	clrw	x
2189  0745 97            	ld	xl,a
2190  0746 1311          	cpw	x,(OFST+5,sp)
2191  0748 2403          	jruge	L06
2192  074a cc0692        	jp	L325
2193  074d               L06:
2194                     ; 570 }
2196  074d 20de          	jra	L25
2251                     	xdef	_LCD_contrast
2252                     	xdef	_NumberMap
2253                     	xdef	_CapLetterMap
2254                     	xdef	_t_bar
2255                     	xdef	_KeyPressed
2256                     	xdef	_LCD_GLASS_ScrollSentence
2257                     	xdef	_LCD_GLASS_Clear
2258                     	xdef	_LCD_GLASS_DisplayStrDeci
2259                     	xdef	_LCD_GLASS_DisplayString
2260                     	xdef	_LCD_GLASS_WriteChar
2261                     	xdef	_LCD_GLASS_Init
2262                     	xdef	_LCD_bar
2263                     	xref	_LCD_PortMaskConfig
2264                     	xref	_LCD_ContrastConfig
2265                     	xref	_LCD_DeadTimeConfig
2266                     	xref	_LCD_PulseOnDurationConfig
2267                     	xref	_LCD_Cmd
2268                     	xref	_LCD_Init
2269                     	xref	_CLK_PeripheralClockConfig
2270                     	xref	_CLK_RTCClockConfig
2271                     	xref	_delay_ms
2272                     	xref.b	c_x
2291                     	xref	c_idiv
2292                     	xref	c_xymvx
2293                     	end
