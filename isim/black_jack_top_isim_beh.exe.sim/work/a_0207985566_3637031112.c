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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/daiane/black-jack/loader.vhd";



static void work_a_0207985566_3637031112_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    int t17;
    int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 752U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 2384);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(37, ng0);
    t4 = (t0 + 868U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 1236U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)2);
    if (t3 != 0)
        goto LAB18;

LAB20:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 684U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t6 = (t3 == (unsigned char)3);
    if (t6 == 1)
        goto LAB27;

LAB28:    t1 = (unsigned char)0;

LAB29:    if (t1 != 0)
        goto LAB24;

LAB26:
LAB25:
LAB19:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 776U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(39, ng0);
    t4 = (t0 + 2428);
    t11 = (t4 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(40, ng0);
    t2 = (t0 + 4584);
    t5 = (t0 + 2464);
    t8 = (t5 + 32U);
    t11 = *((char **)t8);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 4U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(41, ng0);
    t2 = (t0 + 2500);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t8 = (t5 + 32U);
    t11 = *((char **)t8);
    *((int *)t11) = 0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(44, ng0);
    t2 = (t0 + 4588);
    *((int *)t2) = 0;
    t4 = (t0 + 4592);
    *((int *)t4) = 51;
    t15 = 0;
    t16 = 51;

LAB11:    if (t15 <= t16)
        goto LAB12;

LAB14:    goto LAB9;

LAB12:    xsi_set_current_line(45, ng0);
    t5 = (t0 + 4596);
    t1 = (4U != 4U);
    if (t1 == 1)
        goto LAB15;

LAB16:    t11 = (t0 + 4588);
    t17 = *((int *)t11);
    t18 = (t17 - 51);
    t19 = (t18 * -1);
    t20 = (4U * t19);
    t21 = (0U + t20);
    t12 = (t0 + 2536);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    t22 = (t14 + 32U);
    t23 = *((char **)t22);
    memcpy(t23, t5, 4U);
    xsi_driver_first_trans_delta(t12, t21, 4U, 0LL);

LAB13:    t2 = (t0 + 4588);
    t15 = *((int *)t2);
    t4 = (t0 + 4592);
    t16 = *((int *)t4);
    if (t15 == t16)
        goto LAB14;

LAB17:    t17 = (t15 + 1);
    t15 = t17;
    t5 = (t0 + 4588);
    *((int *)t5) = t15;
    goto LAB11;

LAB15:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB16;

LAB18:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1420U);
    t5 = *((char **)t2);
    t15 = *((int *)t5);
    t2 = (t0 + 1592U);
    t8 = *((char **)t2);
    t16 = *((int *)t8);
    t6 = (t15 == t16);
    if (t6 != 0)
        goto LAB21;

LAB23:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 592U);
    t4 = *((char **)t2);
    t2 = (t0 + 1420U);
    t5 = *((char **)t2);
    t15 = *((int *)t5);
    t16 = (t15 - 51);
    t19 = (t16 * -1);
    t20 = (4U * t19);
    t21 = (0U + t20);
    t2 = (t0 + 2536);
    t8 = (t2 + 32U);
    t11 = *((char **)t8);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 4U);
    xsi_driver_first_trans_delta(t2, t21, 4U, 0LL);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 1420U);
    t4 = *((char **)t2);
    t15 = *((int *)t4);
    t16 = (t15 + 1);
    t2 = (t0 + 2500);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t11 = (t8 + 32U);
    t12 = *((char **)t11);
    *((int *)t12) = t16;
    xsi_driver_first_trans_fast(t2);

LAB22:    goto LAB19;

LAB21:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 2428);
    t11 = (t2 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 2500);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t8 = (t5 + 32U);
    t11 = *((char **)t8);
    *((int *)t11) = 0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 1328U);
    t4 = *((char **)t2);
    t2 = (t0 + 1420U);
    t5 = *((char **)t2);
    t15 = *((int *)t5);
    t16 = (t15 - 1);
    t17 = (t16 - 51);
    t19 = (t17 * -1);
    xsi_vhdl_check_range_of_index(51, 0, -1, t16);
    t20 = (4U * t19);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t8 = (t0 + 2464);
    t11 = (t8 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    memcpy(t14, t2, 4U);
    xsi_driver_first_trans_fast(t8);
    goto LAB22;

LAB24:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1420U);
    t11 = *((char **)t2);
    t17 = *((int *)t11);
    t18 = (t17 + 1);
    t2 = (t0 + 2500);
    t12 = (t2 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 32U);
    t22 = *((char **)t14);
    *((int *)t22) = t18;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1328U);
    t4 = *((char **)t2);
    t2 = (t0 + 1420U);
    t5 = *((char **)t2);
    t15 = *((int *)t5);
    t16 = (t15 - 51);
    t19 = (t16 * -1);
    xsi_vhdl_check_range_of_index(51, 0, -1, t15);
    t20 = (4U * t19);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t8 = (t0 + 2464);
    t11 = (t8 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    memcpy(t14, t2, 4U);
    xsi_driver_first_trans_fast(t8);
    goto LAB25;

LAB27:    t2 = (t0 + 1420U);
    t5 = *((char **)t2);
    t15 = *((int *)t5);
    t2 = (t0 + 1592U);
    t8 = *((char **)t2);
    t16 = *((int *)t8);
    t7 = (t15 < t16);
    t1 = t7;
    goto LAB29;

}


extern void work_a_0207985566_3637031112_init()
{
	static char *pe[] = {(void *)work_a_0207985566_3637031112_p_0};
	xsi_register_didat("work_a_0207985566_3637031112", "isim/black_jack_top_isim_beh.exe.sim/work/a_0207985566_3637031112.didat");
	xsi_register_executes(pe);
}
