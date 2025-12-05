clear,clc,close all

pos = [0 0 0 0 0 0 0]*pi/180;
% pos = [0 0 0 0 0 0 0]*1;
% load robot 3D model
robot = importrobot("urdf/RM65-B-V.urdf");
position = homeConfiguration(robot);
for i=1:6
    position(i).JointPosition= pos(i);
end

show(robot,position,'PreservePlot',false,'Frames','on');

grid off

% 计算末端执行器的齐次变换矩阵
% 使用 forwardKinematics 函数
tform = getTransform(robot, position, 'link_6');  % 获取末端执行器（link7）的变换矩阵

% 输出齐次变换矩阵
disp(tform);
