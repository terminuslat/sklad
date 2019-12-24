   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
 109                     ; 45 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 109                     ; 46 {
 111                     	switch	.text
 112  0000               _GPIO_DeInit:
 116                     ; 47   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 118  0000 6f04          	clr	(4,x)
 119                     ; 48   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 121  0002 7f            	clr	(x)
 122                     ; 49   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 124  0003 6f02          	clr	(2,x)
 125                     ; 50   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 127  0005 6f03          	clr	(3,x)
 128                     ; 51 }
 131  0007 81            	ret
 287                     ; 63 void GPIO_Init(GPIO_TypeDef* GPIOx,
 287                     ; 64                uint8_t GPIO_Pin,
 287                     ; 65                GPIO_Mode_TypeDef GPIO_Mode)
 287                     ; 66 {
 288                     	switch	.text
 289  0008               _GPIO_Init:
 291  0008 89            	pushw	x
 292       00000000      OFST:	set	0
 295                     ; 71   assert_param(IS_GPIO_MODE(GPIO_Mode));
 297                     ; 72   assert_param(IS_GPIO_PIN(GPIO_Pin));
 299                     ; 75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 301  0009 7b05          	ld	a,(OFST+5,sp)
 302  000b 43            	cpl	a
 303  000c e404          	and	a,(4,x)
 304  000e e704          	ld	(4,x),a
 305                     ; 81   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 307  0010 7b06          	ld	a,(OFST+6,sp)
 308  0012 a580          	bcp	a,#128
 309  0014 271d          	jreq	L541
 310                     ; 83     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 312  0016 7b06          	ld	a,(OFST+6,sp)
 313  0018 a510          	bcp	a,#16
 314  001a 2706          	jreq	L741
 315                     ; 85       GPIOx->ODR |= GPIO_Pin;
 317  001c f6            	ld	a,(x)
 318  001d 1a05          	or	a,(OFST+5,sp)
 319  001f f7            	ld	(x),a
 321  0020 2007          	jra	L151
 322  0022               L741:
 323                     ; 88       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 325  0022 1e01          	ldw	x,(OFST+1,sp)
 326  0024 7b05          	ld	a,(OFST+5,sp)
 327  0026 43            	cpl	a
 328  0027 f4            	and	a,(x)
 329  0028 f7            	ld	(x),a
 330  0029               L151:
 331                     ; 91     GPIOx->DDR |= GPIO_Pin;
 333  0029 1e01          	ldw	x,(OFST+1,sp)
 334  002b e602          	ld	a,(2,x)
 335  002d 1a05          	or	a,(OFST+5,sp)
 336  002f e702          	ld	(2,x),a
 338  0031 2009          	jra	L351
 339  0033               L541:
 340                     ; 95     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 342  0033 1e01          	ldw	x,(OFST+1,sp)
 343  0035 7b05          	ld	a,(OFST+5,sp)
 344  0037 43            	cpl	a
 345  0038 e402          	and	a,(2,x)
 346  003a e702          	ld	(2,x),a
 347  003c               L351:
 348                     ; 102   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 350  003c 7b06          	ld	a,(OFST+6,sp)
 351  003e a540          	bcp	a,#64
 352  0040 270a          	jreq	L551
 353                     ; 104     GPIOx->CR1 |= GPIO_Pin;
 355  0042 1e01          	ldw	x,(OFST+1,sp)
 356  0044 e603          	ld	a,(3,x)
 357  0046 1a05          	or	a,(OFST+5,sp)
 358  0048 e703          	ld	(3,x),a
 360  004a 2009          	jra	L751
 361  004c               L551:
 362                     ; 107     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 364  004c 1e01          	ldw	x,(OFST+1,sp)
 365  004e 7b05          	ld	a,(OFST+5,sp)
 366  0050 43            	cpl	a
 367  0051 e403          	and	a,(3,x)
 368  0053 e703          	ld	(3,x),a
 369  0055               L751:
 370                     ; 114   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 372  0055 7b06          	ld	a,(OFST+6,sp)
 373  0057 a520          	bcp	a,#32
 374  0059 270a          	jreq	L161
 375                     ; 116     GPIOx->CR2 |= GPIO_Pin;
 377  005b 1e01          	ldw	x,(OFST+1,sp)
 378  005d e604          	ld	a,(4,x)
 379  005f 1a05          	or	a,(OFST+5,sp)
 380  0061 e704          	ld	(4,x),a
 382  0063 2009          	jra	L361
 383  0065               L161:
 384                     ; 119     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 386  0065 1e01          	ldw	x,(OFST+1,sp)
 387  0067 7b05          	ld	a,(OFST+5,sp)
 388  0069 43            	cpl	a
 389  006a e404          	and	a,(4,x)
 390  006c e704          	ld	(4,x),a
 391  006e               L361:
 392                     ; 122 }
 395  006e 85            	popw	x
 396  006f 81            	ret
 442                     ; 132 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 442                     ; 133 {
 443                     	switch	.text
 444  0070               _GPIO_Write:
 446  0070 89            	pushw	x
 447       00000000      OFST:	set	0
 450                     ; 134   GPIOx->ODR = GPIO_PortVal;
 452  0071 7b05          	ld	a,(OFST+5,sp)
 453  0073 1e01          	ldw	x,(OFST+1,sp)
 454  0075 f7            	ld	(x),a
 455                     ; 135 }
 458  0076 85            	popw	x
 459  0077 81            	ret
 619                     ; 146 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 619                     ; 147 {
 620                     	switch	.text
 621  0078               _GPIO_WriteBit:
 623  0078 89            	pushw	x
 624       00000000      OFST:	set	0
 627                     ; 149   assert_param(IS_GPIO_PIN(GPIO_Pin));
 629                     ; 150   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 631                     ; 152   if (GPIO_BitVal != RESET)
 633  0079 0d06          	tnz	(OFST+6,sp)
 634  007b 2706          	jreq	L303
 635                     ; 154     GPIOx->ODR |= GPIO_Pin;
 637  007d f6            	ld	a,(x)
 638  007e 1a05          	or	a,(OFST+5,sp)
 639  0080 f7            	ld	(x),a
 641  0081 2007          	jra	L503
 642  0083               L303:
 643                     ; 159     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 645  0083 1e01          	ldw	x,(OFST+1,sp)
 646  0085 7b05          	ld	a,(OFST+5,sp)
 647  0087 43            	cpl	a
 648  0088 f4            	and	a,(x)
 649  0089 f7            	ld	(x),a
 650  008a               L503:
 651                     ; 161 }
 654  008a 85            	popw	x
 655  008b 81            	ret
 701                     ; 170 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 701                     ; 171 {
 702                     	switch	.text
 703  008c               _GPIO_SetBits:
 705  008c 89            	pushw	x
 706       00000000      OFST:	set	0
 709                     ; 172   GPIOx->ODR |= GPIO_Pin;
 711  008d f6            	ld	a,(x)
 712  008e 1a05          	or	a,(OFST+5,sp)
 713  0090 f7            	ld	(x),a
 714                     ; 173 }
 717  0091 85            	popw	x
 718  0092 81            	ret
 764                     ; 183 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 764                     ; 184 {
 765                     	switch	.text
 766  0093               _GPIO_ResetBits:
 768  0093 89            	pushw	x
 769       00000000      OFST:	set	0
 772                     ; 185   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 774  0094 7b05          	ld	a,(OFST+5,sp)
 775  0096 43            	cpl	a
 776  0097 f4            	and	a,(x)
 777  0098 f7            	ld	(x),a
 778                     ; 186 }
 781  0099 85            	popw	x
 782  009a 81            	ret
 828                     ; 195 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 828                     ; 196 {
 829                     	switch	.text
 830  009b               _GPIO_ToggleBits:
 832  009b 89            	pushw	x
 833       00000000      OFST:	set	0
 836                     ; 197   GPIOx->ODR ^= GPIO_Pin;
 838  009c f6            	ld	a,(x)
 839  009d 1805          	xor	a,(OFST+5,sp)
 840  009f f7            	ld	(x),a
 841                     ; 198 }
 844  00a0 85            	popw	x
 845  00a1 81            	ret
 882                     ; 206 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 882                     ; 207 {
 883                     	switch	.text
 884  00a2               _GPIO_ReadInputData:
 888                     ; 208   return ((uint8_t)GPIOx->IDR);
 890  00a2 e601          	ld	a,(1,x)
 893  00a4 81            	ret
 931                     ; 217 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 931                     ; 218 {
 932                     	switch	.text
 933  00a5               _GPIO_ReadOutputData:
 937                     ; 219   return ((uint8_t)GPIOx->ODR);
 939  00a5 f6            	ld	a,(x)
 942  00a6 81            	ret
 991                     ; 228 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 991                     ; 229 {
 992                     	switch	.text
 993  00a7               _GPIO_ReadInputDataBit:
 995  00a7 89            	pushw	x
 996       00000000      OFST:	set	0
 999                     ; 230   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1001  00a8 e601          	ld	a,(1,x)
1002  00aa 1405          	and	a,(OFST+5,sp)
1005  00ac 85            	popw	x
1006  00ad 81            	ret
1055                     ; 239 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1055                     ; 240 {
1056                     	switch	.text
1057  00ae               _GPIO_ReadOutputDataBit:
1059  00ae 89            	pushw	x
1060       00000000      OFST:	set	0
1063                     ; 241   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1065  00af f6            	ld	a,(x)
1066  00b0 1405          	and	a,(OFST+5,sp)
1069  00b2 85            	popw	x
1070  00b3 81            	ret
1147                     ; 251 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
1147                     ; 252 {
1148                     	switch	.text
1149  00b4               _GPIO_ExternalPullUpConfig:
1151  00b4 89            	pushw	x
1152       00000000      OFST:	set	0
1155                     ; 254   assert_param(IS_GPIO_PIN(GPIO_Pin));
1157                     ; 255   assert_param(IS_FUNCTIONAL_STATE(NewState));
1159                     ; 257   if (NewState != DISABLE) /* External Pull-Up Set*/
1161  00b5 0d06          	tnz	(OFST+6,sp)
1162  00b7 2708          	jreq	L355
1163                     ; 259     GPIOx->CR1 |= GPIO_Pin;
1165  00b9 e603          	ld	a,(3,x)
1166  00bb 1a05          	or	a,(OFST+5,sp)
1167  00bd e703          	ld	(3,x),a
1169  00bf 2009          	jra	L555
1170  00c1               L355:
1171                     ; 262     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1173  00c1 1e01          	ldw	x,(OFST+1,sp)
1174  00c3 7b05          	ld	a,(OFST+5,sp)
1175  00c5 43            	cpl	a
1176  00c6 e403          	and	a,(3,x)
1177  00c8 e703          	ld	(3,x),a
1178  00ca               L555:
1179                     ; 264 }
1182  00ca 85            	popw	x
1183  00cb 81            	ret
1196                     	xdef	_GPIO_ExternalPullUpConfig
1197                     	xdef	_GPIO_ReadOutputDataBit
1198                     	xdef	_GPIO_ReadInputDataBit
1199                     	xdef	_GPIO_ReadOutputData
1200                     	xdef	_GPIO_ReadInputData
1201                     	xdef	_GPIO_ToggleBits
1202                     	xdef	_GPIO_ResetBits
1203                     	xdef	_GPIO_SetBits
1204                     	xdef	_GPIO_WriteBit
1205                     	xdef	_GPIO_Write
1206                     	xdef	_GPIO_Init
1207                     	xdef	_GPIO_DeInit
1226                     	end
