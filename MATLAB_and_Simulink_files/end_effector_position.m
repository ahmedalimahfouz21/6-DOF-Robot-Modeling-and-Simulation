function [Pos] = end_effector_position(Trans_matrix)
x=Trans_matrix(1,4);
y=Trans_matrix(2,4);
z=Trans_matrix(3,4);
Pos=[x;y;z];
end

