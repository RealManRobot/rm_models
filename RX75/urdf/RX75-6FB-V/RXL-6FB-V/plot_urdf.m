clear,clc,close all

pos = [0.1 0.1 0.1 0.1 0.1 0.1 0.1]*0;
% pos = [0 0 0 0 0 0 0]*1;
% load robot 3D model
robot = importrobot("urdf\RXL-6FB-V.urdf");
position = homeConfiguration(robot);
for i=1:7
    position(i).JointPosition= pos(i);
end

show(robot,position,'PreservePlot',false,'Frames','on');
title("lao版本")
grid off

% 计算末端执行器的齐次变换矩阵
% 使用 forwardKinematics 函数
tform = getTransform(robot, position, 'Link8');  % 获取末端执行器（link7）的变换矩阵

% 输出齐次变换矩阵
disp(tform);