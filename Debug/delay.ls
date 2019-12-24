   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  55                     ; 30 void delay_ms(u16 n_ms)
  55                     ; 31 {
  57                     	switch	.text
  58  0000               _delay_ms:
  60  0000 89            	pushw	x
  61       00000000      OFST:	set	0
  64                     ; 33   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
  66  0001 ae0201        	ldw	x,#513
  67  0004 cd0000        	call	_CLK_PeripheralClockConfig
  69                     ; 36   TIM4->PSCR = 6;
  71  0007 350652e8      	mov	21224,#6
  72                     ; 39   TIM4->ARR = 250;
  74  000b 35fa52e9      	mov	21225,#250
  75                     ; 42   TIM4->CNTR = 2;
  77  000f 350252e7      	mov	21223,#2
  78                     ; 45   TIM4->SR1 &= ~TIM4_SR1_UIF;
  80  0013 721152e5      	bres	21221,#0
  81                     ; 48   TIM4->CR1 |= TIM4_CR1_CEN;
  83  0017 721052e0      	bset	21216,#0
  85  001b 200b          	jra	L13
  86  001d               L73:
  87                     ; 52     while((TIM4->SR1 & TIM4_SR1_UIF) == 0) ;
  89  001d c652e5        	ld	a,21221
  90  0020 a501          	bcp	a,#1
  91  0022 27f9          	jreq	L73
  92                     ; 53     TIM4->SR1 &= ~TIM4_SR1_UIF;
  94  0024 721152e5      	bres	21221,#0
  95  0028               L13:
  96                     ; 50   while(n_ms--)
  98  0028 1e01          	ldw	x,(OFST+1,sp)
  99  002a 1d0001        	subw	x,#1
 100  002d 1f01          	ldw	(OFST+1,sp),x
 101  002f 1c0001        	addw	x,#1
 102  0032 a30000        	cpw	x,#0
 103  0035 26e6          	jrne	L73
 104                     ; 57   TIM4->CR1 &= ~TIM4_CR1_CEN;
 106  0037 721152e0      	bres	21216,#0
 107                     ; 58 }
 110  003b 85            	popw	x
 111  003c 81            	ret
 146                     ; 66 void delay_10us(u16 n_10us)
 146                     ; 67 {
 147                     	switch	.text
 148  003d               _delay_10us:
 150  003d 89            	pushw	x
 151       00000000      OFST:	set	0
 154                     ; 69   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 156  003e ae0201        	ldw	x,#513
 157  0041 cd0000        	call	_CLK_PeripheralClockConfig
 159                     ; 72   TIM4->PSCR = 0;
 161  0044 725f52e8      	clr	21224
 162                     ; 75   TIM4->ARR = 160;
 164  0048 35a052e9      	mov	21225,#160
 165                     ; 78   TIM4->CNTR = 10;
 167  004c 350a52e7      	mov	21223,#10
 168                     ; 81   TIM4->SR1 &= ~TIM4_SR1_UIF;
 170  0050 721152e5      	bres	21221,#0
 171                     ; 84   TIM4->CR1 |= TIM4_CR1_CEN;
 173  0054 721052e0      	bset	21216,#0
 175  0058 200b          	jra	L36
 176  005a               L17:
 177                     ; 88     while((TIM4->SR1 & TIM4_SR1_UIF) == 0) ;
 179  005a c652e5        	ld	a,21221
 180  005d a501          	bcp	a,#1
 181  005f 27f9          	jreq	L17
 182                     ; 89     TIM4->SR1 &= ~TIM4_SR1_UIF;
 184  0061 721152e5      	bres	21221,#0
 185  0065               L36:
 186                     ; 86   while(n_10us--)
 188  0065 1e01          	ldw	x,(OFST+1,sp)
 189  0067 1d0001        	subw	x,#1
 190  006a 1f01          	ldw	(OFST+1,sp),x
 191  006c 1c0001        	addw	x,#1
 192  006f a30000        	cpw	x,#0
 193  0072 26e6          	jrne	L17
 194                     ; 93   TIM4->CR1 &= ~TIM4_CR1_CEN;
 196  0074 721152e0      	bres	21216,#0
 197                     ; 94  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
 199  0078 ae0200        	ldw	x,#512
 200  007b cd0000        	call	_CLK_PeripheralClockConfig
 202                     ; 96 }
 205  007e 85            	popw	x
 206  007f 81            	ret
 219                     	xref	_CLK_PeripheralClockConfig
 220                     	xdef	_delay_10us
 221                     	xdef	_delay_ms
 240                     	end
