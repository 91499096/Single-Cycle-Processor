/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xa0883be4 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif



static void Gate_64_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 6480U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 4200U);
    t3 = *((char **)t2);
    t2 = (t0 + 5160U);
    t4 = *((char **)t2);
    t2 = (t0 + 6880);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    xsi_vlog_AndGate(t8, 2, t3, t4);
    t9 = (t0 + 6880);
    xsi_driver_vfirst_trans(t9, 0, 0);
    t10 = (t0 + 6800);
    *((int *)t10) = 1;

LAB1:    return;
}


extern void work_m_00000000001167371294_3228923301_init()
{
	static char *pe[] = {(void *)Gate_64_0};
	xsi_register_didat("work_m_00000000001167371294_3228923301", "isim/tb_SingleCycleProcessor2_isim_beh.exe.sim/work/m_00000000001167371294_3228923301.didat");
	xsi_register_executes(pe);
}
