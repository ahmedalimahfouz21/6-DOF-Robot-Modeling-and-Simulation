function [outputVector] = task_traj_01(X0, Xf, tf)
    %For streight line
    clc
    outputVector=zeros(3,10*tf);
    alphax=(Xf(1)-X0(1))/tf;
    alphay=(Xf(2)-X0(2))/tf;
    alphaz=(Xf(3)-X0(3))/tf;
    for i=1:10*tf
     outputVector(1,i)=X0(1)+alphax*(0.1*i);   
     outputVector(2,i)=X0(2)+alphay*(0.1*i); 
     outputVector(3,i)=X0(3)+alphaz*(0.1*i);  
    end
    outputVector;
     plot3(outputVector(1,:),outputVector(2,:),outputVector(3,:));
 grid on
 xlabel('X-axis');
 ylabel('Y-axis');
 zlabel('Z-axis');
end

