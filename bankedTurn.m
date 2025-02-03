function [G,x,y,z,s,vx,vy,vz] = bankedTurn(x0,y0,z0,vx0,vy0,vz0,phi,theta,theta_up)
% banked turn: function inputs [initial position (x,y,z), initial velocity, degree bank, degree turn, initial velocity vectors] 
% function outputs [G vectors, position vectors, path length, final velocity vectors]
% Constants
% h = 100;
% Assumption: No initial z velocity and only one component of initial
% velocity between x and y.
theta_up = 0:theta_up;
g = 9.81;
h_0 = 125;
v = sqrt(2*g*(h_0-z0));
% Radius Calculation
r = cotd(phi)*v^2/(g);
s = r*theta;
theta = 0:theta;
if vy0 ~= 0 && vx0 == 0
    center = [(x0+r) y0 z0];
    z = center(3) + r*sind(theta_up);
    x = center(1) - r*cosd(theta);
    y = center(2) + r*sind(theta);
    vx = r*sind(theta);
    vy = r*cosd(theta);
    vz = 0;

elseif vx0 ~= 0 && vy0 == 0
    center = [(x0) (y0+r) z0];
    z = center(3) + r*sind(theta_up);
    x = center(1) + r*sind(theta);
    y = center(2) - r*cosd(theta);
    vx = r*cosd(theta);
    vy = r*sind(theta);
    vz = 0;

else
    disp('Breaks Assumptions')

end
G = 1./cosd(phi);
% hold on;
plot(theta,G);
% plot(theta,r);
xlabel('Angle of Bank (deg)')
% ylabel('Radius Needed (m)')
% Normal G calculation
% yyaxis right
ylabel('Gs Felt')
xline(acosd(1/6)); % All angles past this are unusable (Normal Gs > 6)

