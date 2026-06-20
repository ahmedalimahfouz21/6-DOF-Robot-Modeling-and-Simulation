function [q_dot] = inverse_velocity_kinematics(q,q_num,V_F)
J_inverse=J_inv(q,q_num);
q_dot=J_inverse*V_F;
end

