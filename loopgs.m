function [gforce, normal_force] = loopgs(h0, r)
    % h0: represents height difference between bottom of the loop and any
    % hill present before the loop
    % r: radius of the loop
    % s: arc position\
    g = 9.8;
    v0 = sqrt(2*g*h0);
    gforce = v0^2/(g*r) + 3*cos(s/r) - 2; % gs felt due to normal force at a given arc position s 
    
end
