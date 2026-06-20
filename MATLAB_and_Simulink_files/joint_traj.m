function [q_t,X]= joint_traj(q0, qf, qdot0, qdotf, tf) 
clc
close all
syms Q_T t c0 c1 c2 c3 q1 q2 q3 q4 q5  l1 l2 l3 l4 l5
l=[0 2 2 0 0];
q_t=zeros(5,10*tf);
X=zeros(3,10*tf);
tk=0:0.1:tf;
for k=1:10*tf+1
for i=1:5
c0=q0(i);
c1=qdot0(i);
eqns=[c0+c1*tf+c2*tf^2+c3*tf^3==qf(i), c1+2*tf*c2+3*tf^2*c3==qdotf(i)];
vars=[c2 c3];
[C2,C3]=solve(eqns,vars);
Q_T(i,1)=vpa(c0)+vpa(c1)*t+vpa(C2)*t^2+vpa(C3)*t^3;
end
q_t(:,k)=subs(Q_T,t,tk(k));
q=q_t(:,k);
%Part 2_C
T0_1=transformation_func(q(1),l(1),0,270);
T1_2=transformation_func(q(2),0,l(2),0);
T2_3=transformation_func(q(3),0,l(3),0);
T3_4=transformation_func(q(4),0,0,90);
T4_5=transformation_func(q(5),l(4)+l(5),0,0);
%Total transformation matrix
T0_5=T0_1*T1_2*T2_3*T3_4*T4_5;
X(:,k)=end_effector_position(T0_5);
end
% for i=1:5
%  plot(tk,q_t(i,:))
%  xlabel('t')
%  ylabel('q(t)')
%  hold on
%  grid on
% end
plot3(X(1,:),X(2,:),X(3,:))
xlabel('X-axis')
ylabel('Y-axis')
zlabel('Z-axis')
grid on