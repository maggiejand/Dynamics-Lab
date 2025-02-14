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
s1 = (s(1:end-1))';
G_save = G;
G1 = G;
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
s_save = [s_save, s+s_save(end)];
s2 = s;
G_save = [G_save,G];
G2 = G;

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
s_save = [s_save,s_save(end)+(s(1:end-1))'];
s3 = (s(1:end-1))';
G_save = [G_save,G];
G3 = G;

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

s_tot = s_tot+s(end);
s_save = [s_save, s+s_save(end)];
s4 = s;
G_save = [G_save,G];
G4 = G;

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
s_tot = s_tot+s(end);
s_save = [s_save, s+s_save(end)];
s5 = s;
G_save = [G_save,G];
G5 = G;

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
s_save = [s_save,s_save(end)+(s(1:end-1))'];
s6 = (s(1:end-1))';
G_save = [G_save,G];
G6 = G;


%% Annnnnd we're braking

x0 = x(end);
y0 = y(end);                                                                                                                                                                                                                            
z0 = z(end);
vx0 = vx;
vy0 = vy;
vz0 = vz;

[G_tangential,G_normal,x,y,z,s,vx,vy,vz] = braking(x0,y0,z0,vx0,vy0,vz0);


view(3);
plot3(x,y,z);
scatter3(x,y,z,2,G_normal,'filled');

s_tot = s_tot+s(end);
s_save = [s_save,s_save(end)+s];
s7 = s;
G_save = [G_save,G_normal];
G7 = G_normal;

hold off; 


figure(2);
hold on;
title('Parabola 1')
xlabel('Path length (m)')
ylabel('Normal Gs')
plot(s1,G1)
hold off;

figure(3);
hold on;
title('Loop 1')
xlabel('Path length (m)')
ylabel('Normal Gs')
plot(s2,G2)
hold off;

figure(4);
hold on;
title('Parabola 2')
xlabel('Path length (m)')
ylabel('Normal Gs')
plot(s3,G3)
hold off;

figure(5);
hold on;
title('Loop 2')
xlabel('Path length (m)')
ylabel('Normal Gs')
plot(s4,G4)
hold off;

figure(6);
hold on;
title('Banked Turn 1')
xlabel('Path length (m)')
ylabel('Normal Gs')
plot(s5,G5)
hold off;

figure(7);
hold on;
title('Parabola 3')
xlabel('Path length (m)')
ylabel('Normal Gs')
plot(s6,G6)
hold off;

figure(8);
hold on;
title('Braking')
xlabel('Path length (m)')
ylabel('Normal Gs')
plot(s7,G7)
hold off;

figure(9)
hold on;
title('Total Path V Gs')
xlabel('Path length (m)')
ylabel('Normal Gs')
plot(s_save,G_save)
hold off;



