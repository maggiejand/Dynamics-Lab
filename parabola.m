function [G, s, x1, y1, z1, vx, vy, vz] = parabola(x0, y0, z0, vx0, vy0, vz0, t_end, G0)
    h_0 = 125; 
    g = 9.81; 
    t = linspace(0, t_end, 1000);
    
    if G0 == 1 
        x1 = x0 + vx0 .* t;
        y1 = y0 + vy0 .* t;
        z1 = z0 + vz0 .* t - (0.5) * g .* t.^2;
        
    else
        flight_time = sqrt(2 * h_0 / g) * 2; 
        vy0 = 50 / flight_time; 
        vz0 = 50 / flight_time; 
        vx0 = 0; 

        x1 = x0 + vx0 .* t;
        y1 = y0 + vy0 .* t;
        z1 = z0 + vz0 .* t - (0.5) * g .* t.^2;
    end
    
    vx = vx0;
    vy = vy0;
    vz = vz0 - g * t(end);
    
    f = @(y_val) z0 + ((y_val - y0) / vy0) * vz0 - (0.5) * g * ((y_val - y0) / vy0).^2;
    
    f_prime = @(y_val) vz0 / vy0 - ((y_val - y0) * g / vy0^2);
    
    f_Dprime = @(y_val) -g / vy0^2;
    
    rho = ((1 + (f_prime(y1)).^2).^(3/2)) ./ abs(f_Dprime(y1));
    
    Vel = sqrt(2 * g * (h_0 - f(y1)));
    
    ds = sqrt(diff(x1).^2 + diff(y1).^2 + diff(z1).^2);
    
    d_theta = ds ./ rho(1:end-1);
    
    G = -Vel(1:end-1).^2 ./ (rho(1:end-1) * g) + sin(d_theta);
    
    s = zeros(length(t), 1);
    s(1) = sqrt((x1(1) - x0)^2 + (y1(1) - y0)^2 + (z1(1) - z0)^2);

    vz = vz(end);

    if G0 == 1
        G = zeros(1,999);
    
    for i = 1:length(t) - 1
        s(i + 1) = s(i) + sqrt((x1(i + 1) - x1(i))^2 + (y1(i + 1) - y1(i))^2 + (z1(i + 1) - z1(i))^2);
    end
end
