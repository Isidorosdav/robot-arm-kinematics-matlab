function [l1,l2] = line_path(x1,y1,x2,y2)

p1 = [x1,y1];
p2 = [x2,y2];
v  = p2 - p1;

d1 = norm(p1);
d2 = norm(p2);
dmax = max(d1,d2);          % farthest point is always an endpoint

% Find the closest approach of the segment to the origin
v2 = dot(v,v);
if v2 > 0
    t_star = -dot(p1,v)/v2;      % parameter of closest point on the INFINITE line
    t_star = min(max(t_star,0),1); % clamp to the segment [0,1]
else
    t_star = 0;                  % p1 == p2, degenerate segment
end
p_closest = p1 + t_star*v;
dmin = norm(p_closest);          % true closest distance on the segment

% Tiny numerical safety margin only (not a geometric fudge factor)
tol = 1e-9*dmax;
dmax = dmax + tol;
dmin = max(dmin - tol, 0);

l1 = (dmin+dmax)/2;
l2 = (dmax-dmin)/2;
fprintf("Solution for minimum L1, L2:\n")
fprintf("[L1, L2] = [%f, %f]",l1,l2);