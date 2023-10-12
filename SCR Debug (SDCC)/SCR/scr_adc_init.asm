;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13448 (MINGW32)
;--------------------------------------------------------
	.file	"scr_adc_init.c"
;	.optsdcc -mmcs51
	; --model-large

	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl	_scr_adc_init
	.globl	_scr_adc_enable_modul
	.globl	_scr_adc_disable_modu
	.globl	_scr_isAdc_enabled
	.globl	_scr_adc_isReadyForNewConversion
	.globl	_scr_adc_selectChannel
	.globl	_scr_adc_selectSampleTime
	.globl	_scr_adc_startConversion
	.globl	_scr_adc_getResult
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
_scr_adc_getResult_result_65536_40:
	.ds.b	2
;--------------------------------------------------------
; code
;--------------------------------------------------------
;------------------------------------------------------------
;Allocation info for local variables in function 'scr_adc_init'
;------------------------------------------------------------
;	../SCR/scr_adc_init.c:53: void scr_adc_init(void){
;	-----------------------------------------
;	 function scr_adc_init
;	-----------------------------------------
	.section .text.code.scr_adc_init,"ax" ;code for function scr_adc_init
	.type   scr_adc_init, @function
_scr_adc_init:
	.using 0
;	../SCR/scr_adc_init.c:59: }
.00101:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'scr_adc_enable_modul'
;------------------------------------------------------------
;	../SCR/scr_adc_init.c:61: void scr_adc_enable_modul(void){
;	-----------------------------------------
;	 function scr_adc_enable_modul
;	-----------------------------------------
	.section .text.code.scr_adc_enable_modul,"ax" ;code for function scr_adc_enable_modul
	.type   scr_adc_enable_modul, @function
_scr_adc_enable_modul:
	.using 0
;	../SCR/scr_adc_init.c:64: }
.00103:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'scr_adc_disable_modu'
;------------------------------------------------------------
;	../SCR/scr_adc_init.c:65: void scr_adc_disable_modu(void){
;	-----------------------------------------
;	 function scr_adc_disable_modu
;	-----------------------------------------
	.section .text.code.scr_adc_disable_modu,"ax" ;code for function scr_adc_disable_modu
	.type   scr_adc_disable_modu, @function
_scr_adc_disable_modu:
	.using 0
;	../SCR/scr_adc_init.c:67: }
.00105:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'scr_isAdc_enabled'
;------------------------------------------------------------
;	../SCR/scr_adc_init.c:69: void scr_isAdc_enabled(void){
;	-----------------------------------------
;	 function scr_isAdc_enabled
;	-----------------------------------------
	.section .text.code.scr_isAdc_enabled,"ax" ;code for function scr_isAdc_enabled
	.type   scr_isAdc_enabled, @function
_scr_isAdc_enabled:
	.using 0
;	../SCR/scr_adc_init.c:71: }
.00107:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'scr_adc_isReadyForNewConversion'
;------------------------------------------------------------
;	../SCR/scr_adc_init.c:73: void scr_adc_isReadyForNewConversion(void){
;	-----------------------------------------
;	 function scr_adc_isReadyForNewConversion
;	-----------------------------------------
	.section .text.code.scr_adc_isReadyForNewConversion,"ax" ;code for function scr_adc_isReadyForNewConversion
	.type   scr_adc_isReadyForNewConversion, @function
_scr_adc_isReadyForNewConversion:
	.using 0
;	../SCR/scr_adc_init.c:76: }
.00109:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'scr_adc_selectChannel'
;------------------------------------------------------------
;	../SCR/scr_adc_init.c:77: void scr_adc_selectChannel(void){
;	-----------------------------------------
;	 function scr_adc_selectChannel
;	-----------------------------------------
	.section .text.code.scr_adc_selectChannel,"ax" ;code for function scr_adc_selectChannel
	.type   scr_adc_selectChannel, @function
_scr_adc_selectChannel:
	.using 0
;	../SCR/scr_adc_init.c:79: }
.00111:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'scr_adc_selectSampleTime'
;------------------------------------------------------------
;	../SCR/scr_adc_init.c:81: void scr_adc_selectSampleTime(void){
;	-----------------------------------------
;	 function scr_adc_selectSampleTime
;	-----------------------------------------
	.section .text.code.scr_adc_selectSampleTime,"ax" ;code for function scr_adc_selectSampleTime
	.type   scr_adc_selectSampleTime, @function
_scr_adc_selectSampleTime:
	.using 0
;	../SCR/scr_adc_init.c:83: }
.00113:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'scr_adc_startConversion'
;------------------------------------------------------------
;	../SCR/scr_adc_init.c:85: void scr_adc_startConversion(void){
;	-----------------------------------------
;	 function scr_adc_startConversion
;	-----------------------------------------
	.section .text.code.scr_adc_startConversion,"ax" ;code for function scr_adc_startConversion
	.type   scr_adc_startConversion, @function
_scr_adc_startConversion:
	.using 0
;	../SCR/scr_adc_init.c:87: }
.00115:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'scr_adc_getResult'
;------------------------------------------------------------
;result                    Allocated with name '_scr_adc_getResult_result_65536_40'
;------------------------------------------------------------
;	../SCR/scr_adc_init.c:89: unsigned int scr_adc_getResult(void){
;	-----------------------------------------
;	 function scr_adc_getResult
;	-----------------------------------------
	.section .text.code.scr_adc_getResult,"ax" ;code for function scr_adc_getResult
	.type   scr_adc_getResult, @function
_scr_adc_getResult:
	.using 0
;	../SCR/scr_adc_init.c:92: return result;
	mov	dptr,#_scr_adc_getResult_result_65536_40
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
;	../SCR/scr_adc_init.c:93: }
	mov	dpl,r6
	mov	dph,a
.00117:
	ret
