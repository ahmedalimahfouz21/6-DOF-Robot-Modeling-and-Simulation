function [q_n] = inverse_position_kinematics(max_iterations,q_0,l,J,X,X_EE)
syms q q1 q2 q3 q4 q5 l1 l2 l3 l4 l5 X_num X_exp
q=[q1 q2 q3 q4 q5 l1 l2 l3 l4 l5];
q_n=q_0;
 for i=1:max_iterations
X_exp=X;
X_num=X;
q_num=[q_n' l];
for j=1:3 
    X_exp(j)=subs(X_exp(j),q,q_num);
    X_num(j)=X_exp(j);
end
double(X_num);
J_inv=inverse_jacobian_matrix(J,[q_n' l]);
q_n=q_n-J_inv*(X_num-X_EE);
double(q_n);
end
end

