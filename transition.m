function [G, s, x1, y1, z1, vx, vy, vz] = transition(x0,y0,z0,vx0,vy0,vz0, r)
    % h0: represents height difference between bottom of the loop and any
    % hill present before the loop
    % r: radius of the loop
    theta = linspace(270-rad2deg(atan(vz0/vy0)),270,1000);
    theta_loop = linspace(0,360,1000);
    g = 9.8;
    v0 = sqrt(2*g*(125-z0));

    s_transition = linspace(r*theta(1)*pi/180,0,1000);

    center = [x0,y0+r*cos(atan(-1/(vz0/vy0))), z0+r*sin(atan(-1/(vz0/vy0)))];

    x1 = linspace(0,0,1000);
    y1 = center(2) - r.*cosd(theta);
    z1 = center(3) + r.*sind(theta);


    vx = 0;
    vz = 0;
    vy = v0;


   % gs felt due to normal force at a given arc position s 
    G = v0^2/(g*r) + 3*cos(s_transition/r) - 2;


    s = s_transition(1);
end
