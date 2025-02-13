clear;
clc;
close all;


%{
%% Example for Position of banked turn
r1 = 50;
theta1 = 0:45;
angle1 = atan(vy/vx);

centerangled = [(0+r) 0 0];
direction1p = centerangled(1)-r*cosd(theta1);
directionperp1 = center(2) + r*sind(theta1);

x1p = direction1p * cos(angle1) - directionperp1 * sin(angle1);
y1p = direction1p * sin(angle1) + directionperp1 * cos(angle1);
z1p = centerangled(3)*ones(1,length(theta1));
%}


%% Starting from the top
% Ploting
figure(1);
hold on;
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
cb = colorbar; 
cb.Label.String = "Gs Experienced";

%initial variables for first parabola drop
x0 = 0;
y0 = 0;
z0 = 125;
t_end = 2.75;

% Dropping!!
[G,s,x,y,z,vx,vy,vz] = parabola(x0,y0,z0,0,0,0,t_end,1);

% Plotting initial drop
view(3);
plot3(x,y,z);
scatter3(x(1:end-1),y(1:end-1),z(1:end-1),3,G,'filled');
s_tot = s(end);

%% Going into loopies

x0 = x(end);
y0 = y(end);                                                                                                                                                                                                                                
z0 = z(end);
vx0 = vx;
vy0 = vy;
vz0 = vz;

r = 35;

[G, s, x, y, z, vx, vy, vz] = loopgs(x0,y0,z0,vx0,vy0,vz0, r);

view(3);
plot3(x,y,z);
scatter3(x,y,z,2,G,'filled');

s_tot = s_tot+s;

%% 0g parabola
x0 = x(end);
y0 = y(end);                                                                                                                                                                                                                                
z0 = z(end);
vx0 = vx;
vy0 = vy;
vz0 = vz;
t_end = 3;

[G,s,x,y,z,vx,vy,vz] = parabola(x0,y0,z0,vx0,vy0,vz0,t_end,1);

view(3);
plot3(x,y,z);
scatter3(x(1:end-1),y(1:end-1),z(1:end-1),2,G,'filled');

s_tot = s_tot+s(end);

%% Another loop to get flat

x0 = x(end);
y0 = y(end);                                                                                                                                                                                                                                
z0 = z(end);
vx0 = vx;
vy0 = vy;
vz0 = vz;

r = 20;

[G, s, x, y, z, vx, vy, vz] = loopgs(x0,y0,z0,vx0,vy0,vz0, r);

view(3);
plot3(x,y,z);
scatter3(x,y,z,2,G,'filled');
s_tot = s_tot+s;

%% banked 
x0 = x(end);
y0 = y(end);                                                                                                                                                                                                                                
z0 = z(end);
vx0 = vx;
vy0 = vy;
vz0 = vz;
phi = 60;
theta = 179;
[G,x,y,z,s,vx,vy,vz] = bankedTurn(x0,y0,z0,vx0,vy0,vz0,phi,theta);

view(3);
plot3(x,y,z);
scatter3(x,y,z,2,G,'filled');
s_tot = s_tot+s;
