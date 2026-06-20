function L =Lagrange()
syms q1 q2 q3 q4 q5
syms m1 m2 m3 m4 m5
syms q1_dot q2_dot q3_dot q4_dot q5_dot
syms Ix1 Ixy1 Ixz1 Iyx1 Iy1 Iyz1 Izx1 Izy1 Iz1 Ix2 Ixy2 Ixz2 Iyx2 Iy2 Iyz2 Izx2 Izy2 Iz2 ...
     Ix3 Ixy3 Ixz3 Iyx3 Iy3 Iyz3 Izx3 Izy3 Iz3 Ix4 Ixy4 Ixz4 Iyx4 Iy4 Iyz4 Izx4 Izy4 Iz4 ...
     Ix5 Ixy5 Ixz5 Iyx5 Iy5 Iyz5 Izx5 Izy5 Iz5
q=[q1 q2 q3 q4 q5]; 
qdot=[q1_dot q2_dot q3_dot q4_dot q5_dot];
m=[m1,m2,m3,m4,m5];
I=[Ix1 Ixy1 Ixz1 ;Iyx1 Iy1 Iyz1; Izx1 Izy1 Iz1; Ix2 Ixy2 Ixz2 ;Iyx2 Iy2 Iyz2 ;Izx2 Izy2 Iz2;...
   Ix3 Ixy3 Ixz3 ;Iyx3 Iy3 Iyz3 ;Izx3 Izy3 Iz3; Ix4 Ixy4 Ixz4 ;Iyx4 Iy4 Iyz4; Izx4 Izy4 Iz4;...
   Ix5 Ixy5 Ixz5 ;Iyx5 Iy5 Iyz5; Izx5 Izy5 Iz5];
% m = [1 1 1 1 1];
% I = [1 0 0;0 1 0; 0 0 1; ...
%      1 0 0; 0 1 0 ;0 0 1 ;1 0 0; 0 1 0; 0 0 1; 1 0 0; 0 1 0; 0 0 1; 1 0 0; 0 1 0; 0 0 1];
U=potential_energy(q,m);
T=kinemtic_energy(q,qdot,m,I);
L=sum(T)-sum(U);
end

