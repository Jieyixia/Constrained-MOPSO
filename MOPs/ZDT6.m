function z = ZDT6(x)

    n = numel(x);
    
    z1 = 1 - exp(-4 * x(1)) * sin(6 * pi * x(1))^6;
    
    g = 1 + 9 * (sum(x(2 : end)) / (n - 1))^0.25;
    
    z2 = g * (1 - (z1 / g)^2);
    
    z = [z1 z2]';
    
end