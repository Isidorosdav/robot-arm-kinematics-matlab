function h = setup_arm_figure(L1, L2, titleStr)

h = figure;
axis equal; 
grid on; 
hold on;

lim = L1 + L2 + 1;
xlim([-lim, lim]); 
ylim([-lim, lim]);
title(titleStr);
xlabel('x'); ylabel('y');

plot(0, 0, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k'); % Base
end