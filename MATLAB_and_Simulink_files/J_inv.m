function [J_inv] = J_inv(q,q_num)
%subistitute by numerical values
J=jacobian_matrix(q);
syms q q1 q2 q3 q4 q5 J_num
q=[q1 q2 q3 q4 q5];
J_num=J;
for i=1:6
    for j=1:5
    J(i,j)=subs(J(i,j),q,q_num);
    J_num(i,j)=J(i,j);
    end
end
J_inv=pinv(J_num);  
end

