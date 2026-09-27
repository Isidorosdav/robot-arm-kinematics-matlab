function [theta1, theta2] = inverse_kin(target_x, target_y, L1, L2)

d = sqrt(target_x^2 + target_y^2);

if d > (L1 + L2) || d < abs(L1 - L2)
    error('The end point (%.2f, %.2f) is out of reach.', target_x, target_y);
end

cos_theta2 = (d^2 - L1^2 - L2^2) / (2 * L1 * L2);
cos_theta2 = min(max(cos_theta2, -1), 1);
theta2 = acos(cos_theta2);

alpha = atan2(target_y, target_x);
beta = atan2(L2*sin(theta2), L1 + L2*cos(theta2));
theta1 = alpha - beta;
end