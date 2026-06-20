function  U_i = potential_energy(q, m)
clc
syms  l1 l2 l3 l4 l5 g
l=[l1 l2 l3 l4 l5];
g_bar=[0 0 -g];
%For link 1
T0_1=transformation_func(q(1),.5*l(1),0,270);
P_CM1=T0_1(1:3,4);
U_1=m(1)*g_bar*P_CM1;
%For link 2
T0_1=transformation_func(q(1),l(1),0,270);
T1_2=transformation_func(q(2),0,.5*l(2),0);
T0_2=T0_1*T1_2;
P_CM2=T0_2(1:3,4);
U_2=m(2)*g_bar*P_CM2;
%For link 3
T1_2=transformation_func(q(2),0,l(2),0);
T2_3=transformation_func(q(3),0,.5*l(3),0);
T0_3=T0_1*T1_2*T2_3;
P_CM3=T0_3(1:3,4);
U_3=m(3)*g_bar*P_CM3;
%For link 4
T2_3=transformation_func(q(3),0,l(3),0);
T3_4=transformation_func(q(4),0,.5*l(4),90);
T0_4=T0_1*T1_2*T2_3*T3_4;
P_CM4=T0_4(1:3,4);
U_4=m(4)*g_bar*P_CM4;
%For link 5
T3_4=transformation_func(q(4),0,0,90);
T4_5=transformation_func(q(5),l(4)+.5*l(5),0,0);
T0_5=T0_1*T1_2*T2_3*T3_4*T4_5;
P_CM5=T0_5(1:3,4);
U_5=m(5)*g_bar*P_CM5;
U_i=[U_1; U_2; U_3; U_4; U_5]
end

