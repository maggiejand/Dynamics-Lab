clear;
clc;

%% Call Functions here

%[G,x,y,z,s,vx,vy,vz] = bankedTurn(0,0,0,5,6,7,14);

%% Example for how to get position vectors out of banked turn
theta = 25;
r = 50;
deg = linspace(0,theta,25);
xinit  = 0;
yinit = 0;
zinit = 0;
xb =0;
yb=0;
zb = 0;

% we know that the position can be modeled with (x-r)^2+y^2=r^2 (r,0) or
% x^2+(y-r)=r^2 (0,r) depending on which way we want the turn to bank, we can
% make radius negative to complete all options

%case for x bank

%this process would also work well for a loop
center = [(xinit+r) yinit];
for i = 1:length(deg)
    zb(i) = zinit;
    xb(i) = center(1)+r*cosd(deg(i));
    yb(i) = center(2)+r*sind(deg(i));

end

%% Plotting 
% no need to attatch position vectors, they don't need to be plotted with
% respect to time. 


figure (1)

plot3(xb,yb,zb);

%% Plot total Gs

