function [G,s,x,y,z,vx,vy,vz] = zerog_parabola(x0,y0,z0,vx0,vy0,vz0,t_end)
h_0 = 125; % m
g = 9.81; % m/s^2

t = linspace(0,t_end,1000); % time 

x1 = x0 + vx0.*t;
y1 = y0 + vy0.*t;
z1 = z0 + vz0.t - (0.5)*g.*t.^2;

x = x1(end);
y = y1(end);
z = z1(end);

vx = vx0;
vy = vy0;
vz = vz0 - g*t(end);


%% Finding Gs and s

f(y) = z0 + ((y-y0)/vy0)*vz0 - (0.5)*g*((y-y0)/vy0)^2;

f_prime(y) = vz0/vy0 - ((y-y0)*g/vy0^2);

f_Dprime(y) = -g/vy0^2;

rho = ((1+(f_prime).^2)^(3/2))./(f_Dprime);

Vel = sqrt(2*g*(h_0-f));

ds = sqrt(y.^2 + z.^2);

d_theta = ds/rho;

G = -Vel.^2/(rho*g) + sin(d_theta);



%G = 0.*t;
s = zeros(length(t));
s(1) = sqrt((x1(1)-x0)^2+(y1(1)-y0)^2+(z1(1)-z0)^2);

for i=1:length(t)-1

    s(i+1) = sqrt((x1(i+1)-x1(i))^2+(y1(i+1)-y1(i))^2+(z1(i+1)-z1(i))^2);

end


end