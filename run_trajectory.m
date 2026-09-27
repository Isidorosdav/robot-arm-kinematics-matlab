function run_trajectory(path_type, N, time)

switch path_type
    case 'line'
        
        x1=input("Enter the x-coordinate of the starting point: ");
        y1=input("Enter the y-coordinate of the starting point: ");

        x2=input("Enter the x-coordinate of the end point: ");
        y2=input("Enter the y-coordinate of the end point: ");

        [L1, L2] = line_path(x1,y1,x2,y2);

        p_start = [x1, y1]; 
        p_end = [x2, y2];
        path_x = linspace(p_start(1), p_end(1), N);
        path_y = linspace(p_start(2), p_end(2), N);
   
    case 'circle'
        
        x=input("Enter the x-coordinate of the center: ");
        y=input("Enter the y-coordinate of the center: ");
        r=input("Enter the radius of the circle: ");
        
        [L1, L2] = circle_path(x,y,r);

        center = [x, y]; 
        angles = linspace(0, 2*pi, N);
        path_x = center(1) + r*cos(angles);
        path_y = center(2) + r*sin(angles);
    otherwise
        error('Unknown path type: %s', path_type);
end

d_all = sqrt(path_x.^2 + path_y.^2);

if any(d_all > (L1+L2)) || any(d_all < abs(L1-L2))
    error("The trajectory is outside the robot arm's reach.");
end

setup_arm_figure(L1, L2, sprintf('Trajectory Planning - %s path', path_type));
plot(path_x, path_y, 'g:', 'LineWidth', 1);

h_link1 = plot([0 0], [0 0], 'b-', 'LineWidth', 3);
h_link2 = plot([0 0], [0 0], 'r-', 'LineWidth', 3);
h_joint1 = plot(0, 0, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
h_effector = plot(0, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
h_trace = plot(NaN, NaN, 'm--', 'LineWidth', 1.5);

trace_x = []; trace_y = [];
for k = 1:N
    [theta1, theta2] = inverse_kin(path_x(k), path_y(k), L1, L2);
    [x1, y1, x2, y2] = forward_kin(theta1, theta2, L1, L2);

    set(h_link1, 'XData', [0 x1], 'YData', [0 y1]);
    set(h_link2, 'XData', [x1 x2], 'YData', [y1 y2]);
    set(h_joint1, 'XData', x1, 'YData', y1);
    set(h_effector, 'XData', x2, 'YData', y2);

    trace_x(end+1) = x2;
    trace_y(end+1) = y2;
    set(h_trace, 'XData', trace_x, 'YData', trace_y);

    drawnow;
    pause(time);
end
hold off;
end