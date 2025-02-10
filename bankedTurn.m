function [G,x,y,z,s,vx,vy,vz] = bankedTurn(x0,y0,z0,vx0,vy0,vz0,phi,theta)
% banked turn: function inputs [initial position (x,y,z), initial velocity, degree bank, degree turn, initial velocity vectors] 
% function outputs [G vectors, position vectors, path length, final velocity vectors]
% Constants
% h = 100;

g = 9.81;
h_0 = 125;
v = sqrt(2*g*(h_0-z0));
% Radius Calculation
r = cotd(phi)*v^2/(g);
s = r*theta;
theta = 0:theta;

angle = atan(vy0/vx0);
centerangled = [(0+r) 0 z0];
directionp = centerangled(1)-r*cosd(theta);
directionperp = center(2) + r*sind(theta);

x = (directionp * cos(angle) - directionperp * sin(angle))+x0;
y = (directionp * sin(angle) + directionperp * cos(angle))+y0;
z = centerangled(3)*ones(1,length(theta));

vz = vz0;
vx = 5;
vy=6;

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
