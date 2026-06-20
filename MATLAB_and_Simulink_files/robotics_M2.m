clc;
clear all;
syms q1 q2 q3 q4 q5  l1 l2 l3 l4 l5 q1_dot q2_dot q3_dot q4_dot q5_dot ...
    q1_double_dot q2_double_dot q3_double_dot q4_double_dot q5_double_dot...
    x y z ceta_x ceta_y ceta_z x_dot y_dot z_dot wx wy wz x_double_dot y_double_dot z_double_dot alpha_x alpha_y alpha_z;
q=[q1 q2 q3 q4 q5]'; 
q_dot=[q1_dot q2_dot q3_dot q4_dot q5_dot]'; 
l=[l1 l2 l3 l4 l5];
q_double_dot=[q1_double_dot q2_double_dot q3_double_dot q4_double_dot q5_double_dot]';
X=[x y z ceta_x ceta_y ceta_z]';
X_dot=[x_dot y_dot z_dot wx wy wz]';
X_double_dot=[x_double_dot y_double_dot z_double_dot alpha_x alpha_y alpha_z]';
T0_1=transformation_func(q(1),l(1),0,270);
T1_2=transformation_func(q(2),0,l(2),0);
T2_3=transformation_func(q(3),0,l(3),0);
T3_4=transformation_func(q(4),0,0,90);
T4_5=transformation_func(q(5),l(4)+l(5),0,0);
%Total transformation matrix
T0_5=T0_1*T1_2*T2_3*T3_4*T4_5;
end_effector_pos=end_effector_position(T0_5);
J=dFi_dqi(end_effector_pos);
%J_inv=inverse_jacobian_matrix(J,[30 30 30 30 30 0 2 2 0 0])
X_desired=[0;0;4];
l=[0 2 2 0 0];
q_0=[0; -50; -30; 0; 0];
 tic
q_n=q_0;
for i=1:1
q_n=inverse_position_kinematics(q_n,l,J,end_effector_pos,X_desired);
end
 toc
 forward_velocity_kinematics(q,q_dot)
forward_acceleration_kinematics(q, q_dot, q_double_dot)
inverse_velocity_kinematics(q,[0 -90 0 0 0],X_dot)
inverse_acceleration_kinematics(q,[0 -90 0 0 0] ,[1 2 -1 2 -1]',X_double_dot)