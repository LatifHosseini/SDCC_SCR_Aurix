/**********************************************************************************************************************
 * \file Cpu0_Main.c
 * \copyright Copyright (C) Infineon Technologies AG 2019
 * 
 * Use of this file is subject to the terms of use agreed between (i) you or the company in which ordinary course of 
 * business you are acting and (ii) Infineon Technologies AG or its licensees. If and as long as no such terms of use
 * are agreed, use of this file is subject to following:
 * 
 * Boost Software License - Version 1.0 - August 17th, 2003
 * 
 * Permission is hereby granted, free of charge, to any person or organization obtaining a copy of the software and 
 * accompanying documentation covered by this license (the "Software") to use, reproduce, display, distribute, execute,
 * and transmit the Software, and to prepare derivative works of the Software, and to permit third-parties to whom the
 * Software is furnished to do so, all subject to the following:
 * 
 * The copyright notices in the Software and this entire statement, including the above license grant, this restriction
 * and the following disclaimer, must be included in all copies of the Software, in whole or in part, and all 
 * derivative works of the Software, unless such copies or derivative works are solely in the form of 
 * machine-executable object code generated by a source language processor.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE 
 * COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN 
 * CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
 * IN THE SOFTWARE.
 *********************************************************************************************************************/
#include "PMS_Power_Down_Standby.h"
#include "IfxPms_reg.h"
#include "Ifx_Types.h"
#include "IfxCpu.h"
#include "IfxScuWdt.h"
#include "SCR.h"

volatile unsigned int var_1 = 1;
volatile unsigned int var_2 = 2;

IFX_ALIGN(4) IfxCpu_syncEvent g_cpuSyncEvent = 0;

void core0_main(void)
{
    IfxCpu_enableInterrupts();
    

    /* !!WATCHDOG0 AND SAFETY WATCHDOG ARE DISABLED HERE!!
     * Enable the watchdogs and service them periodically if it is required
     */
    IfxScuWdt_disableCpuWatchdog(IfxScuWdt_getCpuWatchdogPassword());
    IfxScuWdt_disableSafetyWatchdog(IfxScuWdt_getSafetyWatchdogPassword());
    
    /* Wait for CPU sync event */
    IfxCpu_emitEvent(&g_cpuSyncEvent);
    IfxCpu_waitEvent(&g_cpuSyncEvent, 1);
    
    IfxScuWdt_clearSafetyEndinit(IfxScuWdt_getCpuWatchdogPassword());

    //boot_mode=0 - XRAM not programmed
    IfxScr_init(0);
    IfxScuWdt_setSafetyEndinit(IfxScuWdt_getCpuWatchdogPassword());

    // Write SCR program to XRAM
    IfxScr_copyProgram();

    IfxScuWdt_clearSafetyEndinit(IfxScuWdt_getCpuWatchdogPassword());

    //boot_mode=1 - XRAM programmed
    IfxScr_init(1);
    IfxScuWdt_setSafetyEndinit(IfxScuWdt_getCpuWatchdogPassword());
    
    IfxScuWdt_clearSafetyEndinit(IfxScuWdt_getCpuWatchdogPassword());
        while (P33_PCSR.B.LCK);
         P33_PCSR.U = 0xFEFF;
        while (P34_PCSR.B.LCK);
        P34_PCSR.U = 0x0002;
        IfxScuWdt_setSafetyEndinit(IfxScuWdt_getCpuWatchdogPassword());

        SCU_PMSWCR1.B.STBYEV = 1;
        /* Configure the LEDs and put the system into Standby after a few seconds */
         //   initLEDs();
         //   runStandby();
        initLED();  /* Initialize the LED port pin      */
    while(1)
    {
        blinkLED(); /* Make the LED blink           */
    }
}
