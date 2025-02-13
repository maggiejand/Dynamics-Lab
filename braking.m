function [G, x, y, z, s, vx, vy, vz] = braking(x0, y0, z0, vx0, vy0, vz0)
    g = 9.8; % Gravity acceleration (m/s^2)
    h0 = 125; % Initial height (m)
    V_tot0 = sqrt(2 * g * (h0 - z0)); % Initial total velocity
    
    % Compute total time until stop assuming constant deceleration
    t_stop = V_tot0 / 15; % Initial estimate of stopping time
    a = g-(vz0^2)/2/z0; % Adjust acceleration to ensure stopping at z = 0
    
    % Time step
    dt = 0.01;
    t = 0:dt:t_stop;
    
    % Preallocate arrays
    n = length(t);
    V_tot = zeros(1, n);
    x = zeros(1, n);
    y = zeros(1, n);
    z = zeros(1, n);
    vx = zeros(1, n);
    vy = zeros(1, n);
    vz = zeros(1, n);
    G = ones(1, n) * (a / g);
    
    % Initial conditions
    V_tot(1) = V_tot0;
    x(1) = x0;
    y(1) = y0;
    z(1) = z0;
    vx(1) = vx0;
    vy(1) = vy0;
    vz(1) = vz0;
    
    % Angle calculations
    theta_xy = atan2(vy0, vx0); % Horizontal angle
    theta_z = atan2(vz0, sqrt(vx0^2 + vy0^2)); % Vertical angle
    
    % Time stepping loop
    for i = 2:n
        % Update total velocity considering acceleration due to gravity
        V_tot(i) = V_tot(i-1) - a * dt;
        if V_tot(i) <= 0
            V_tot(i) = 0;
            z(i) = 0;
            break;
        end
        
        % Update positions while maintaining entry slope
        x(i) = x(i-1) + (V_tot(i) * (vx0 / sqrt(vx0^2 + vy0^2 + vz0^2))) * dt;
        y(i) = y(i-1) + (V_tot(i) * (vy0 / sqrt(vx0^2 + vy0^2 + vz0^2))) * dt;
        z(i) = z(i-1) + (V_tot(i) * (vz0 / sqrt(vx0^2 + vy0^2 + vz0^2))) * dt;
        
        % Ensure z does not go below zero
        if z(i) <= 0
            z(i) = 0;
            break;
        end
        
        % Update velocity components
        vx(i) = V_tot(i) * (vx0 / sqrt(vx0^2 + vy0^2 + vz0^2));
        vy(i) = V_tot(i) * (vy0 / sqrt(vx0^2 + vy0^2 + vz0^2));
        vz(i) = V_tot(i) * (vz0 / sqrt(vx0^2 + vy0^2 + vz0^2));
    end
    
    % Trim arrays to actual length
    x = x(1:i);
    y = y(1:i);
    z = z(1:i);
    vx = vx(1:i);
    vy = vy(1:i);
    vz = vz(1:i);
    V_tot = V_tot(1:i);
    G = G(1:i);
    
    % Compute arc length
    s = cumsum(sqrt(diff([x0, x]).^2 + diff([y0, y]).^2 + diff([z0, z]).^2));
end
