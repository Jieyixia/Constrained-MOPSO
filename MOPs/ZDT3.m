function z = ZDT3(x)

    n = numel(x);
    
    z1 = x(1);
    
    g = 1 + 9 * sum(x(2 : end)) / (n - 1);
    
    z2 = g * (1 - sqrt(x(1) / g) - x(1) / g * sin(10 * pi * x(1)));
    
    z = [z1 z2]';
    
end