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
static const char *ng0 = "C:/Users/Chris/Documents/CompE 475/Homework 2/MicroprocessorComponents/Controller.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {2U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {6U, 0U};
static unsigned int ng5[] = {36U, 0U};
static unsigned int ng6[] = {37U, 0U};
static unsigned int ng7[] = {32U, 0U};
static unsigned int ng8[] = {34U, 0U};
static unsigned int ng9[] = {42U, 0U};
static unsigned int ng10[] = {7U, 0U};



static void Always_140_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    int t9;

LAB0:    t1 = (t0 + 4840U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(140, ng0);
    t2 = (t0 + 5160);
    *((int *)t2) = 1;
    t3 = (t0 + 4872);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(140, ng0);

LAB5:    xsi_set_current_line(141, ng0);
    t4 = (t0 + 3360U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t4, 2);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB11;

LAB12:
LAB14:
LAB13:    xsi_set_current_line(152, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);

LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(142, ng0);
    t7 = ((char*)((ng2)));
    t8 = (t0 + 3920);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 3, 0LL);
    goto LAB15;

LAB9:    xsi_set_current_line(143, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 3920);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 3, 0LL);
    goto LAB15;

LAB11:    xsi_set_current_line(144, ng0);
    t3 = (t0 + 3520U);
    t4 = *((char **)t3);

LAB16:    t3 = ((char*)((ng5)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 6, t3, 6);
    if (t9 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB25;

LAB26:
LAB28:
LAB27:    xsi_set_current_line(150, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);

LAB29:    goto LAB15;

LAB17:    xsi_set_current_line(145, ng0);
    t7 = ((char*)((ng1)));
    t8 = (t0 + 3920);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 3, 0LL);
    goto LAB29;

LAB19:    xsi_set_current_line(146, ng0);
    t3 = ((char*)((ng3)));
    t7 = (t0 + 3920);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 3, 0LL);
    goto LAB29;

LAB21:    xsi_set_current_line(147, ng0);
    t3 = ((char*)((ng2)));
    t7 = (t0 + 3920);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 3, 0LL);
    goto LAB29;

LAB23:    xsi_set_current_line(148, ng0);
    t3 = ((char*)((ng4)));
    t7 = (t0 + 3920);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 3, 0LL);
    goto LAB29;

LAB25:    xsi_set_current_line(149, ng0);
    t3 = ((char*)((ng10)));
    t7 = (t0 + 3920);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 3, 0LL);
    goto LAB29;

}


extern void work_m_00000000002332847385_2115691294_init()
{
	static char *pe[] = {(void *)Always_140_0};
	xsi_register_didat("work_m_00000000002332847385_2115691294", "isim/tb_SingleCycleProcessor2_isim_beh.exe.sim/work/m_00000000002332847385_2115691294.didat");
	xsi_register_executes(pe);
}
