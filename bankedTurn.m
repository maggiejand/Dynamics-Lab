function [G,x,y,z,s,vx,vy,vz] = bankedTurn(x0,y0,z0,vx0,vy0,vz0,theta)
% banked turn: function inputs [initial position (x,y,z), radius, degree turn, initial velocity vectors] 
% function outputs [G vectors, position vectors, path length, final velocity vectors]
% Constants
% h = 100;
% theta = 0:90;
g = 9.81;
h_0 = 125;
v = sqrt(2*g*(h_0-z0));
% Radius Calculation
r = cotd(theta)*v^2/(g);
s = r*theta;

hold on;
plot(theta,r);
xlabel('Angle of Bank (deg)')
ylabel('Radius Needed (m)')
% Normal G calculation
G = 1./cosd(theta);
yyaxis right
ylabel('Gs Felt')
xline(acosd(1/6)); % All angles past this are unusable (Normal Gs > 6)
plot(theta,G)

vz = vz0;