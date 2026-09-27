function run_fk(L1, L2, theta1_deg, theta2_deg)

theta1 = deg2rad(theta1_deg);
theta2 = deg2rad(theta2_deg);

[x1, y1, x2, y2] = forward_kin(theta1, theta2, L1, L2);

fprintf('Joint 1 Position: (%.2f, %.2f)\n', x1, y1);
fprintf('End Join Position: (%.2f, %.2f)\n', x2, y2);

setup_arm_figure(L1, L2, 'Forward Kinematics - 2-Link Planar Arm');
plot([0 x1], [0 y1], 'b-', 'LineWidth', 3);
plot(x1, y1, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
plot([x1 x2], [y1 y2], 'r-', 'LineWidth', 3);
plot(x2, y2, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
legend('Base', 'Link 1', 'Joint 1', 'Link 2', 'End', 'Location', 'bestoutside');
hold off;
end