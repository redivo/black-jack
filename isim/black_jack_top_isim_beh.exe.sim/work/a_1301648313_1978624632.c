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
static const char *ng0 = "/home/daiane/black-jack/bin_to_bcd.vhd";
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_1742983514_3965413181(char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_1301648313_1978624632_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(26, ng0);

LAB3:    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 2264);
    t3 = (t1 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 5U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t7 = (t0 + 2196);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1301648313_1978624632_p_1(char *t0)
{
    char t5[16];
    char t21[16];
    char t36[16];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t22;
    char *t23;
    int t24;
    unsigned char t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t37;
    char *t38;
    int t39;
    unsigned char t40;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;

LAB0:    xsi_set_current_line(28, ng0);
    t1 = (t0 + 868U);
    t2 = *((char **)t1);
    t1 = (t0 + 3736U);
    t3 = (t0 + 3791);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 4;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (4 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_p_3620187407_sub_1742983514_3965413181(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB3;

LAB4:    t17 = (t0 + 868U);
    t18 = *((char **)t17);
    t17 = (t0 + 3736U);
    t19 = (t0 + 3800);
    t22 = (t21 + 0U);
    t23 = (t22 + 0U);
    *((int *)t23) = 0;
    t23 = (t22 + 4U);
    *((int *)t23) = 4;
    t23 = (t22 + 8U);
    *((int *)t23) = 1;
    t24 = (4 - 0);
    t9 = (t24 * 1);
    t9 = (t9 + 1);
    t23 = (t22 + 12U);
    *((unsigned int *)t23) = t9;
    t25 = ieee_p_3620187407_sub_1742983514_3965413181(IEEE_P_3620187407, t18, t17, t19, t21);
    if (t25 != 0)
        goto LAB5;

LAB6:    t32 = (t0 + 868U);
    t33 = *((char **)t32);
    t32 = (t0 + 3736U);
    t34 = (t0 + 3809);
    t37 = (t36 + 0U);
    t38 = (t37 + 0U);
    *((int *)t38) = 0;
    t38 = (t37 + 4U);
    *((int *)t38) = 4;
    t38 = (t37 + 8U);
    *((int *)t38) = 1;
    t39 = (4 - 0);
    t9 = (t39 * 1);
    t9 = (t9 + 1);
    t38 = (t37 + 12U);
    *((unsigned int *)t38) = t9;
    t40 = ieee_p_3620187407_sub_1742983514_3965413181(IEEE_P_3620187407, t33, t32, t34, t36);
    if (t40 != 0)
        goto LAB7;

LAB8:
LAB9:    t47 = (t0 + 3818);
    t49 = (t0 + 2300);
    t50 = (t49 + 32U);
    t51 = *((char **)t50);
    t52 = (t51 + 32U);
    t53 = *((char **)t52);
    memcpy(t53, t47, 4U);
    xsi_driver_first_trans_fast_port(t49);

LAB2:    t54 = (t0 + 2204);
    *((int *)t54) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 3796);
    t12 = (t0 + 2300);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 4U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB2;

LAB5:    t23 = (t0 + 3805);
    t27 = (t0 + 2300);
    t28 = (t27 + 32U);
    t29 = *((char **)t28);
    t30 = (t29 + 32U);
    t31 = *((char **)t30);
    memcpy(t31, t23, 4U);
    xsi_driver_first_trans_fast_port(t27);
    goto LAB2;

LAB7:    t38 = (t0 + 3814);
    t42 = (t0 + 2300);
    t43 = (t42 + 32U);
    t44 = *((char **)t43);
    t45 = (t44 + 32U);
    t46 = *((char **)t45);
    memcpy(t46, t38, 4U);
    xsi_driver_first_trans_fast_port(t42);
    goto LAB2;

LAB10:    goto LAB2;

}

static void work_a_1301648313_1978624632_p_2(char *t0)
{
    char t5[16];
    char t20[16];
    char t25[16];
    char t29[16];
    char t45[16];
    char t51[16];
    char t55[16];
    char t67[16];
    char t72[16];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t21;
    char *t22;
    int t23;
    unsigned char t24;
    char *t26;
    char *t27;
    char *t30;
    char *t31;
    int t32;
    char *t33;
    unsigned int t34;
    unsigned char t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t46;
    char *t47;
    int t48;
    unsigned int t49;
    unsigned char t50;
    char *t52;
    char *t53;
    char *t56;
    char *t57;
    int t58;
    char *t59;
    unsigned int t60;
    unsigned char t61;
    char *t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;
    char *t68;
    char *t69;
    char *t70;
    char *t73;
    char *t74;
    int t75;
    unsigned int t76;
    char *t77;
    unsigned int t78;
    unsigned char t79;
    char *t80;
    char *t81;
    char *t82;
    char *t83;
    char *t84;
    char *t85;

LAB0:    xsi_set_current_line(33, ng0);
    t1 = (t0 + 868U);
    t2 = *((char **)t1);
    t1 = (t0 + 3736U);
    t3 = (t0 + 3822);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 4;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (4 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_p_3620187407_sub_1742983514_3965413181(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB3;

LAB4:    t16 = (t0 + 868U);
    t17 = *((char **)t16);
    t16 = (t0 + 3736U);
    t18 = (t0 + 3827);
    t21 = (t20 + 0U);
    t22 = (t21 + 0U);
    *((int *)t22) = 0;
    t22 = (t21 + 4U);
    *((int *)t22) = 4;
    t22 = (t21 + 8U);
    *((int *)t22) = 1;
    t23 = (4 - 0);
    t9 = (t23 * 1);
    t9 = (t9 + 1);
    t22 = (t21 + 12U);
    *((unsigned int *)t22) = t9;
    t24 = ieee_p_3620187407_sub_1742983514_3965413181(IEEE_P_3620187407, t17, t16, t18, t20);
    if (t24 != 0)
        goto LAB5;

LAB6:    t41 = (t0 + 868U);
    t42 = *((char **)t41);
    t41 = (t0 + 3736U);
    t43 = (t0 + 3837);
    t46 = (t45 + 0U);
    t47 = (t46 + 0U);
    *((int *)t47) = 0;
    t47 = (t46 + 4U);
    *((int *)t47) = 4;
    t47 = (t46 + 8U);
    *((int *)t47) = 1;
    t48 = (4 - 0);
    t49 = (t48 * 1);
    t49 = (t49 + 1);
    t47 = (t46 + 12U);
    *((unsigned int *)t47) = t49;
    t50 = ieee_p_3620187407_sub_1742983514_3965413181(IEEE_P_3620187407, t42, t41, t43, t45);
    if (t50 != 0)
        goto LAB9;

LAB10:
LAB13:    t68 = (t0 + 868U);
    t69 = *((char **)t68);
    t68 = (t0 + 3736U);
    t70 = (t0 + 3847);
    t73 = (t72 + 0U);
    t74 = (t73 + 0U);
    *((int *)t74) = 0;
    t74 = (t73 + 4U);
    *((int *)t74) = 4;
    t74 = (t73 + 8U);
    *((int *)t74) = 1;
    t75 = (4 - 0);
    t76 = (t75 * 1);
    t76 = (t76 + 1);
    t74 = (t73 + 12U);
    *((unsigned int *)t74) = t76;
    t74 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t67, t69, t68, t70, t72);
    t77 = (t67 + 12U);
    t76 = *((unsigned int *)t77);
    t78 = (1U * t76);
    t79 = (5U != t78);
    if (t79 == 1)
        goto LAB15;

LAB16:    t80 = (t0 + 2336);
    t81 = (t80 + 32U);
    t82 = *((char **)t81);
    t83 = (t82 + 32U);
    t84 = *((char **)t83);
    memcpy(t84, t74, 5U);
    xsi_driver_first_trans_fast(t80);

LAB2:    t85 = (t0 + 2212);
    *((int *)t85) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 868U);
    t11 = *((char **)t7);
    t7 = (t0 + 2336);
    t12 = (t7 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 32U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 5U);
    xsi_driver_first_trans_fast(t7);
    goto LAB2;

LAB5:    t22 = (t0 + 868U);
    t26 = *((char **)t22);
    t22 = (t0 + 3736U);
    t27 = (t0 + 3832);
    t30 = (t29 + 0U);
    t31 = (t30 + 0U);
    *((int *)t31) = 0;
    t31 = (t30 + 4U);
    *((int *)t31) = 4;
    t31 = (t30 + 8U);
    *((int *)t31) = 1;
    t32 = (4 - 0);
    t9 = (t32 * 1);
    t9 = (t9 + 1);
    t31 = (t30 + 12U);
    *((unsigned int *)t31) = t9;
    t31 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t25, t26, t22, t27, t29);
    t33 = (t25 + 12U);
    t9 = *((unsigned int *)t33);
    t34 = (1U * t9);
    t35 = (5U != t34);
    if (t35 == 1)
        goto LAB7;

LAB8:    t36 = (t0 + 2336);
    t37 = (t36 + 32U);
    t38 = *((char **)t37);
    t39 = (t38 + 32U);
    t40 = *((char **)t39);
    memcpy(t40, t31, 5U);
    xsi_driver_first_trans_fast(t36);
    goto LAB2;

LAB7:    xsi_size_not_matching(5U, t34, 0);
    goto LAB8;

LAB9:    t47 = (t0 + 868U);
    t52 = *((char **)t47);
    t47 = (t0 + 3736U);
    t53 = (t0 + 3842);
    t56 = (t55 + 0U);
    t57 = (t56 + 0U);
    *((int *)t57) = 0;
    t57 = (t56 + 4U);
    *((int *)t57) = 4;
    t57 = (t56 + 8U);
    *((int *)t57) = 1;
    t58 = (4 - 0);
    t49 = (t58 * 1);
    t49 = (t49 + 1);
    t57 = (t56 + 12U);
    *((unsigned int *)t57) = t49;
    t57 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t51, t52, t47, t53, t55);
    t59 = (t51 + 12U);
    t49 = *((unsigned int *)t59);
    t60 = (1U * t49);
    t61 = (5U != t60);
    if (t61 == 1)
        goto LAB11;

LAB12:    t62 = (t0 + 2336);
    t63 = (t62 + 32U);
    t64 = *((char **)t63);
    t65 = (t64 + 32U);
    t66 = *((char **)t65);
    memcpy(t66, t57, 5U);
    xsi_driver_first_trans_fast(t62);
    goto LAB2;

LAB11:    xsi_size_not_matching(5U, t60, 0);
    goto LAB12;

LAB14:    goto LAB2;

LAB15:    xsi_size_not_matching(5U, t78, 0);
    goto LAB16;

}

static void work_a_1301648313_1978624632_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(38, ng0);

LAB3:    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t3 = (4 - 3);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 2372);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 4U);
    xsi_driver_first_trans_fast_port(t6);

LAB2:    t11 = (t0 + 2220);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1301648313_1978624632_init()
{
	static char *pe[] = {(void *)work_a_1301648313_1978624632_p_0,(void *)work_a_1301648313_1978624632_p_1,(void *)work_a_1301648313_1978624632_p_2,(void *)work_a_1301648313_1978624632_p_3};
	xsi_register_didat("work_a_1301648313_1978624632", "isim/black_jack_top_isim_beh.exe.sim/work/a_1301648313_1978624632.didat");
	xsi_register_executes(pe);
}
