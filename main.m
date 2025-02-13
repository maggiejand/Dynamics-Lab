clear;
clc;
close all;

%% Starting from the top
% Ploting
figure(1);
hold on;
title("The Super-Duper G Coaster")
xlabel('X-axis (m)');
ylabel('Y-axis (m)');
zlabel('Z-axis (m)');
grid on;
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

s_save = (s(1:end-1))';
s_1 = (s(1:end-1))';
G_save = G;
G_1 = G
s_tot = s(end);



%% Going into loopies

x0 = x(end);
y0 = y(end);                                                                                                                                                                                                                                
z0 = z(end);
vx0 = vx;
vy0 = vy;
vz0 = vz;

r = 15;

[G, s, x, y, z, vx, vy, vz] = loopgs(x0,y0,z0,vx0,vy0,vz0, r);

view(3);
plot3(x,y,z);
scatter3(x,y,z,2,G,'filled');

s_tot = s_tot+s(end);
s_save = [s_save, abs(s)+s_save(end)];
G_save = [G_save,G];
%{
hold off;
figure (2);
plot(s_save,G_save);

%}
%% 0g parabola
x0 = x(end);
y0 = y(end);                                                                                                                                                                                                                                
z0 = z(end);
vx0 = vx;
vy0 = vy;
vz0 = vz;
t_end = 2.8;

[G,s,x,y,z,vx,vy,vz] = parabola(x0,y0,z0,vx0,vy0,vz0,t_end,1);

view(3);
plot3(x,y,z);
scatter3(x(1:end-1),y(1:end-1),z(1:end-1),2,G,'filled');

s_tot = s_tot+s(end);

G_parabola = G;
s_parabola = s;
dist_parabola = s_parabola(1:end-1)';

%% Another loop to get flat 

x0 = x(end);
y0 = y(end);                                                                                                                                                                                                                                
z0 = z(end);
vx0 = vx;
vy0 = vy;
vz0 = vz;
r = 45;

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
phi = 75;
theta = 180;
[G,x,y,z,s,vx,vy,vz] = bankedTurn(x0,y0,z0,vx0,vy0,vz0,phi,theta);

view(3);
plot3(x,y,z);
scatter3(x,y,z,2,G,'filled');
s_tot = s_tot+s;

%% Some downslope to get to 0

x0 = x(end);
y0 = y(end);                                                                                                                                                                                                                                
z0 = z(end);
vx0 = vx;
vy0 = vy;
vz0 = vz;
t_end = 0.666;

[G,s,x,y,z,vx,vy,vz] = parabola(x0,y0,z0,vx0,vy0,vz0,t_end,1);

view(3);
plot3(x,y,z);
scatter3(x(1:end-1),y(1:end-1),z(1:end-1),2,G,'filled');

s_tot = s_tot+s(end);


%% Annnnnd we're braking

x0 = x(end);
y0 = y(end);                                                                                                                                                                                                                              
z0 = z(end);
vx0 = vx;
vy0 = vy;
vz0 = vz;

[G,x,y,z,s,vx,vy,vz] = braking(x0,y0,z0,vx0,vy0,vz0);

view(3);
plot3(x,y,z);
scatter3(x,y,z,2,G,'filled');


%% Plotting

figure();
plot(dist_parabola,G_parabola);
yline(5,'r--');
yline(-4,'r--');
legend('Gs felt','Forward G max.','Backward G max.');
ylim([-5,6]);
xlim([0,s_parabola(end-1)]);
title('Gs Felt Forward and Back (+ y and - y respectively)');


figure();
plot(dist_parabola,G_parabola);
yline(6,'r--');
yline(-1,'r--');
ylim([-2,7]);
xlim([0,s_parabola(end-1)]);
legend('Gs felt','Upward G max.','Downward G max.');
title('Gs Felt Up and Down (+ y and - y respectively)');

figure();
plot(dist_parabola,G_parabola);
yline(3,'r--');
yline(-3,'r--');
ylim([-4,4]);
xlim([0,s_parabola(end-1)]);
legend('Gs felt','Left G max.','Right G max.');
title('Gs Felt Laterally Left and Right (+ y and - y respectively)');