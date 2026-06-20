function [outputVector] = task_traj_03(X0, Xf, tf)
    %For circle
    clc
    outputVector=zeros(3,100*tf);
        syms c r
        eqns = [r+c == X0(1) , c == X0(2)];
        vars = [c r];
[C,R] = solve(eqns,vars);
w=2*pi;
    for i=1:100*tf
     outputVector(1,i)=(R+0.004*i)*cos(0.004*w*i)+C;   
     outputVector(2,i)=(R+0.004*i)*sin(0.004*w*i)+C; 
     outputVector(3,i)=X0(3)+0.004*i;  
    end
    outputVector;
     plot3(outputVector(1,:),outputVector(2,:),outputVector(3,:));
 grid on
 xlabel('X-axis');
 ylabel('Y-axis');
 zlabel('Z-axis');
end