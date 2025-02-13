function [G, s, x1, y1, z1, vx, vy, vz] = loopgs(x0,y0,z0,vx0,vy0,vz0, r)
    % h0: represents height difference between bottom of the loop and any
    % hill present before the loop
    % r: radius of the loop
    theta = linspace(rad2deg(atan(vz0/vy0)),270,250);
    theta_loop = linspace(-90,270,750);
    g = 9.8;
    v0 = sqrt(2*g*z0);

    s = linspace(0,2*pi*r,750);
    s_transition = linspace(r*theta(1)*pi/180,0,250);

    center = [x0,y0+r*cos(atan(-1/(vz0/vy0))), z0+r*sin(atan(-1/(vz0/vy0)))]

    x1 = linspace(0,0,1000);
    y1 = center(2) - r.*cosd(theta);
    z1 = center(3) + r.*sind(theta);

    y2 = center(2) - r.*cosd(theta_loop);
    z2 = center(3) + r.*sind(theta_loop);
    
    y1 = [y1,y2];
    z1 = [z1,z2];
    vx = 0;
    vz = 0;
    vy = v0;


    G_loop = v0^2/(g*r) + 3*cos(s/r) - 2; % gs felt due to normal force at a given arc position s 
    G_transition = v0^2/(g*r) + 3*cos(s_transition/r) - 2;
    G = [G_transition,G_loop];

    s = s(end)+s_transition(1);
end
