function [M_num] = expression2num(M_exp,V_num)
for i=1:height(M_exp)
    for j=1:width(M_exp)
    for k=1:length(V_num)
    M_exp(i,j)=subs(M_exp(i,j),q(k),q_num(k));
    M_num(i,j)=M_exp(i,j);
    end
    end
end
end

