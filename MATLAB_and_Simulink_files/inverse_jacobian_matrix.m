function [inverse_jacobian] = inverse_jacobian_matrix(J,q_num)
%subistitute by numerical values
syms q q1 q2 q3 q4 q5 l1 l2 l3 l4 l5 J_num
q=[q1 q2 q3 q4 q5 l1 l2 l3 l4 l5];
J_num=J;
for i=1:3
    for j=1:5
    J(i,j)=subs(J(i,j),q,q_num);
    J_num(i,j)=J(i,j);
    end
end
inverse_jacobian=pinv(J_num);   

