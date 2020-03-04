function [z, v] = CTP7(x)

    n = numel(x);
    
    z1 = x(1);
   
    g = 1 + 9 * (sum(x(2 : end)) / (n - 1))^0.25;
    
    z2 = g * (1 - z1 / g);
    
    z = [z1 z2]';
    
    theta = -0.05 * pi; a = 40; 
    
    b = 5; c = 1; d = 6; e = 0;
    
    v = cos(theta) * (z2 - e) - sin(theta) * z1 - ...
        a * abs(sin(b * pi * (sin(theta) * (z2 - e) + cos(theta) * z1)^c))^d;
    
    v = -v;
    
    v = max(v, 0);
    
end