   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  43                     ; 46 void PWR_DeInit(void)
  43                     ; 47 {
  45                     	switch	.text
  46  0000               _PWR_DeInit:
  50                     ; 48   PWR->CSR1 = PWR_CSR1_PVDIF;
  52  0000 352050b2      	mov	20658,#32
  53                     ; 49   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  55  0004 725f50b3      	clr	20659
  56                     ; 50 }
  59  0008 81            	ret
 114                     ; 57 void PWR_FastWakeUpCmd(FunctionalState NewState)
 114                     ; 58 {
 115                     	switch	.text
 116  0009               _PWR_FastWakeUpCmd:
 120                     ; 60   assert_param(IS_FUNCTIONAL_STATE(NewState));
 122                     ; 62   if (NewState != DISABLE)
 124  0009 4d            	tnz	a
 125  000a 2706          	jreq	L74
 126                     ; 65     PWR->CSR2 |= PWR_CSR2_FWU;
 128  000c 721450b3      	bset	20659,#2
 130  0010 2004          	jra	L15
 131  0012               L74:
 132                     ; 70     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 134  0012 721550b3      	bres	20659,#2
 135  0016               L15:
 136                     ; 72 }
 139  0016 81            	ret
 175                     ; 79 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 175                     ; 80 {
 176                     	switch	.text
 177  0017               _PWR_UltraLowPowerCmd:
 181                     ; 82   assert_param(IS_FUNCTIONAL_STATE(NewState));
 183                     ; 84   if (NewState != DISABLE)
 185  0017 4d            	tnz	a
 186  0018 2706          	jreq	L17
 187                     ; 87     PWR->CSR2 |= PWR_CSR2_ULP;
 189  001a 721250b3      	bset	20659,#1
 191  001e 2004          	jra	L37
 192  0020               L17:
 193                     ; 92     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 195  0020 721350b3      	bres	20659,#1
 196  0024               L37:
 197                     ; 94 }
 200  0024 81            	ret
 235                     ; 101 void PWR_PVDCmd(FunctionalState NewState)
 235                     ; 102 {
 236                     	switch	.text
 237  0025               _PWR_PVDCmd:
 241                     ; 104   assert_param(IS_FUNCTIONAL_STATE(NewState));
 243                     ; 106   if (NewState != DISABLE)
 245  0025 4d            	tnz	a
 246  0026 2706          	jreq	L311
 247                     ; 109     PWR->CSR1 |= PWR_CSR1_PVDE;
 249  0028 721050b2      	bset	20658,#0
 251  002c 2004          	jra	L511
 252  002e               L311:
 253                     ; 114     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 255  002e 721150b2      	bres	20658,#0
 256  0032               L511:
 257                     ; 116 }
 260  0032 81            	ret
 295                     ; 123 void PWR_PVDITConfig(FunctionalState NewState)
 295                     ; 124 {
 296                     	switch	.text
 297  0033               _PWR_PVDITConfig:
 301                     ; 126   assert_param(IS_FUNCTIONAL_STATE(NewState));
 303                     ; 128   if (NewState != DISABLE)
 305  0033 4d            	tnz	a
 306  0034 2706          	jreq	L531
 307                     ; 131     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 309  0036 721850b2      	bset	20658,#4
 311  003a 2004          	jra	L731
 312  003c               L531:
 313                     ; 136     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 315  003c 721950b2      	bres	20658,#4
 316  0040               L731:
 317                     ; 138 }
 320  0040 81            	ret
 417                     ; 146 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 417                     ; 147 {
 418                     	switch	.text
 419  0041               _PWR_PVDLevelConfig:
 421  0041 88            	push	a
 422       00000000      OFST:	set	0
 425                     ; 149   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 427                     ; 152   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 429  0042 c650b2        	ld	a,20658
 430  0045 a4f1          	and	a,#241
 431  0047 c750b2        	ld	20658,a
 432                     ; 155   PWR->CSR1 |= PWR_PVDLevel;
 434  004a c650b2        	ld	a,20658
 435  004d 1a01          	or	a,(OFST+1,sp)
 436  004f c750b2        	ld	20658,a
 437                     ; 157 }
 440  0052 84            	pop	a
 441  0053 81            	ret
 534                     ; 165 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 534                     ; 166 {
 535                     	switch	.text
 536  0054               _PWR_GetFlagStatus:
 538  0054 88            	push	a
 539  0055 88            	push	a
 540       00000001      OFST:	set	1
 543                     ; 167   FlagStatus bitstatus = RESET;
 545                     ; 170   assert_param(IS_PWR_FLAG(PWR_FLAG));
 547                     ; 172   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 549  0056 a501          	bcp	a,#1
 550  0058 2711          	jreq	L742
 551                     ; 174     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 553  005a c650b3        	ld	a,20659
 554  005d a501          	bcp	a,#1
 555  005f 2706          	jreq	L152
 556                     ; 176       bitstatus = SET;
 558  0061 a601          	ld	a,#1
 559  0063 6b01          	ld	(OFST+0,sp),a
 562  0065 2013          	jra	L552
 563  0067               L152:
 564                     ; 180       bitstatus = RESET;
 566  0067 0f01          	clr	(OFST+0,sp)
 568  0069 200f          	jra	L552
 569  006b               L742:
 570                     ; 185     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 572  006b c650b2        	ld	a,20658
 573  006e 1502          	bcp	a,(OFST+1,sp)
 574  0070 2706          	jreq	L752
 575                     ; 187       bitstatus = SET;
 577  0072 a601          	ld	a,#1
 578  0074 6b01          	ld	(OFST+0,sp),a
 581  0076 2002          	jra	L552
 582  0078               L752:
 583                     ; 191       bitstatus = RESET;
 585  0078 0f01          	clr	(OFST+0,sp)
 587  007a               L552:
 588                     ; 196   return((FlagStatus)bitstatus);
 590  007a 7b01          	ld	a,(OFST+0,sp)
 593  007c 85            	popw	x
 594  007d 81            	ret
 617                     ; 203 void PWR_PVDClearFlag(void)
 617                     ; 204 {
 618                     	switch	.text
 619  007e               _PWR_PVDClearFlag:
 623                     ; 206   PWR->CSR1 |= PWR_CSR1_PVDIF;
 625  007e 721a50b2      	bset	20658,#5
 626                     ; 207 }
 629  0082 81            	ret
 683                     ; 214 ITStatus PWR_PVDGetITStatus(void)
 683                     ; 215 {
 684                     	switch	.text
 685  0083               _PWR_PVDGetITStatus:
 687  0083 89            	pushw	x
 688       00000002      OFST:	set	2
 691                     ; 216   ITStatus bitstatus = RESET;
 693                     ; 218   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 697                     ; 220   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 699  0084 c650b2        	ld	a,20658
 700  0087 a420          	and	a,#32
 701  0089 6b01          	ld	(OFST-1,sp),a
 703                     ; 221   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 705  008b c650b2        	ld	a,20658
 706  008e a410          	and	a,#16
 707  0090 6b02          	ld	(OFST+0,sp),a
 709                     ; 223   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 711  0092 0d01          	tnz	(OFST-1,sp)
 712  0094 270a          	jreq	L123
 714  0096 0d02          	tnz	(OFST+0,sp)
 715  0098 2706          	jreq	L123
 716                     ; 225     bitstatus = (ITStatus)SET;
 718  009a a601          	ld	a,#1
 719  009c 6b02          	ld	(OFST+0,sp),a
 722  009e 2002          	jra	L323
 723  00a0               L123:
 724                     ; 229     bitstatus = (ITStatus)RESET;
 726  00a0 0f02          	clr	(OFST+0,sp)
 728  00a2               L323:
 729                     ; 231   return ((ITStatus)bitstatus);
 731  00a2 7b02          	ld	a,(OFST+0,sp)
 734  00a4 85            	popw	x
 735  00a5 81            	ret
 759                     ; 239 void PWR_PVDClearITPendingBit(void)
 759                     ; 240 {
 760                     	switch	.text
 761  00a6               _PWR_PVDClearITPendingBit:
 765                     ; 242   PWR->CSR1 |= PWR_CSR1_PVDIF;
 767  00a6 721a50b2      	bset	20658,#5
 768                     ; 243 }
 771  00aa 81            	ret
 784                     	xdef	_PWR_PVDClearITPendingBit
 785                     	xdef	_PWR_PVDGetITStatus
 786                     	xdef	_PWR_PVDClearFlag
 787                     	xdef	_PWR_GetFlagStatus
 788                     	xdef	_PWR_PVDLevelConfig
 789                     	xdef	_PWR_PVDITConfig
 790                     	xdef	_PWR_PVDCmd
 791                     	xdef	_PWR_UltraLowPowerCmd
 792                     	xdef	_PWR_FastWakeUpCmd
 793                     	xdef	_PWR_DeInit
 812                     	end
