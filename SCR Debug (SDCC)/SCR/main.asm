;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13448 (MINGW32)
;--------------------------------------------------------
	.file	"main.c"
;	.optsdcc -mmcs51
	; --model-large

	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl	_EXINT5IS_interrupt
	.globl	_EXINT2IS_interrupt
	.globl	_rtc_interrupt
	.globl	_main
	.globl	_IsStandbyMode
	.globl	_gpio_init
	.globl	_CaptureFlag
	.globl	_RissingEdge
	.globl	_FellingEdge
	.globl	_retunr_value
	.globl	_delay
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.section .bdata.i51,"aw" ;reg_name ;area
_SCR_DAPISC	=	0x0011
_SCR_P00_OUT	=	0x0090
_SCR_P00_IN	=	0x0091
_SCR_P00_OMSR	=	0x0092
_SCR_P00_OMCR	=	0x0093
_SCR_P00_OMTR	=	0x0094
_SCR_P01_OUT	=	0x0098
_SCR_P01_IN	=	0x0099
_SCR_P01_OMSR	=	0x009a
_SCR_P01_OMCR	=	0x009b
_SCR_P01_OMTR	=	0x009c
_SCR_WCAN_CFG	=	0x00b0
_SCR_WCAN_INTMRSLT	=	0x00b1
_SCR_WCAN_CDR_CTRL	=	0x00b2
_SCR_WCAN_CDR_UPPER_CTRL	=	0x00b3
_SCR_WCAN_CDR_LOWER_CTRL	=	0x00b4
_SCR_WCAN_CDR_MEAS_HIGH	=	0x00b5
_SCR_WCAN_CDR_MEAS_LOW	=	0x00b6
_SCR_WCAN_FD_CTRL	=	0x00b7
_SCR_T2_CON	=	0x00c0
_SCR_T2_MOD	=	0x00c1
_SCR_T2_RC2L	=	0x00c2
_SCR_T2_RC2H	=	0x00c3
_SCR_T2_T2L	=	0x00c4
_SCR_T2_T2H	=	0x00c5
_SCR_T2_CON1	=	0x00c6
_SCR_IRCON0	=	0x00f2
_SCR_IRCON1	=	0x00f3
_SCR_IRCON2	=	0x00f4
_SCR_SCRINTEXCHG	=	0x00f5
_SCR_TCINTEXCHG	=	0x00f6
_SCR_SCU_RSTST	=	0x00f7
_SCR_SCU_MRSTST	=	0x00f8
_SCR_SCU_SR	=	0x00f9
_SCR_WDT_CON	=	0x0081
_SCR_WDT_REL	=	0x0082
_SCR_WDT_WINB	=	0x0083
_SCR_WDT_L	=	0x0084
_SCR_WDT_H	=	0x0085
_SCR_SSC_CONOL	=	0x0089
_SCR_SSC_CONPL	=	0x0089
_SCR_SSC_CONPH	=	0x008a
_SCR_SSC_CONOH	=	0x008a
_SCR_SSC_TBL	=	0x008b
_SCR_SSC_RBL	=	0x008c
_SCR_SSC_BRL	=	0x008d
_SCR_SSC_BRH	=	0x008e
_SCR_IO_PAGE	=	0x008f
_SCR_WCAN_PAGE	=	0x00b8
_SCR_UART_SCON	=	0x00b9
_SCR_UART_SBUF	=	0x00ba
_SCR_UART_BGL	=	0x00bc
_SCR_UART_BCON	=	0x00bd
_SCR_UART_LINST	=	0x00be
_SCR_UART_BGH	=	0x00bf
_SCR_T2CCU_PAGE	=	0x00c7
_SCR_RTC_CON	=	0x00e1
_SCR_RTC_CNT0	=	0x00e2
_SCR_RTC_CNT1	=	0x00e3
_SCR_RTC_CNT2	=	0x00e4
_SCR_RTC_CNT3	=	0x00e5
_SCR_RTC_CR0	=	0x00e6
_SCR_RTC_CR1	=	0x00e7
_SCR_RTC_CR2	=	0x00e8
_SCR_RTC_CR3	=	0x00e9
_SCR_SCU_PAGE	=	0x00f1
_SCR_DBG_MMCR	=	0x00f1
_SCR_DBG_MMCR2	=	0x00f2
_SCR_DBG_MMSR	=	0x00f3
_SCR_DBG_MMBPCR	=	0x00f4
_SCR_DBG_MMICR	=	0x00f5
_SCR_DBG_MMDR	=	0x00f6
_SCR_DBG_HWBPSR	=	0x00f7
_SCR_DBG_HWBPDR	=	0x00f8
_SCR_DBG_MMWR1	=	0x00f9
_SCR_DBG_MMWR2	=	0x00fa
_SCR_PASSWD	=	0x0086
_SCR_XADDRH	=	0x0087
_SCR_SYSCON0	=	0x0088
_SCR_T01_TCON	=	0x00c9
_SCR_T01_TMOD	=	0x00ca
_SCR_T01_TL0	=	0x00cb
_SCR_T01_TL1	=	0x00cc
_SCR_T01_TH0	=	0x00cd
_SCR_T01_TH1	=	0x00ce
_SCR_PSW	=	0x00d0
_SCR_IEN1	=	0x00d1
_SCR_IPH	=	0x00d2
_SCR_IPH1	=	0x00d3
_SCR_SP	=	0x00d4
_SCR_DPL	=	0x00d5
_SCR_DPH	=	0x00d6
_SCR_EO	=	0x00d7
_SCR_IEN0	=	0x00d8
_SCR_PCON	=	0x00d9
_SCR_B	=	0x00da
_SCR_IP1	=	0x00db
_SCR_IP	=	0x00dc
_SCR_ACC	=	0x00e0
_SCR_P00_IOCR0	=	0x0090
_SCR_P00_IOCR1	=	0x0091
_SCR_P00_IOCR2	=	0x0092
_SCR_P00_IOCR3	=	0x0093
_SCR_P00_IOCR4	=	0x0094
_SCR_P00_IOCR5	=	0x0095
_SCR_P00_IOCR6	=	0x0096
_SCR_P00_IOCR7	=	0x0097
_SCR_P01_IOCR0	=	0x0098
_SCR_P01_IOCR1	=	0x0099
_SCR_P01_IOCR2	=	0x009a
_SCR_P01_IOCR3	=	0x009b
_SCR_P01_IOCR4	=	0x009c
_SCR_P01_IOCR5	=	0x009d
_SCR_P01_IOCR6	=	0x009e
_SCR_P01_IOCR7	=	0x009f
_SCR_WCAN_INTESTAT0	=	0x00b0
_SCR_WCAN_INTESTAT1	=	0x00b1
_SCR_WCAN_FRMERRCNT	=	0x00b2
_SCR_WCAN_INTESCLR0	=	0x00b3
_SCR_WCAN_INTESCLR1	=	0x00b4
_SCR_WCAN_BTL1_CTRL	=	0x00b5
_SCR_WCAN_BTL2_CTRL	=	0x00b6
_SCR_WCAN_DLC_CTRL	=	0x00b7
_SCR_T2CCU_CCEN	=	0x00c0
_SCR_T2CCU_CCTBSEL	=	0x00c1
_SCR_T2CCU_CCTRELL	=	0x00c2
_SCR_T2CCU_CCTRELH	=	0x00c3
_SCR_T2CCU_CCTL	=	0x00c4
_SCR_T2CCU_CCTH	=	0x00c5
_SCR_T2CCU_CCTCON	=	0x00c6
_SCR_NMISR	=	0x00f2
_SCR_NMICON	=	0x00f3
_SCR_EXICON0	=	0x00f4
_SCR_EXICON1	=	0x00f5
_SCR_EXICON2	=	0x00f6
_SCR_EXICON3	=	0x00f7
_SCR_SCU_MODIEN	=	0x00f8
_SCR_SCU_RSTCON	=	0x00f9
_SCR_SCU_CMCON	=	0x00fa
_SCR_SCU_PMCON1	=	0x00fb
_SCR_SCU_STDBYWKP	=	0x00fc
_SCR_EVRADCSTAT0	=	0x00fd
_SCR_EVRADCSTAT1	=	0x00fe
_SCR_EVRADCSTAT2	=	0x00ff
_SCR_P00_PDR0	=	0x0090
_SCR_P00_PDR2	=	0x0091
_SCR_P00_PDR4	=	0x0092
_SCR_P00_PDR6	=	0x0093
_SCR_P00_PDISC	=	0x0095
_SCR_P01_PDR0	=	0x0098
_SCR_P01_PDR2	=	0x0099
_CR_P01_PDR4	=	0x009a
_SCR_P01_PDR6	=	0x009b
_SCR_P01_PDISC	=	0x009d
_SCR_T2CCU_COSHDW	=	0x00c0
_SCR_T2CCU_CC0L	=	0x00c1
_SCR_T2CCU_CC1L	=	0x00c2
_SCR_T2CCU_CC2L	=	0x00c3
_SCR_T2CCU_CC0H	=	0x00c4
_SCR_T2CCU_CC1H	=	0x00c5
_SCR_T2CCU_CC2H	=	0x00c6
_SCR_MODPISEL0	=	0x00f2
_SCR_MODPISEL1	=	0x00f3
_SCR_MODPISEL2	=	0x00f4
_SCR_MODPISEL3	=	0x00f5
_SCR_MODPISEL4	=	0x00f6
_SCR_MODPISEL5	=	0x00f7
_SCR_SCR_HWCFG	=	0x00f8
_SCR_DBG_MODSUSP	=	0x00f9
_SCR_WCAN_DATA0_CTRL	=	0x00b0
_SCR_T2CCU_COCON	=	0x00c0
_SCR_T2CCU_CC3L	=	0x00c1
_SCR_T2CCU_CC4L	=	0x00c2
_SCR_T2CCU_CC5L	=	0x00c3
_SCR_T2CCU_CC3H	=	0x00c4
_SCR_T2CCU_CC4H	=	0x00c5
_SCR_T2CCU_CC5H	=	0x00c6
_SCR_T2CCU_CCTDTCL	=	0x00c2
_SCR_T2CCU_CCTDTCH	=	0x00c3
_SCR_ADCOMP_RES	=	0x00fa
_SCR_ADCOMP_CON	=	0x00fb
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.section .xdata.i51,"aw" ;xdata_name ;area
_retunr_value:
	.ds.b	2
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.section .xdata.init,"aw" ;xidata_name ;area
_FellingEdge:
	.ds.b	2
_RissingEdge:
	.ds.b	2
_CaptureFlag:
	.ds.b	2
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.globl _EXINT2IS_interrupt 
	.section .isr08, "ax"
	ljmp	_EXINT2IS_interrupt
	.globl _EXINT5IS_interrupt 
	.section .isr09, "ax"
	ljmp	_EXINT5IS_interrupt
	.globl _rtc_interrupt 
	.section .isr13, "ax"
	ljmp	_rtc_interrupt
;--------------------------------------------------------
; code
;--------------------------------------------------------
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	../SCR/main.c:42: void main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
	.section .text.code.main,"ax" ;code for function main
	.type   main, @function
_main:
	.using 0
;	../SCR/main.c:47: SCR_SCU_PAGE = 1;       //Switch to page 1
	mov	_SCR_SCU_PAGE,#0x01
;	../SCR/main.c:48: SCR_SCU_PMCON1 = 0x59;  //OCDS, T2CCU0, RTC and WCAN enabled
	mov	_SCR_SCU_PMCON1,#0x59
;	../SCR/main.c:50: SCR_SCU_PAGE = 0;       //Switch to page 0
	mov	_SCR_SCU_PAGE,#0x00
;	../SCR/main.c:51: SCR_SCRINTEXCHG = 0xA0;
	mov	_SCR_SCRINTEXCHG,#0xA0
;	../SCR/main.c:52: SCR_SCU_PAGE = 1;       //Switch to page 0
	mov	_SCR_SCU_PAGE,#0x01
;	../SCR/main.c:54: SCR_IEN0 |= (1 << 7) ; // enable global interrupt Set bit 7
	orl	_SCR_IEN0,#0x80
;	../SCR/main.c:55: SCR_IEN1 |= (1 << 7) ; // enable node 13 interrupt
	orl	_SCR_IEN1,#0x80
;	../SCR/main.c:59: gpio_init();
	lcall	_gpio_init
;	../SCR/main.c:64: while(1){
.00104:
;	../SCR/main.c:66: SCR_P00_OUT |= (1 << 5) ; // Set bit 5
	orl	_SCR_P00_OUT,#0x20
;	../SCR/main.c:67: delay();
	lcall	_delay
;	../SCR/main.c:68: SCR_P00_OUT &= ~(1 << 5) ; // Clear bit 5
	anl	_SCR_P00_OUT,#0xDF
;	../SCR/main.c:69: delay();
	lcall	_delay
;	../SCR/main.c:70: retunr_value = IsStandbyMode();
	lcall	_IsStandbyMode
	mov	r7,dpl
	mov	dptr,#_retunr_value
	mov	a,r7
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../SCR/main.c:71: if(retunr_value == 1){
	mov	dptr,#_retunr_value
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	cjne	r6,#0x01,.00116
	cjne	r7,#0x00,.00116
	sjmp	.00117
.00116:
	sjmp	.00104
.00117:
;	../SCR/main.c:72: SCR_P00_OUT |= (1 << 4) ; // Set bit 5
	orl	_SCR_P00_OUT,#0x10
	sjmp	.00104
.00106:
;	../SCR/main.c:79: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;i                         Allocated with name '_delay_i_65536_20'
;j                         Allocated with name '_delay_j_65536_20'
;------------------------------------------------------------
;	../SCR/main.c:83: void delay(void){
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
	.section .text.code.delay,"ax" ;code for function delay
	.type   delay, @function
_delay:
	.using 0
;	../SCR/main.c:87: for( i = 0; i < 1000; i++){
	mov	r6,#0x00
	mov	r7,#0x00
;	../SCR/main.c:88: for(j = 0; j< 1000; j++){
.00127:
	mov	r4,#0xE8
	mov	r5,#0x03
.00122:
	dec	r4
	cjne	r4,#0xFF,.00141
	dec	r5
.00141:
	mov	a,r4
	orl	a,r5
	jnz	.00122
.00142:
;	../SCR/main.c:87: for( i = 0; i < 1000; i++){
	inc	r6
	cjne	r6,#0x00,.00143
	inc	r7
.00143:
	clr	c
	mov	a,r6
	subb	a,#0xE8
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x83
	jc	.00127
.00144:
.00125:
;	../SCR/main.c:93: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rtc_interrupt'
;------------------------------------------------------------
;	../SCR/main.c:104: void rtc_interrupt(void) __interrupt (13){
;	-----------------------------------------
;	 function rtc_interrupt
;	-----------------------------------------
	.section .text.code.rtc_interrupt,"ax" ;code for function rtc_interrupt
	.type   rtc_interrupt, @function
_rtc_interrupt:
	.using 0
;	../SCR/main.c:107: SCR_RTC_CON &= ~(1 << 6) ;// clear rtc Interrupt flag
	anl	_SCR_RTC_CON,#0xBF
.00145:
;	../SCR/main.c:109: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'EXINT2IS_interrupt'
;------------------------------------------------------------
;	../SCR/main.c:115: void EXINT2IS_interrupt(void) __interrupt (8){
;	-----------------------------------------
;	 function EXINT2IS_interrupt
;	-----------------------------------------
	.section .text.code.EXINT2IS_interrupt,"ax" ;code for function EXINT2IS_interrupt
	.type   EXINT2IS_interrupt, @function
_EXINT2IS_interrupt:
	.using 0
;	../SCR/main.c:126: SCR_SCU_PAGE = 0;
	mov	_SCR_SCU_PAGE,#0x00
;	../SCR/main.c:127: SCR_IRCON2 &= ~(1 << 0) ; // Clear Bit 2
	anl	_SCR_IRCON2,#0xFE
;	../SCR/main.c:128: SCR_SCU_PAGE = 1;
	mov	_SCR_SCU_PAGE,#0x01
.00147:
;	../SCR/main.c:130: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'EXINT5IS_interrupt'
;------------------------------------------------------------
;	../SCR/main.c:135: void EXINT5IS_interrupt(void) __interrupt (9){
;	-----------------------------------------
;	 function EXINT5IS_interrupt
;	-----------------------------------------
	.section .text.code.EXINT5IS_interrupt,"ax" ;code for function EXINT5IS_interrupt
	.type   EXINT5IS_interrupt, @function
_EXINT5IS_interrupt:
	.using 0
;	../SCR/main.c:155: SCR_SCU_PAGE = 0;
	mov	_SCR_SCU_PAGE,#0x00
;	../SCR/main.c:156: SCR_IRCON2 &= ~(1 << 1) ; // Clear Bit 2
	anl	_SCR_IRCON2,#0xFD
;	../SCR/main.c:157: SCR_SCU_PAGE = 1;
	mov	_SCR_SCU_PAGE,#0x01
.00149:
;	../SCR/main.c:159: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;--------------------------------------------------------
; xinit 
;--------------------------------------------------------
	.section .roxdata.init,"ax";xinit_name ;area
__xinit__FellingEdge:
	.byte #0x00, #0x00	; 0
__xinit__RissingEdge:
	.byte #0x00, #0x00	; 0
__xinit__CaptureFlag:
	.byte #0x00, #0x00	; 0
