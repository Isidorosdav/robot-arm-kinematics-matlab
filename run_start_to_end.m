function run_start_to_end(L1, L2, theta1_start_deg, theta2_start_deg, target_x, target_y, N, time)

theta1_start = deg2rad(theta1_start_deg);
theta2_start = deg2rad(theta2_start_deg);

% Calculation of the angles that correspond to the final target (x,y)
[theta1_end, theta2_end] = inverse_kin(target_x, target_y, L1, L2);

fprintf('Starting angles: θ1=%.2f°, θ2=%.2f°\n', theta1_start_deg, theta2_start_deg);
fprintf('End angles: θ1=%.2f°, θ2=%.2f°\n', rad2deg(theta1_end), rad2deg(theta2_end));

% Interpolation in the joint space not at x-y.
theta1_vec = linspace(theta1_start, theta1_end, N);
theta2_vec = linspace(theta2_start, theta2_end, N);

setup_arm_figure(L1, L2, 'Start \rightarrow End (joint-space interpolation)');

% Starting position (gray line) and end point (green Χ) for reference
[x1_s, y1_s, x2_s, y2_s] = forward_kin(theta1_start, theta2_start, L1, L2);
plot([0 x1_s x2_s], [0 y1_s y2_s], 'Color', [0.6 0.6 0.6], 'LineWidth', 2, 'LineStyle', '--');
plot(target_x, target_y, 'gx', 'MarkerSize', 14, 'LineWidth', 2);

h_link1 = plot([0 0], [0 0], 'b-', 'LineWidth', 3);
h_link2 = plot([0 0], [0 0], 'r-', 'LineWidth', 3);
h_joint1 = plot(0, 0, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
h_effector = plot(0, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
h_trace = plot(NaN, NaN, 'm--', 'LineWidth', 1.5);

trace_x = []; trace_y = [];
for k = 1:N
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
legend('Base', 'Starting position', 'End point', 'Link 1', 'Link 2', 'Joint 1', 'End', 'Trace', 'Location', 'bestoutside');
hold off;
end
