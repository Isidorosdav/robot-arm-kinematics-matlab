function [l1,l2] = circle_path(x,y,r)

theta=atan2(y,x);
k=2*r*(x*cos(theta)+y*sin(theta));

l1=(sqrt(x^2+y^2+r^2-k)+sqrt(x^2+y^2+r^2+k))/2;
l2=sqrt(x^2+y^2+r^2+k)-l1;

fprintf("Solution for minimum L1, L2:\n")
fprintf("[L1, L2] = [%f, %f]",l1,l2);