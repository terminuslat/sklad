   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  43                     ; 46 void EXTI_DeInit(void)
  43                     ; 47 {
  45                     	switch	.text
  46  0000               _EXTI_DeInit:
  50                     ; 48   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  52  0000 725f50a0      	clr	20640
  53                     ; 49   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  55  0004 725f50a1      	clr	20641
  56                     ; 50   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  58  0008 725f50a2      	clr	20642
  59                     ; 51   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  61  000c 725f50aa      	clr	20650
  62                     ; 52   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  64  0010 35ff50a3      	mov	20643,#255
  65                     ; 53   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  67  0014 35ff50a4      	mov	20644,#255
  68                     ; 54   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  70  0018 725f50a5      	clr	20645
  71                     ; 55   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  73  001c 725f50ab      	clr	20651
  74                     ; 56 }
  77  0020 81            	ret
 209                     ; 71 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 209                     ; 72                              EXTI_Trigger_TypeDef EXTI_Trigger)
 209                     ; 73 {
 210                     	switch	.text
 211  0021               _EXTI_SetPortSensitivity:
 213  0021 89            	pushw	x
 214       00000000      OFST:	set	0
 217                     ; 75   assert_param(IS_EXTI_PORT(EXTI_Port));
 219                     ; 76   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 221                     ; 79   if ((EXTI_Port & 0xF0) == 0x00)
 223  0022 9e            	ld	a,xh
 224  0023 a5f0          	bcp	a,#240
 225  0025 2629          	jrne	L77
 226                     ; 82     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 228  0027 7b01          	ld	a,(OFST+1,sp)
 229  0029 5f            	clrw	x
 230  002a 97            	ld	xl,a
 231  002b a603          	ld	a,#3
 232  002d 5d            	tnzw	x
 233  002e 2704          	jreq	L01
 234  0030               L21:
 235  0030 48            	sll	a
 236  0031 5a            	decw	x
 237  0032 26fc          	jrne	L21
 238  0034               L01:
 239  0034 43            	cpl	a
 240  0035 c450a2        	and	a,20642
 241  0038 c750a2        	ld	20642,a
 242                     ; 84     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 244  003b 7b01          	ld	a,(OFST+1,sp)
 245  003d 5f            	clrw	x
 246  003e 97            	ld	xl,a
 247  003f 7b02          	ld	a,(OFST+2,sp)
 248  0041 5d            	tnzw	x
 249  0042 2704          	jreq	L41
 250  0044               L61:
 251  0044 48            	sll	a
 252  0045 5a            	decw	x
 253  0046 26fc          	jrne	L61
 254  0048               L41:
 255  0048 ca50a2        	or	a,20642
 256  004b c750a2        	ld	20642,a
 258  004e 202b          	jra	L101
 259  0050               L77:
 260                     ; 89     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 262  0050 7b01          	ld	a,(OFST+1,sp)
 263  0052 a40f          	and	a,#15
 264  0054 5f            	clrw	x
 265  0055 97            	ld	xl,a
 266  0056 a603          	ld	a,#3
 267  0058 5d            	tnzw	x
 268  0059 2704          	jreq	L02
 269  005b               L22:
 270  005b 48            	sll	a
 271  005c 5a            	decw	x
 272  005d 26fc          	jrne	L22
 273  005f               L02:
 274  005f 43            	cpl	a
 275  0060 c450aa        	and	a,20650
 276  0063 c750aa        	ld	20650,a
 277                     ; 91     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 279  0066 7b01          	ld	a,(OFST+1,sp)
 280  0068 a40f          	and	a,#15
 281  006a 5f            	clrw	x
 282  006b 97            	ld	xl,a
 283  006c 7b02          	ld	a,(OFST+2,sp)
 284  006e 5d            	tnzw	x
 285  006f 2704          	jreq	L42
 286  0071               L62:
 287  0071 48            	sll	a
 288  0072 5a            	decw	x
 289  0073 26fc          	jrne	L62
 290  0075               L42:
 291  0075 ca50aa        	or	a,20650
 292  0078 c750aa        	ld	20650,a
 293  007b               L101:
 294                     ; 93 }
 297  007b 85            	popw	x
 298  007c 81            	ret
 406                     ; 108 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin,
 406                     ; 109                             EXTI_Trigger_TypeDef EXTI_Trigger)
 406                     ; 110 {
 407                     	switch	.text
 408  007d               _EXTI_SetPinSensitivity:
 410  007d 89            	pushw	x
 411       00000000      OFST:	set	0
 414                     ; 113   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 416                     ; 114   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 418                     ; 117   switch (EXTI_Pin)
 420  007e 9e            	ld	a,xh
 422                     ; 151     default:
 422                     ; 152       break;
 423  007f 4d            	tnz	a
 424  0080 272f          	jreq	L301
 425  0082 a002          	sub	a,#2
 426  0084 274a          	jreq	L501
 427  0086 a002          	sub	a,#2
 428  0088 2765          	jreq	L701
 429  008a a002          	sub	a,#2
 430  008c 2603cc010e    	jreq	L111
 431  0091 a00a          	sub	a,#10
 432  0093 2603          	jrne	L27
 433  0095 cc012b        	jp	L311
 434  0098               L27:
 435  0098 a002          	sub	a,#2
 436  009a 2603          	jrne	L47
 437  009c cc014a        	jp	L511
 438  009f               L47:
 439  009f a002          	sub	a,#2
 440  00a1 2603          	jrne	L67
 441  00a3 cc0169        	jp	L711
 442  00a6               L67:
 443  00a6 a002          	sub	a,#2
 444  00a8 2603          	jrne	L001
 445  00aa cc0188        	jp	L121
 446  00ad               L001:
 447  00ad aca501a5      	jpf	L571
 448  00b1               L301:
 449                     ; 119     case EXTI_Pin_0:
 449                     ; 120       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 451  00b1 c650a0        	ld	a,20640
 452  00b4 a4fc          	and	a,#252
 453  00b6 c750a0        	ld	20640,a
 454                     ; 121       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 456  00b9 7b01          	ld	a,(OFST+1,sp)
 457  00bb 5f            	clrw	x
 458  00bc 97            	ld	xl,a
 459  00bd 7b02          	ld	a,(OFST+2,sp)
 460  00bf 5d            	tnzw	x
 461  00c0 2704          	jreq	L23
 462  00c2               L43:
 463  00c2 48            	sll	a
 464  00c3 5a            	decw	x
 465  00c4 26fc          	jrne	L43
 466  00c6               L23:
 467  00c6 ca50a0        	or	a,20640
 468  00c9 c750a0        	ld	20640,a
 469                     ; 122       break;
 471  00cc aca501a5      	jpf	L571
 472  00d0               L501:
 473                     ; 123     case EXTI_Pin_1:
 473                     ; 124       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 475  00d0 c650a0        	ld	a,20640
 476  00d3 a4f3          	and	a,#243
 477  00d5 c750a0        	ld	20640,a
 478                     ; 125       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 480  00d8 7b01          	ld	a,(OFST+1,sp)
 481  00da 5f            	clrw	x
 482  00db 97            	ld	xl,a
 483  00dc 7b02          	ld	a,(OFST+2,sp)
 484  00de 5d            	tnzw	x
 485  00df 2704          	jreq	L63
 486  00e1               L04:
 487  00e1 48            	sll	a
 488  00e2 5a            	decw	x
 489  00e3 26fc          	jrne	L04
 490  00e5               L63:
 491  00e5 ca50a0        	or	a,20640
 492  00e8 c750a0        	ld	20640,a
 493                     ; 126       break;
 495  00eb aca501a5      	jpf	L571
 496  00ef               L701:
 497                     ; 127     case EXTI_Pin_2:
 497                     ; 128       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 499  00ef c650a0        	ld	a,20640
 500  00f2 a4cf          	and	a,#207
 501  00f4 c750a0        	ld	20640,a
 502                     ; 129       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 504  00f7 7b01          	ld	a,(OFST+1,sp)
 505  00f9 5f            	clrw	x
 506  00fa 97            	ld	xl,a
 507  00fb 7b02          	ld	a,(OFST+2,sp)
 508  00fd 5d            	tnzw	x
 509  00fe 2704          	jreq	L24
 510  0100               L44:
 511  0100 48            	sll	a
 512  0101 5a            	decw	x
 513  0102 26fc          	jrne	L44
 514  0104               L24:
 515  0104 ca50a0        	or	a,20640
 516  0107 c750a0        	ld	20640,a
 517                     ; 130       break;
 519  010a aca501a5      	jpf	L571
 520  010e               L111:
 521                     ; 131     case EXTI_Pin_3:
 521                     ; 132       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 523  010e c650a0        	ld	a,20640
 524  0111 a43f          	and	a,#63
 525  0113 c750a0        	ld	20640,a
 526                     ; 133       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 528  0116 7b01          	ld	a,(OFST+1,sp)
 529  0118 5f            	clrw	x
 530  0119 97            	ld	xl,a
 531  011a 7b02          	ld	a,(OFST+2,sp)
 532  011c 5d            	tnzw	x
 533  011d 2704          	jreq	L64
 534  011f               L05:
 535  011f 48            	sll	a
 536  0120 5a            	decw	x
 537  0121 26fc          	jrne	L05
 538  0123               L64:
 539  0123 ca50a0        	or	a,20640
 540  0126 c750a0        	ld	20640,a
 541                     ; 134       break;
 543  0129 207a          	jra	L571
 544  012b               L311:
 545                     ; 135     case EXTI_Pin_4:
 545                     ; 136       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 547  012b c650a1        	ld	a,20641
 548  012e a4fc          	and	a,#252
 549  0130 c750a1        	ld	20641,a
 550                     ; 137       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 552  0133 7b01          	ld	a,(OFST+1,sp)
 553  0135 a4ef          	and	a,#239
 554  0137 5f            	clrw	x
 555  0138 97            	ld	xl,a
 556  0139 7b02          	ld	a,(OFST+2,sp)
 557  013b 5d            	tnzw	x
 558  013c 2704          	jreq	L25
 559  013e               L45:
 560  013e 48            	sll	a
 561  013f 5a            	decw	x
 562  0140 26fc          	jrne	L45
 563  0142               L25:
 564  0142 ca50a1        	or	a,20641
 565  0145 c750a1        	ld	20641,a
 566                     ; 138       break;
 568  0148 205b          	jra	L571
 569  014a               L511:
 570                     ; 139     case EXTI_Pin_5:
 570                     ; 140       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 572  014a c650a1        	ld	a,20641
 573  014d a4f3          	and	a,#243
 574  014f c750a1        	ld	20641,a
 575                     ; 141       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 577  0152 7b01          	ld	a,(OFST+1,sp)
 578  0154 a4ef          	and	a,#239
 579  0156 5f            	clrw	x
 580  0157 97            	ld	xl,a
 581  0158 7b02          	ld	a,(OFST+2,sp)
 582  015a 5d            	tnzw	x
 583  015b 2704          	jreq	L65
 584  015d               L06:
 585  015d 48            	sll	a
 586  015e 5a            	decw	x
 587  015f 26fc          	jrne	L06
 588  0161               L65:
 589  0161 ca50a1        	or	a,20641
 590  0164 c750a1        	ld	20641,a
 591                     ; 142       break;
 593  0167 203c          	jra	L571
 594  0169               L711:
 595                     ; 143     case EXTI_Pin_6:
 595                     ; 144       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 597  0169 c650a1        	ld	a,20641
 598  016c a4cf          	and	a,#207
 599  016e c750a1        	ld	20641,a
 600                     ; 145       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 602  0171 7b01          	ld	a,(OFST+1,sp)
 603  0173 a4ef          	and	a,#239
 604  0175 5f            	clrw	x
 605  0176 97            	ld	xl,a
 606  0177 7b02          	ld	a,(OFST+2,sp)
 607  0179 5d            	tnzw	x
 608  017a 2704          	jreq	L26
 609  017c               L46:
 610  017c 48            	sll	a
 611  017d 5a            	decw	x
 612  017e 26fc          	jrne	L46
 613  0180               L26:
 614  0180 ca50a1        	or	a,20641
 615  0183 c750a1        	ld	20641,a
 616                     ; 146       break;
 618  0186 201d          	jra	L571
 619  0188               L121:
 620                     ; 147     case EXTI_Pin_7:
 620                     ; 148       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 622  0188 c650a1        	ld	a,20641
 623  018b a43f          	and	a,#63
 624  018d c750a1        	ld	20641,a
 625                     ; 149       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 627  0190 7b01          	ld	a,(OFST+1,sp)
 628  0192 a4ef          	and	a,#239
 629  0194 5f            	clrw	x
 630  0195 97            	ld	xl,a
 631  0196 7b02          	ld	a,(OFST+2,sp)
 632  0198 5d            	tnzw	x
 633  0199 2704          	jreq	L66
 634  019b               L07:
 635  019b 48            	sll	a
 636  019c 5a            	decw	x
 637  019d 26fc          	jrne	L07
 638  019f               L66:
 639  019f ca50a1        	or	a,20641
 640  01a2 c750a1        	ld	20641,a
 641                     ; 150       break;
 643  01a5               L321:
 644                     ; 151     default:
 644                     ; 152       break;
 646  01a5               L571:
 647                     ; 154 }
 650  01a5 85            	popw	x
 651  01a6 81            	ret
 686                     ; 162 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 686                     ; 163 {
 687                     	switch	.text
 688  01a7               _EXTI_SelectPort:
 690  01a7 88            	push	a
 691       00000000      OFST:	set	0
 694                     ; 165   assert_param(IS_EXTI_PORT(EXTI_Port));
 696                     ; 167   if (EXTI_Port == EXTI_Port_B)
 698  01a8 4d            	tnz	a
 699  01a9 2606          	jrne	L512
 700                     ; 170     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 702  01ab 721b50ab      	bres	20651,#5
 704  01af 2034          	jra	L712
 705  01b1               L512:
 706                     ; 172   else if (EXTI_Port == EXTI_Port_D)
 708  01b1 7b01          	ld	a,(OFST+1,sp)
 709  01b3 a102          	cp	a,#2
 710  01b5 2606          	jrne	L122
 711                     ; 175     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 713  01b7 721d50ab      	bres	20651,#6
 715  01bb 2028          	jra	L712
 716  01bd               L122:
 717                     ; 177   else if (EXTI_Port == EXTI_Port_E)
 719  01bd 7b01          	ld	a,(OFST+1,sp)
 720  01bf a104          	cp	a,#4
 721  01c1 2606          	jrne	L522
 722                     ; 180     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 724  01c3 721f50a5      	bres	20645,#7
 726  01c7 201c          	jra	L712
 727  01c9               L522:
 728                     ; 182   else if (EXTI_Port == EXTI_Port_F)
 730  01c9 7b01          	ld	a,(OFST+1,sp)
 731  01cb a106          	cp	a,#6
 732  01cd 2606          	jrne	L132
 733                     ; 185     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 735  01cf 721e50a5      	bset	20645,#7
 737  01d3 2010          	jra	L712
 738  01d5               L132:
 739                     ; 187   else if (EXTI_Port == EXTI_Port_G)
 741  01d5 7b01          	ld	a,(OFST+1,sp)
 742  01d7 a110          	cp	a,#16
 743  01d9 2606          	jrne	L532
 744                     ; 190     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 746  01db 721a50ab      	bset	20651,#5
 748  01df 2004          	jra	L712
 749  01e1               L532:
 750                     ; 195     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 752  01e1 721c50ab      	bset	20651,#6
 753  01e5               L712:
 754                     ; 197 }
 757  01e5 84            	pop	a
 758  01e6 81            	ret
 926                     ; 211 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 926                     ; 212                                FunctionalState NewState)
 926                     ; 213 {
 927                     	switch	.text
 928  01e7               _EXTI_SetHalfPortSelection:
 930  01e7 89            	pushw	x
 931       00000000      OFST:	set	0
 934                     ; 215   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 936                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
 938                     ; 218   if ((EXTI_HalfPort & 0x80) == 0x00)
 940  01e8 9e            	ld	a,xh
 941  01e9 a580          	bcp	a,#128
 942  01eb 2619          	jrne	L723
 943                     ; 220     if (NewState != DISABLE)
 945  01ed 0d02          	tnz	(OFST+2,sp)
 946  01ef 270a          	jreq	L133
 947                     ; 223       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 949  01f1 c650a5        	ld	a,20645
 950  01f4 1a01          	or	a,(OFST+1,sp)
 951  01f6 c750a5        	ld	20645,a
 953  01f9 2026          	jra	L533
 954  01fb               L133:
 955                     ; 228       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 957  01fb 7b01          	ld	a,(OFST+1,sp)
 958  01fd 43            	cpl	a
 959  01fe c450a5        	and	a,20645
 960  0201 c750a5        	ld	20645,a
 961  0204 201b          	jra	L533
 962  0206               L723:
 963                     ; 233     if (NewState != DISABLE)
 965  0206 0d02          	tnz	(OFST+2,sp)
 966  0208 270c          	jreq	L733
 967                     ; 236       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 969  020a 7b01          	ld	a,(OFST+1,sp)
 970  020c a47f          	and	a,#127
 971  020e ca50ab        	or	a,20651
 972  0211 c750ab        	ld	20651,a
 974  0214 200b          	jra	L533
 975  0216               L733:
 976                     ; 241       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 978  0216 7b01          	ld	a,(OFST+1,sp)
 979  0218 a47f          	and	a,#127
 980  021a 43            	cpl	a
 981  021b c450ab        	and	a,20651
 982  021e c750ab        	ld	20651,a
 983  0221               L533:
 984                     ; 244 }
 987  0221 85            	popw	x
 988  0222 81            	ret
1034                     ; 252 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1034                     ; 253 {
1035                     	switch	.text
1036  0223               _EXTI_GetPortSensitivity:
1038  0223 88            	push	a
1039  0224 88            	push	a
1040       00000001      OFST:	set	1
1043                     ; 254   uint8_t portsensitivity = 0;
1045                     ; 257   assert_param(IS_EXTI_PORT(EXTI_Port));
1047                     ; 260   if ((EXTI_Port & 0xF0) == 0x00)
1049  0225 a5f0          	bcp	a,#240
1050  0227 2614          	jrne	L563
1051                     ; 263     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1053  0229 7b02          	ld	a,(OFST+1,sp)
1054  022b 5f            	clrw	x
1055  022c 97            	ld	xl,a
1056  022d c650a2        	ld	a,20642
1057  0230 5d            	tnzw	x
1058  0231 2704          	jreq	L011
1059  0233               L211:
1060  0233 44            	srl	a
1061  0234 5a            	decw	x
1062  0235 26fc          	jrne	L211
1063  0237               L011:
1064  0237 a403          	and	a,#3
1065  0239 6b01          	ld	(OFST+0,sp),a
1068  023b 2014          	jra	L763
1069  023d               L563:
1070                     ; 269     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1072  023d 7b02          	ld	a,(OFST+1,sp)
1073  023f a40f          	and	a,#15
1074  0241 5f            	clrw	x
1075  0242 97            	ld	xl,a
1076  0243 c650aa        	ld	a,20650
1077  0246 5d            	tnzw	x
1078  0247 2704          	jreq	L411
1079  0249               L611:
1080  0249 44            	srl	a
1081  024a 5a            	decw	x
1082  024b 26fc          	jrne	L611
1083  024d               L411:
1084  024d a403          	and	a,#3
1085  024f 6b01          	ld	(OFST+0,sp),a
1087  0251               L763:
1088                     ; 272   return((EXTI_Trigger_TypeDef)portsensitivity);
1090  0251 7b01          	ld	a,(OFST+0,sp)
1093  0253 85            	popw	x
1094  0254 81            	ret
1140                     ; 281 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
1140                     ; 282 {
1141                     	switch	.text
1142  0255               _EXTI_GetPinSensitivity:
1144  0255 88            	push	a
1145       00000001      OFST:	set	1
1148                     ; 283   uint8_t value = 0;
1150  0256 0f01          	clr	(OFST+0,sp)
1152                     ; 286   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
1154                     ; 288   switch (EXTI_Pin)
1157                     ; 314     default:
1157                     ; 315       break;
1158  0258 4d            	tnz	a
1159  0259 271e          	jreq	L173
1160  025b a002          	sub	a,#2
1161  025d 2723          	jreq	L373
1162  025f a002          	sub	a,#2
1163  0261 272a          	jreq	L573
1164  0263 a002          	sub	a,#2
1165  0265 2732          	jreq	L773
1166  0267 a00a          	sub	a,#10
1167  0269 273c          	jreq	L104
1168  026b a002          	sub	a,#2
1169  026d 2741          	jreq	L304
1170  026f a002          	sub	a,#2
1171  0271 2748          	jreq	L504
1172  0273 a002          	sub	a,#2
1173  0275 2750          	jreq	L704
1174  0277 205a          	jra	L734
1175  0279               L173:
1176                     ; 290     case EXTI_Pin_0:
1176                     ; 291       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1178  0279 c650a0        	ld	a,20640
1179  027c a403          	and	a,#3
1180  027e 6b01          	ld	(OFST+0,sp),a
1182                     ; 292       break;
1184  0280 2051          	jra	L734
1185  0282               L373:
1186                     ; 293     case EXTI_Pin_1:
1186                     ; 294       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1188  0282 c650a0        	ld	a,20640
1189  0285 a40c          	and	a,#12
1190  0287 44            	srl	a
1191  0288 44            	srl	a
1192  0289 6b01          	ld	(OFST+0,sp),a
1194                     ; 295       break;
1196  028b 2046          	jra	L734
1197  028d               L573:
1198                     ; 296     case EXTI_Pin_2:
1198                     ; 297       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1200  028d c650a0        	ld	a,20640
1201  0290 a430          	and	a,#48
1202  0292 4e            	swap	a
1203  0293 a40f          	and	a,#15
1204  0295 6b01          	ld	(OFST+0,sp),a
1206                     ; 298       break;
1208  0297 203a          	jra	L734
1209  0299               L773:
1210                     ; 299     case EXTI_Pin_3:
1210                     ; 300       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1212  0299 c650a0        	ld	a,20640
1213  029c a4c0          	and	a,#192
1214  029e 4e            	swap	a
1215  029f 44            	srl	a
1216  02a0 44            	srl	a
1217  02a1 a403          	and	a,#3
1218  02a3 6b01          	ld	(OFST+0,sp),a
1220                     ; 301       break;
1222  02a5 202c          	jra	L734
1223  02a7               L104:
1224                     ; 302     case EXTI_Pin_4:
1224                     ; 303       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1226  02a7 c650a1        	ld	a,20641
1227  02aa a403          	and	a,#3
1228  02ac 6b01          	ld	(OFST+0,sp),a
1230                     ; 304       break;
1232  02ae 2023          	jra	L734
1233  02b0               L304:
1234                     ; 305     case EXTI_Pin_5:
1234                     ; 306       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1236  02b0 c650a1        	ld	a,20641
1237  02b3 a40c          	and	a,#12
1238  02b5 44            	srl	a
1239  02b6 44            	srl	a
1240  02b7 6b01          	ld	(OFST+0,sp),a
1242                     ; 307       break;
1244  02b9 2018          	jra	L734
1245  02bb               L504:
1246                     ; 308     case EXTI_Pin_6:
1246                     ; 309       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1248  02bb c650a1        	ld	a,20641
1249  02be a430          	and	a,#48
1250  02c0 4e            	swap	a
1251  02c1 a40f          	and	a,#15
1252  02c3 6b01          	ld	(OFST+0,sp),a
1254                     ; 310       break;
1256  02c5 200c          	jra	L734
1257  02c7               L704:
1258                     ; 311     case EXTI_Pin_7:
1258                     ; 312       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1260  02c7 c650a1        	ld	a,20641
1261  02ca a4c0          	and	a,#192
1262  02cc 4e            	swap	a
1263  02cd 44            	srl	a
1264  02ce 44            	srl	a
1265  02cf a403          	and	a,#3
1266  02d1 6b01          	ld	(OFST+0,sp),a
1268                     ; 313       break;
1270  02d3               L114:
1271                     ; 314     default:
1271                     ; 315       break;
1273  02d3               L734:
1274                     ; 317   return((EXTI_Trigger_TypeDef)value);
1276  02d3 7b01          	ld	a,(OFST+0,sp)
1279  02d5 5b01          	addw	sp,#1
1280  02d7 81            	ret
1450                     ; 327 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1450                     ; 328 {
1451                     	switch	.text
1452  02d8               _EXTI_GetITStatus:
1454  02d8 89            	pushw	x
1455  02d9 88            	push	a
1456       00000001      OFST:	set	1
1459                     ; 329   ITStatus status = RESET;
1461                     ; 331   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1463                     ; 333   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1465  02da 01            	rrwa	x,a
1466  02db 9f            	ld	a,xl
1467  02dc a4ff          	and	a,#255
1468  02de 97            	ld	xl,a
1469  02df 4f            	clr	a
1470  02e0 02            	rlwa	x,a
1471  02e1 a30100        	cpw	x,#256
1472  02e4 260b          	jrne	L335
1473                     ; 335     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1475  02e6 7b03          	ld	a,(OFST+2,sp)
1476  02e8 a4ff          	and	a,#255
1477  02ea c450a4        	and	a,20644
1478  02ed 6b01          	ld	(OFST+0,sp),a
1481  02ef 2009          	jra	L535
1482  02f1               L335:
1483                     ; 339     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1485  02f1 7b03          	ld	a,(OFST+2,sp)
1486  02f3 a4ff          	and	a,#255
1487  02f5 c450a3        	and	a,20643
1488  02f8 6b01          	ld	(OFST+0,sp),a
1490  02fa               L535:
1491                     ; 341   return((ITStatus)status);
1493  02fa 7b01          	ld	a,(OFST+0,sp)
1496  02fc 5b03          	addw	sp,#3
1497  02fe 81            	ret
1542                     ; 350 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1542                     ; 351 {
1543                     	switch	.text
1544  02ff               _EXTI_ClearITPendingBit:
1546  02ff 89            	pushw	x
1547  0300 89            	pushw	x
1548       00000002      OFST:	set	2
1551                     ; 352   uint16_t tempvalue = 0;
1553                     ; 355   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1555                     ; 357   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1557  0301 01            	rrwa	x,a
1558  0302 9f            	ld	a,xl
1559  0303 a4ff          	and	a,#255
1560  0305 97            	ld	xl,a
1561  0306 4f            	clr	a
1562  0307 02            	rlwa	x,a
1563  0308 1f01          	ldw	(OFST-1,sp),x
1564  030a 01            	rrwa	x,a
1566                     ; 359   if ( tempvalue == 0x0100)
1568  030b 1e01          	ldw	x,(OFST-1,sp)
1569  030d a30100        	cpw	x,#256
1570  0310 2609          	jrne	L165
1571                     ; 361     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1573  0312 7b04          	ld	a,(OFST+2,sp)
1574  0314 a4ff          	and	a,#255
1575  0316 c750a4        	ld	20644,a
1577  0319 2005          	jra	L365
1578  031b               L165:
1579                     ; 365     EXTI->SR1 = (uint8_t) (EXTI_IT);
1581  031b 7b04          	ld	a,(OFST+2,sp)
1582  031d c750a3        	ld	20643,a
1583  0320               L365:
1584                     ; 367 }
1587  0320 5b04          	addw	sp,#4
1588  0322 81            	ret
1601                     	xdef	_EXTI_ClearITPendingBit
1602                     	xdef	_EXTI_GetITStatus
1603                     	xdef	_EXTI_GetPinSensitivity
1604                     	xdef	_EXTI_GetPortSensitivity
1605                     	xdef	_EXTI_SetHalfPortSelection
1606                     	xdef	_EXTI_SelectPort
1607                     	xdef	_EXTI_SetPinSensitivity
1608                     	xdef	_EXTI_SetPortSensitivity
1609                     	xdef	_EXTI_DeInit
1628                     	end
