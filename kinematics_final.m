%% Robot Arm Kinematics
% 2-Link Planar Robotic Arm: Forward Kinematics, Animation,
% Inverse Kinematics, Trajectory Planning, Start to End mode.

clear;
clc; 
close all;

N = 75; % Number of frames in the animation
time = 0.05;
%% Mode Selection Input

mode = menu("Chose a mode", 'forward kinematics', 'animation', 'inverse kinematics', 'trajectory', 'start to end');
if mode~=4
    L1 = input("Enter the length L1: ");
    
    if L1<=0
        error('Length L1 must be positive. Please enter a valid length.');
    end
    
    L2 = input("Enter the length L2: ");

    if L1<=0
        error('Length L2 must be positive. Please enter a valid length.');
    end
end

%% Mode Output

switch mode
    case 1
        a1=input("Enter an angle for θ1 (deg): ");
        a2=input("Enter an angle for θ2 (deg): ");

        run_fk(L1, L2, a1, a2);

    case 2
        
        run_animation(L1, L2, time);

    case 3
        x_target=input("Enter the x-coordinate of the target position: ");
        y_target=input("Enter the y-coordinate of the target position: ");

        run_ik(L1, L2, x_target, y_target);

    case 4
        trajectory = input("Chose a mode (line or circle): ","s");
        
        run_trajectory(trajectory, N, time);

    case 5
        % Starting position in angles (deg)
        fprintf("Starting position:\n")
        theta1_start_deg = input("Enter an angle for θ1 (deg): ");
        theta2_start_deg = input("Enter an angle for θ2 (deg): ");
        
        % End point in coordinates
        fprintf("End point:\n")
        target_x = input("Enter the x-coordinate of the target position: ");
        target_y = input("Enter the y-coordinate of the target position: ");
        run_start_to_end(L1, L2, theta1_start_deg, theta2_start_deg, target_x, target_y, N, time);

    otherwise
        error('Unknown mode: "%s". Select fk, animation, ik, trajectory or start to end.', mode);
end