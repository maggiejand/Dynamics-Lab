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
center1 = [(100+r) 100 100];
direction1p = center1(1)-r1*cosd(theta1); 
direction2p = center(2)+r1*sind(theta1);
x1p = direction1p.*cos(angle)+direction2p.*cos(angle);
y1p = direction2p.*sin(angle)+direction1p.*sin(angle);
z1p = center(3)*ones(1,length(theta1));

%% Plotting 
% no need to attatch position vectors, they don't need to be plotted with
% respect to time. 


figure (1)
plot3(x1p,y1p,z1p);
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');


%% Plot total Gs

