function [F_Xn_dash] = dFi_dqi(F_Xn)
syms q q1 q2 q3 q4 q5 F_Xn_dash
q=[q1 q2 q3 q4 q5];
for i=1:3
   for j=1:5
     F_Xn_dash(i,j) =diff(F_Xn(i),q(j)); 
   end
end

