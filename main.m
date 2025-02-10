clear;
clc;

%% Call Functions here

%[G,x,y,z,s,vx,vy,vz] = bankedTurn(0,0,0,5,6,7,14);

%% Example for how to get position vectors out of loop

theta = 0:360;
r=25;
center = [0 0 (0+r)];
vx=5;
vy=10;

zp = center(3)-r*sind(theta);
directionp = center(1) + r*cosd(theta);
angle = atan(vy/vx);
xp = directionp.*cos(angle);
yp=directionp.*sin(angle);

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

%% Position out of parabola
angle2 = atan(vx/vy);

initial = [0 0 0];
height = 10;
direction2p = linspace(0,2*sqrt(height),100);

x2p = direction2p.*cos(angle2)+initial(1);
y2p = direction2p.*sin(angle2)+initial(2);
z2p = -(direction2p-sqrt(height)).^2+height+initial(3);

%% Plotting 
% no need to attatch position vectors, they don't need to be plotted with
% respect to time. 


figure (1)
plot3(x2p,y2p,z2p);
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');


%% Plot total Gs

