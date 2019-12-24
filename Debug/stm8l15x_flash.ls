   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  76                     ; 85 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  76                     ; 86 {
  78                     	switch	.text
  79  0000               _FLASH_Unlock:
  81  0000 88            	push	a
  82       00000000      OFST:	set	0
  85                     ; 88   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
  87                     ; 91   if (FLASH_MemType == FLASH_MemType_Program)
  89  0001 a1fd          	cp	a,#253
  90  0003 2608          	jrne	L73
  91                     ; 93     FLASH->PUKR = FLASH_RASS_KEY1;
  93  0005 35565052      	mov	20562,#86
  94                     ; 94     FLASH->PUKR = FLASH_RASS_KEY2;
  96  0009 35ae5052      	mov	20562,#174
  97  000d               L73:
  98                     ; 98   if (FLASH_MemType == FLASH_MemType_Data)
 100  000d 7b01          	ld	a,(OFST+1,sp)
 101  000f a1f7          	cp	a,#247
 102  0011 2608          	jrne	L14
 103                     ; 100     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 105  0013 35ae5053      	mov	20563,#174
 106                     ; 101     FLASH->DUKR = FLASH_RASS_KEY1;
 108  0017 35565053      	mov	20563,#86
 109  001b               L14:
 110                     ; 103 }
 113  001b 84            	pop	a
 114  001c 81            	ret
 149                     ; 111 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 149                     ; 112 {
 150                     	switch	.text
 151  001d               _FLASH_Lock:
 155                     ; 114   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 157                     ; 116   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 159  001d c45054        	and	a,20564
 160  0020 c75054        	ld	20564,a
 161                     ; 117 }
 164  0023 81            	ret
 187                     ; 124 void FLASH_DeInit(void)
 187                     ; 125 {
 188                     	switch	.text
 189  0024               _FLASH_DeInit:
 193                     ; 126   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 195  0024 725f5050      	clr	20560
 196                     ; 127   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 198  0028 725f5051      	clr	20561
 199                     ; 128   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 201  002c 35405054      	mov	20564,#64
 202                     ; 129   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 204  0030 c65054        	ld	a,20564
 205                     ; 130 }
 208  0033 81            	ret
 263                     ; 138 void FLASH_ITConfig(FunctionalState NewState)
 263                     ; 139 {
 264                     	switch	.text
 265  0034               _FLASH_ITConfig:
 269                     ; 142   assert_param(IS_FUNCTIONAL_STATE(NewState));
 271                     ; 144   if (NewState != DISABLE)
 273  0034 4d            	tnz	a
 274  0035 2706          	jreq	L711
 275                     ; 147     FLASH->CR1 |= FLASH_CR1_IE;
 277  0037 72125050      	bset	20560,#1
 279  003b 2004          	jra	L121
 280  003d               L711:
 281                     ; 152     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
 283  003d 72135050      	bres	20560,#1
 284  0041               L121:
 285                     ; 154 }
 288  0041 81            	ret
 322                     ; 161 void FLASH_EraseByte(uint32_t Address)
 322                     ; 162 {
 323                     	switch	.text
 324  0042               _FLASH_EraseByte:
 326       00000000      OFST:	set	0
 329                     ; 164   assert_param(IS_FLASH_ADDRESS(Address));
 331                     ; 166   *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 333  0042 1e05          	ldw	x,(OFST+5,sp)
 334  0044 7f            	clr	(x)
 335                     ; 167 }
 338  0045 81            	ret
 381                     ; 174 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 381                     ; 175 {
 382                     	switch	.text
 383  0046               _FLASH_ProgramByte:
 385       00000000      OFST:	set	0
 388                     ; 177   assert_param(IS_FLASH_ADDRESS(Address));
 390                     ; 179   *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 392  0046 7b07          	ld	a,(OFST+7,sp)
 393  0048 1e05          	ldw	x,(OFST+5,sp)
 394  004a f7            	ld	(x),a
 395                     ; 180 }
 398  004b 81            	ret
 441                     ; 188 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 441                     ; 189 {
 442                     	switch	.text
 443  004c               _FLASH_ProgramWord:
 445       00000000      OFST:	set	0
 448                     ; 191   assert_param(IS_FLASH_ADDRESS(Address));
 450                     ; 193   FLASH->CR2 |= FLASH_CR2_WPRG;
 452  004c 721c5051      	bset	20561,#6
 453                     ; 196   *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));   
 455  0050 7b07          	ld	a,(OFST+7,sp)
 456  0052 1e05          	ldw	x,(OFST+5,sp)
 457  0054 f7            	ld	(x),a
 458                     ; 198   *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data) + 1);
 460  0055 7b08          	ld	a,(OFST+8,sp)
 461  0057 1e05          	ldw	x,(OFST+5,sp)
 462  0059 e701          	ld	(1,x),a
 463                     ; 200   *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 465  005b 7b09          	ld	a,(OFST+9,sp)
 466  005d 1e05          	ldw	x,(OFST+5,sp)
 467  005f e702          	ld	(2,x),a
 468                     ; 202   *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 470  0061 7b0a          	ld	a,(OFST+10,sp)
 471  0063 1e05          	ldw	x,(OFST+5,sp)
 472  0065 e703          	ld	(3,x),a
 473                     ; 203 }
 476  0067 81            	ret
 521                     ; 211 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 521                     ; 212 {
 522                     	switch	.text
 523  0068               _FLASH_ProgramOptionByte:
 525  0068 89            	pushw	x
 526       00000000      OFST:	set	0
 529                     ; 214   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 531                     ; 217   FLASH->CR2 |= FLASH_CR2_OPT;
 533  0069 721e5051      	bset	20561,#7
 534                     ; 220   *((PointerAttr uint8_t*)Address) = Data;
 536  006d 7b05          	ld	a,(OFST+5,sp)
 537  006f 1e01          	ldw	x,(OFST+1,sp)
 538  0071 f7            	ld	(x),a
 539                     ; 222   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 541  0072 a6fd          	ld	a,#253
 542  0074 cd0112        	call	_FLASH_WaitForLastOperation
 544                     ; 225   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 546  0077 721f5051      	bres	20561,#7
 547                     ; 226 }
 550  007b 85            	popw	x
 551  007c 81            	ret
 587                     ; 233 void FLASH_EraseOptionByte(uint16_t Address)
 587                     ; 234 {
 588                     	switch	.text
 589  007d               _FLASH_EraseOptionByte:
 593                     ; 236   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 595                     ; 239   FLASH->CR2 |= FLASH_CR2_OPT;
 597  007d 721e5051      	bset	20561,#7
 598                     ; 242   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 600  0081 7f            	clr	(x)
 601                     ; 244   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 603  0082 a6fd          	ld	a,#253
 604  0084 cd0112        	call	_FLASH_WaitForLastOperation
 606                     ; 247   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 608  0087 721f5051      	bres	20561,#7
 609                     ; 248 }
 612  008b 81            	ret
 646                     ; 255 uint8_t FLASH_ReadByte(uint32_t Address)
 646                     ; 256 {
 647                     	switch	.text
 648  008c               _FLASH_ReadByte:
 650       00000000      OFST:	set	0
 653                     ; 258   return(*(PointerAttr uint8_t *) (uint16_t)Address);
 655  008c 1e05          	ldw	x,(OFST+5,sp)
 656  008e f6            	ld	a,(x)
 659  008f 81            	ret
 717                     ; 266 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
 717                     ; 267 {
 718                     	switch	.text
 719  0090               _FLASH_SetProgrammingTime:
 723                     ; 269   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
 725                     ; 271   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
 727  0090 72115050      	bres	20560,#0
 728                     ; 272   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
 730  0094 ca5050        	or	a,20560
 731  0097 c75050        	ld	20560,a
 732                     ; 273 }
 735  009a 81            	ret
 791                     ; 283 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 791                     ; 284 {
 792                     	switch	.text
 793  009b               _FLASH_PowerWaitModeConfig:
 797                     ; 286   assert_param(IS_FLASH_POWER(FLASH_Power));
 799                     ; 289   if (FLASH_Power != FLASH_Power_On)
 801  009b a101          	cp	a,#1
 802  009d 2706          	jreq	L733
 803                     ; 291     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 805  009f 72145050      	bset	20560,#2
 807  00a3 2004          	jra	L143
 808  00a5               L733:
 809                     ; 296     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 811  00a5 72155050      	bres	20560,#2
 812  00a9               L143:
 813                     ; 298 }
 816  00a9 81            	ret
 841                     ; 305 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 841                     ; 306 {
 842                     	switch	.text
 843  00aa               _FLASH_GetProgrammingTime:
 847                     ; 307   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 849  00aa c65050        	ld	a,20560
 850  00ad a401          	and	a,#1
 853  00af 81            	ret
 887                     ; 315 uint16_t FLASH_GetBootSize(void)
 887                     ; 316 {
 888                     	switch	.text
 889  00b0               _FLASH_GetBootSize:
 891  00b0 89            	pushw	x
 892       00000002      OFST:	set	2
 895                     ; 317   uint16_t temp = 0;
 897                     ; 320   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 899  00b1 c64802        	ld	a,18434
 900  00b4 5f            	clrw	x
 901  00b5 97            	ld	xl,a
 902  00b6 4f            	clr	a
 903  00b7 02            	rlwa	x,a
 904  00b8 44            	srl	a
 905  00b9 56            	rrcw	x
 906  00ba 1f01          	ldw	(OFST-1,sp),x
 908                     ; 323   if (OPT->UBC > 0x7F)
 910  00bc c64802        	ld	a,18434
 911  00bf a180          	cp	a,#128
 912  00c1 2505          	jrult	L173
 913                     ; 325     temp = 8192;
 915  00c3 ae2000        	ldw	x,#8192
 916  00c6 1f01          	ldw	(OFST-1,sp),x
 918  00c8               L173:
 919                     ; 329   return(temp);
 921  00c8 1e01          	ldw	x,(OFST-1,sp)
 924  00ca 5b02          	addw	sp,#2
 925  00cc 81            	ret
 959                     ; 338 uint16_t FLASH_GetCodeSize(void)
 959                     ; 339 {
 960                     	switch	.text
 961  00cd               _FLASH_GetCodeSize:
 963  00cd 89            	pushw	x
 964       00000002      OFST:	set	2
 967                     ; 340   uint16_t temp = 0;
 969                     ; 343   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 971  00ce c64807        	ld	a,18439
 972  00d1 5f            	clrw	x
 973  00d2 97            	ld	xl,a
 974  00d3 4f            	clr	a
 975  00d4 02            	rlwa	x,a
 976  00d5 44            	srl	a
 977  00d6 56            	rrcw	x
 978  00d7 1f01          	ldw	(OFST-1,sp),x
 980                     ; 346   if (OPT->PCODESIZE > 0x7F)
 982  00d9 c64807        	ld	a,18439
 983  00dc a180          	cp	a,#128
 984  00de 2505          	jrult	L114
 985                     ; 348     temp = 8192;
 987  00e0 ae2000        	ldw	x,#8192
 988  00e3 1f01          	ldw	(OFST-1,sp),x
 990  00e5               L114:
 991                     ; 352   return(temp);
 993  00e5 1e01          	ldw	x,(OFST-1,sp)
 996  00e7 5b02          	addw	sp,#2
 997  00e9 81            	ret
1034                     ; 361 FunctionalState FLASH_GetReadOutProtectionStatus(void)
1034                     ; 362 {
1035                     	switch	.text
1036  00ea               _FLASH_GetReadOutProtectionStatus:
1038  00ea 88            	push	a
1039       00000001      OFST:	set	1
1042                     ; 363   FunctionalState state = DISABLE;
1044                     ; 365   if (OPT->ROP == FLASH_READOUTPROTECTION_KEY)
1046  00eb c64800        	ld	a,18432
1047  00ee a1aa          	cp	a,#170
1048  00f0 2606          	jrne	L134
1049                     ; 368     state =  ENABLE;
1051  00f2 a601          	ld	a,#1
1052  00f4 6b01          	ld	(OFST+0,sp),a
1055  00f6 2002          	jra	L334
1056  00f8               L134:
1057                     ; 373     state =  DISABLE;
1059  00f8 0f01          	clr	(OFST+0,sp)
1061  00fa               L334:
1062                     ; 376   return state;
1064  00fa 7b01          	ld	a,(OFST+0,sp)
1067  00fc 5b01          	addw	sp,#1
1068  00fe 81            	ret
1177                     ; 386 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1177                     ; 387 {
1178                     	switch	.text
1179  00ff               _FLASH_GetFlagStatus:
1181  00ff 88            	push	a
1182       00000001      OFST:	set	1
1185                     ; 388   FlagStatus status = RESET;
1187                     ; 389   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1189                     ; 392   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1191  0100 c45054        	and	a,20564
1192  0103 2706          	jreq	L505
1193                     ; 394     status = SET; /* Flash_FLAG is set*/
1195  0105 a601          	ld	a,#1
1196  0107 6b01          	ld	(OFST+0,sp),a
1199  0109 2002          	jra	L705
1200  010b               L505:
1201                     ; 398     status = RESET; /* Flash_FLAG is reset*/
1203  010b 0f01          	clr	(OFST+0,sp)
1205  010d               L705:
1206                     ; 402   return status;
1208  010d 7b01          	ld	a,(OFST+0,sp)
1211  010f 5b01          	addw	sp,#1
1212  0111 81            	ret
1297                     ; 524 FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType) IN_RAM
1297                     ; 525 {
1298                     	switch	.text
1299  0112               _FLASH_WaitForLastOperation:
1301  0112 5205          	subw	sp,#5
1302       00000005      OFST:	set	5
1305                     ; 526   uint32_t timeout = OPERATION_TIMEOUT;
1307  0114 aeffff        	ldw	x,#65535
1308  0117 1f03          	ldw	(OFST-2,sp),x
1309  0119 ae0000        	ldw	x,#0
1310  011c 1f01          	ldw	(OFST-4,sp),x
1312                     ; 527   uint8_t flagstatus = 0x00;
1314  011e 0f05          	clr	(OFST+0,sp)
1316                     ; 529   if (FLASH_MemType == FLASH_MemType_Program)
1318  0120 a1fd          	cp	a,#253
1319  0122 2631          	jrne	L765
1321  0124 2010          	jra	L555
1322  0126               L355:
1323                     ; 533       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1323                     ; 534                              FLASH_IAPSR_WR_PG_DIS));
1325  0126 c65054        	ld	a,20564
1326  0129 a405          	and	a,#5
1327  012b 6b05          	ld	(OFST+0,sp),a
1329                     ; 535       timeout--;
1331  012d 96            	ldw	x,sp
1332  012e 1c0001        	addw	x,#OFST-4
1333  0131 a601          	ld	a,#1
1334  0133 cd0000        	call	c_lgsbc
1337  0136               L555:
1338                     ; 531   while ((flagstatus == 0x00) && (timeout != 0x00))
1340  0136 0d05          	tnz	(OFST+0,sp)
1341  0138 2628          	jrne	L365
1343  013a 96            	ldw	x,sp
1344  013b 1c0001        	addw	x,#OFST-4
1345  013e cd0000        	call	c_lzmp
1347  0141 26e3          	jrne	L355
1348  0143 201d          	jra	L365
1349  0145               L565:
1350                     ; 542       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1350                     ; 543                              FLASH_IAPSR_WR_PG_DIS));
1352  0145 c65054        	ld	a,20564
1353  0148 a441          	and	a,#65
1354  014a 6b05          	ld	(OFST+0,sp),a
1356                     ; 544       timeout--;
1358  014c 96            	ldw	x,sp
1359  014d 1c0001        	addw	x,#OFST-4
1360  0150 a601          	ld	a,#1
1361  0152 cd0000        	call	c_lgsbc
1364  0155               L765:
1365                     ; 540     while ((flagstatus == 0x00) && (timeout != 0x00))
1367  0155 0d05          	tnz	(OFST+0,sp)
1368  0157 2609          	jrne	L365
1370  0159 96            	ldw	x,sp
1371  015a 1c0001        	addw	x,#OFST-4
1372  015d cd0000        	call	c_lzmp
1374  0160 26e3          	jrne	L565
1375  0162               L365:
1376                     ; 547   if (timeout == 0x00 )
1378  0162 96            	ldw	x,sp
1379  0163 1c0001        	addw	x,#OFST-4
1380  0166 cd0000        	call	c_lzmp
1382  0169 2604          	jrne	L575
1383                     ; 549   flagstatus = FLASH_Status_TimeOut;
1385  016b a602          	ld	a,#2
1386  016d 6b05          	ld	(OFST+0,sp),a
1388  016f               L575:
1389                     ; 552   return((FLASH_Status_TypeDef)flagstatus);
1391  016f 7b05          	ld	a,(OFST+0,sp)
1394  0171 5b05          	addw	sp,#5
1395  0173 81            	ret
1431                     ; 567 void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power) IN_RAM
1431                     ; 568 {
1432                     	switch	.text
1433  0174               _FLASH_PowerRunModeConfig:
1437                     ; 570   assert_param(IS_FLASH_POWER(FLASH_Power));
1439                     ; 572   if (FLASH_Power != FLASH_Power_On)
1441  0174 a101          	cp	a,#1
1442  0176 2706          	jreq	L516
1443                     ; 574   FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1445  0178 72165050      	bset	20560,#3
1447  017c 2004          	jra	L716
1448  017e               L516:
1449                     ; 578     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1451  017e 72175050      	bres	20560,#3
1452  0182               L716:
1453                     ; 580 }
1456  0182 81            	ret
1520                     ; 593 FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void) IN_RAM
1520                     ; 594 {
1521                     	switch	.text
1522  0183               _FLASH_GetPowerStatus:
1526                     ; 595   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1528  0183 c65050        	ld	a,20560
1529  0186 a40c          	and	a,#12
1532  0188 81            	ret
1636                     ; 611 void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1636                     ; 612                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer) IN_RAM
1636                     ; 613 {
1637                     	switch	.text
1638  0189               _FLASH_ProgramBlock:
1640  0189 89            	pushw	x
1641  018a 5206          	subw	sp,#6
1642       00000006      OFST:	set	6
1645                     ; 614   uint16_t Count = 0;
1647                     ; 615   uint32_t startaddress = 0;
1649                     ; 618   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1651                     ; 619   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1653                     ; 620   if (FLASH_MemType == FLASH_MemType_Program)
1655  018c 7b0b          	ld	a,(OFST+5,sp)
1656  018e a1fd          	cp	a,#253
1657  0190 260c          	jrne	L717
1658                     ; 622   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1660                     ; 623     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1662  0192 ae8000        	ldw	x,#32768
1663  0195 1f03          	ldw	(OFST-3,sp),x
1664  0197 ae0000        	ldw	x,#0
1665  019a 1f01          	ldw	(OFST-5,sp),x
1668  019c 200a          	jra	L127
1669  019e               L717:
1670                     ; 627     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1672                     ; 628     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1674  019e ae1000        	ldw	x,#4096
1675  01a1 1f03          	ldw	(OFST-3,sp),x
1676  01a3 ae0000        	ldw	x,#0
1677  01a6 1f01          	ldw	(OFST-5,sp),x
1679  01a8               L127:
1680                     ; 632   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1682  01a8 1e07          	ldw	x,(OFST+1,sp)
1683  01aa a680          	ld	a,#128
1684  01ac cd0000        	call	c_cmulx
1686  01af 96            	ldw	x,sp
1687  01b0 1c0001        	addw	x,#OFST-5
1688  01b3 cd0000        	call	c_lgadd
1691                     ; 635   if (FLASH_ProgMode == FLASH_ProgramMode_Standard)
1693  01b6 0d0c          	tnz	(OFST+6,sp)
1694  01b8 2606          	jrne	L327
1695                     ; 638   FLASH->CR2 |= FLASH_CR2_PRG;
1697  01ba 72105051      	bset	20561,#0
1699  01be 2004          	jra	L527
1700  01c0               L327:
1701                     ; 643   FLASH->CR2 |= FLASH_CR2_FPRG;
1703  01c0 72185051      	bset	20561,#4
1704  01c4               L527:
1705                     ; 647   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1707  01c4 5f            	clrw	x
1708  01c5 1f05          	ldw	(OFST-1,sp),x
1710  01c7               L727:
1711                     ; 650   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1713  01c7 1e0d          	ldw	x,(OFST+7,sp)
1714  01c9 72fb05        	addw	x,(OFST-1,sp)
1715  01cc f6            	ld	a,(x)
1716  01cd 1e03          	ldw	x,(OFST-3,sp)
1717  01cf 72fb05        	addw	x,(OFST-1,sp)
1718  01d2 f7            	ld	(x),a
1719                     ; 647   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1721  01d3 1e05          	ldw	x,(OFST-1,sp)
1722  01d5 1c0001        	addw	x,#1
1723  01d8 1f05          	ldw	(OFST-1,sp),x
1727  01da 1e05          	ldw	x,(OFST-1,sp)
1728  01dc a30080        	cpw	x,#128
1729  01df 25e6          	jrult	L727
1730                     ; 655 }
1733  01e1 5b08          	addw	sp,#8
1734  01e3 81            	ret
1797                     ; 668 void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType) IN_RAM
1797                     ; 669 {
1798                     	switch	.text
1799  01e4               _FLASH_EraseBlock:
1801  01e4 89            	pushw	x
1802  01e5 5206          	subw	sp,#6
1803       00000006      OFST:	set	6
1806                     ; 670   uint32_t startaddress = 0;
1808                     ; 678   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1810                     ; 679   if (FLASH_MemType == FLASH_MemType_Program)
1812  01e7 7b0b          	ld	a,(OFST+5,sp)
1813  01e9 a1fd          	cp	a,#253
1814  01eb 260c          	jrne	L767
1815                     ; 681   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1817                     ; 682     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1819  01ed ae8000        	ldw	x,#32768
1820  01f0 1f05          	ldw	(OFST-1,sp),x
1821  01f2 ae0000        	ldw	x,#0
1822  01f5 1f03          	ldw	(OFST-3,sp),x
1825  01f7 200a          	jra	L177
1826  01f9               L767:
1827                     ; 686     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1829                     ; 687     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1831  01f9 ae1000        	ldw	x,#4096
1832  01fc 1f05          	ldw	(OFST-1,sp),x
1833  01fe ae0000        	ldw	x,#0
1834  0201 1f03          	ldw	(OFST-3,sp),x
1836  0203               L177:
1837                     ; 692   pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1839  0203 1e07          	ldw	x,(OFST+1,sp)
1840  0205 a680          	ld	a,#128
1841  0207 cd0000        	call	c_cmulx
1843  020a 96            	ldw	x,sp
1844  020b 1c0003        	addw	x,#OFST-3
1845  020e cd0000        	call	c_ladd
1847  0211 be02          	ldw	x,c_lreg+2
1848  0213 1f01          	ldw	(OFST-5,sp),x
1850                     ; 698   FLASH->CR2 |= FLASH_CR2_ERASE;
1852  0215 721a5051      	bset	20561,#5
1853                     ; 701   *pwFlash = (uint32_t)0;
1855  0219 1e01          	ldw	x,(OFST-5,sp)
1856  021b a600          	ld	a,#0
1857  021d e703          	ld	(3,x),a
1858  021f a600          	ld	a,#0
1859  0221 e702          	ld	(2,x),a
1860  0223 a600          	ld	a,#0
1861  0225 e701          	ld	(1,x),a
1862  0227 a600          	ld	a,#0
1863  0229 f7            	ld	(x),a
1864                     ; 708 }
1867  022a 5b08          	addw	sp,#8
1868  022c 81            	ret
1881                     	xdef	_FLASH_EraseBlock
1882                     	xdef	_FLASH_ProgramBlock
1883                     	xdef	_FLASH_GetPowerStatus
1884                     	xdef	_FLASH_PowerRunModeConfig
1885                     	xdef	_FLASH_WaitForLastOperation
1886                     	xdef	_FLASH_GetFlagStatus
1887                     	xdef	_FLASH_PowerWaitModeConfig
1888                     	xdef	_FLASH_GetReadOutProtectionStatus
1889                     	xdef	_FLASH_GetCodeSize
1890                     	xdef	_FLASH_GetBootSize
1891                     	xdef	_FLASH_SetProgrammingTime
1892                     	xdef	_FLASH_GetProgrammingTime
1893                     	xdef	_FLASH_EraseOptionByte
1894                     	xdef	_FLASH_ProgramOptionByte
1895                     	xdef	_FLASH_ReadByte
1896                     	xdef	_FLASH_ProgramWord
1897                     	xdef	_FLASH_EraseByte
1898                     	xdef	_FLASH_ProgramByte
1899                     	xdef	_FLASH_ITConfig
1900                     	xdef	_FLASH_Lock
1901                     	xdef	_FLASH_Unlock
1902                     	xdef	_FLASH_DeInit
1903                     	xref.b	c_lreg
1922                     	xref	c_ladd
1923                     	xref	c_lgadd
1924                     	xref	c_cmulx
1925                     	xref	c_lzmp
1926                     	xref	c_lgsbc
1927                     	end
