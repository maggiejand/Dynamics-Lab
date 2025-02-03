function [gforce_up, gforce_forward, vf] = loopgs(v0, r, s)
    % h0: represents height difference between bottom of the loop and any
    % hill present before the loop
    % r: radius of the loop
    % s: arc position\
    % min v0 to enter loop = sqrt(5gr)
    g = 9.8;
    %v0 = sqrt(2*g*h0);
    v = sqrt(v0^2 - 2*g*sin((s/r) - pi/2));  % velocity along any given point of the loop
    a_tang = -g*sin(s/r)/s; % derived equation for a tangential found using energy
    gforce_forward = a_tang/g; % gs felt due to normal force from the seat
    gforce_up = v0^2/(g*r) + 3*cos(s/r) - 2; % gs felt due to normal force at a given arc position s 
end
