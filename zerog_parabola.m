function [G,s,x,y,z,vx,vy,vz] = parabola(x0,y0,z0,vx0,vy0,vz0)

h_0 = 125; % m
g = 9.81; % m/s^2
delta_h_initial = h_0 - z0; % m

t = linspace(0,1000,1000); % time 

x1 = x0 + vx0.*t;
y1 = y0 + vy0.*t;
z1 = z0 + vz0.t - (0.5)*g.*t.^2;

x = x1(length(t));
y = y1(length(t));
z = z1(length(t));

G = 0.*t;
s = zeros(length(t));
s(1) = sqrt((x1(1)-x0)^2+(y1(1)-y0)^2+(z1(1)-z0)^2);

for i=1:length(t)-1

    s(i+1) = sqrt((x1(i+1)-x1(i))^2+(y1(i+1)-y1(i))^2+(z1(i+1)-z1(i))^2);

end


end