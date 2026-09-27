function run_animation(L1, L2, time)

t = linspace(0, 2*pi, 200);
theta1_vec = deg2rad(45 + 30*sin(t));
theta2_vec = deg2rad(30 + 60*sin(2*t));

setup_arm_figure(L1, L2, 'Animation - 2-Link Planar Arm');
h_link1 = plot([0 0], [0 0], 'b-', 'LineWidth', 3);
h_link2 = plot([0 0], [0 0], 'r-', 'LineWidth', 3);
h_joint1 = plot(0, 0, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
h_effector = plot(0, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

h_trace = plot(NaN, NaN, 'g--', 'LineWidth', 1);

trace_x = []; 
trace_y = [];

for k = 1:length(t)
    [x1, y1, x2, y2] = forward_kin(theta1_vec(k), theta2_vec(k), L1, L2);

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