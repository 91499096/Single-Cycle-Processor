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
static const char *ng0 = "C:/Users/Chris/Documents/CompE 475/Homework 2/MicroprocessorComponents/ALU.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {0, 0};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {4U, 0U};
static unsigned int ng6[] = {5U, 0U};
static unsigned int ng7[] = {6U, 0U};
static int ng8[] = {1, 0};
static unsigned int ng9[] = {7U, 0U};



static void Always_19_0(char *t0)
{
    char t10[8];
    char t17[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;

LAB0:    t1 = (t0 + 3936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(19, ng0);
    t2 = (t0 + 4256);
    *((int *)t2) = 1;
    t3 = (t0 + 3968);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(19, ng0);

LAB5:    xsi_set_current_line(20, ng0);
    t4 = (t0 + 2456U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB19;

LAB20:
LAB22:
LAB21:    xsi_set_current_line(34, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3016);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);

LAB23:    goto LAB2;

LAB7:    xsi_set_current_line(21, ng0);

LAB24:    xsi_set_current_line(21, ng0);
    t7 = (t0 + 2136U);
    t8 = *((char **)t7);
    t7 = (t0 + 2296U);
    t9 = *((char **)t7);
    memset(t10, 0, 8);
    xsi_vlog_signed_bit_and(t10, 32, t8, 32, t9, 32);
    t7 = (t0 + 3016);
    xsi_vlogvar_wait_assign_value(t7, t10, 0, 0, 32, 0LL);
    xsi_set_current_line(22, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2856);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB23;

LAB9:    xsi_set_current_line(24, ng0);
    t3 = (t0 + 2136U);
    t4 = *((char **)t3);
    t3 = (t0 + 2296U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    xsi_vlog_signed_bit_or(t10, 32, t4, 32, t7, 32);
    t3 = (t0 + 3016);
    xsi_vlogvar_wait_assign_value(t3, t10, 0, 0, 32, 0LL);
    goto LAB23;

LAB11:    xsi_set_current_line(25, ng0);
    t3 = (t0 + 2136U);
    t4 = *((char **)t3);
    t3 = (t0 + 2296U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    xsi_vlog_signed_add(t10, 32, t4, 32, t7, 32);
    t3 = (t0 + 3016);
    xsi_vlogvar_wait_assign_value(t3, t10, 0, 0, 32, 0LL);
    goto LAB23;

LAB13:    xsi_set_current_line(26, ng0);
    t3 = (t0 + 2136U);
    t4 = *((char **)t3);
    t3 = (t0 + 2296U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t10 + 4);
    t8 = (t7 + 4);
    memcpy(t10, t7, 8);
    t11 = *((unsigned int *)t10);
    t12 = (~(t11));
    t13 = *((unsigned int *)t3);
    t14 = (t12 | t13);
    *((unsigned int *)t10) = t14;
    t15 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t15 & 4294967295U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 4294967295U);
    memset(t17, 0, 8);
    xsi_vlog_signed_bit_and(t17, 32, t4, 32, t10, 32);
    t9 = (t0 + 3016);
    xsi_vlogvar_wait_assign_value(t9, t17, 0, 0, 32, 0LL);
    goto LAB23;

LAB15:    xsi_set_current_line(27, ng0);
    t3 = (t0 + 2136U);
    t4 = *((char **)t3);
    t3 = (t0 + 2296U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t10 + 4);
    t8 = (t7 + 4);
    memcpy(t10, t7, 8);
    t11 = *((unsigned int *)t10);
    t12 = (~(t11));
    t13 = *((unsigned int *)t3);
    t14 = (t12 | t13);
    *((unsigned int *)t10) = t14;
    t15 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t15 & 4294967295U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 4294967295U);
    memset(t17, 0, 8);
    xsi_vlog_signed_bit_or(t17, 32, t4, 32, t10, 32);
    t9 = (t0 + 3016);
    xsi_vlogvar_wait_assign_value(t9, t17, 0, 0, 32, 0LL);
    goto LAB23;

LAB17:    xsi_set_current_line(28, ng0);

LAB25:    xsi_set_current_line(28, ng0);
    t3 = (t0 + 2136U);
    t4 = *((char **)t3);
    t3 = (t0 + 2296U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    xsi_vlog_signed_minus(t10, 32, t4, 32, t7, 32);
    t3 = (t10 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (~(t11));
    t13 = *((unsigned int *)t10);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB26;

LAB27:    xsi_set_current_line(29, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 2856);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB28:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 2136U);
    t3 = *((char **)t2);
    t2 = (t0 + 2296U);
    t4 = *((char **)t2);
    memset(t10, 0, 8);
    xsi_vlog_signed_minus(t10, 32, t3, 32, t4, 32);
    t2 = (t0 + 3016);
    xsi_vlogvar_wait_assign_value(t2, t10, 0, 0, 32, 0LL);
    goto LAB23;

LAB19:    xsi_set_current_line(32, ng0);
    t3 = (t0 + 2136U);
    t4 = *((char **)t3);
    t3 = (t0 + 2296U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    xsi_vlog_signed_less(t10, 32, t4, 32, t7, 32);
    t3 = (t10 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (~(t11));
    t13 = *((unsigned int *)t10);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB29;

LAB30:    xsi_set_current_line(33, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3016);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);

LAB31:    goto LAB23;

LAB26:    xsi_set_current_line(28, ng0);
    t8 = ((char*)((ng2)));
    t9 = (t0 + 2856);
    xsi_vlogvar_wait_assign_value(t9, t8, 0, 0, 1, 0LL);
    goto LAB28;

LAB29:    xsi_set_current_line(32, ng0);

LAB32:    xsi_set_current_line(32, ng0);
    t8 = ((char*)((ng8)));
    t9 = (t0 + 3016);
    xsi_vlogvar_wait_assign_value(t9, t8, 0, 0, 32, 0LL);
    xsi_set_current_line(32, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2856);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB31;

}


extern void work_m_00000000001353734416_3523041770_init()
{
	static char *pe[] = {(void *)Always_19_0};
	xsi_register_didat("work_m_00000000001353734416_3523041770", "isim/tb_SingleCycleProcessor2_isim_beh.exe.sim/work/m_00000000001353734416_3523041770.didat");
	xsi_register_executes(pe);
}
