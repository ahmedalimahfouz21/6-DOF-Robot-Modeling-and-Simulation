function [J_dot] =jacobian_derivative(q, q_dot)
syms J q1 q2 q3 q4 q5 q1(t) q2(t) q3(t) q4(t) q5(t) t ;
Jac_exp=jacobian_matrix(q);
Jac_t=Jac_exp;
q=[q1 q2 q3 q4 q5];
q_t=[q1(t) q2(t) q3(t) q4(t) q5(t)];
for i=1:6
    for j=1:5
    Jac_exp(i,j)=subs(Jac_exp(i,j),q,q_t);
    Jac_t(i,j)=Jac_exp(i,j);
    end
end
J_dot=diff(Jac_t,t);
end

