function [V_F] = forward_velocity_kinematics(q,q_dot)
V_F=jacobian_matrix(q)*q_dot;
end

