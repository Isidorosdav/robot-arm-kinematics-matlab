function run_ik(L1, L2, target_x, target_y)

[theta1, theta2] = inverse_kin(target_x, target_y, L1, L2);
fprintf('Solution IK (elbow-up): theta1 = %.2f°, theta2 = %.2f°\n', rad2deg(theta1), rad2deg(theta2));

[x1, y1, x2, y2] = forward_kin(theta1, theta2, L1, L2);
fprintf('Verification: end at (%.2f, %.2f), end point was (%.2f, %.2f)\n', x2, y2, target_x, target_y);

setup_arm_figure(L1, L2, 'Inverse Kinematics - 2-Link Planar Arm');
plot([0 x1], [0 y1], 'b-', 'LineWidth', 3);
plot(x1, y1, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
plot([x1 x2], [y1 y2], 'r-', 'LineWidth', 3);
plot(x2, y2, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
plot(target_x, target_y, 'gx', 'MarkerSize', 14, 'LineWidth', 2);
legend('Base', 'Link 1', 'Joint 1', 'Link 2', 'End', 'End point', 'Location', 'bestoutside');
hold off;
end