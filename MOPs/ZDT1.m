function z = ZDT1(x)

    n = numel(x);
    
    z1 = x(1);
    
    g = 1 + 9 * sum(x(2 : end)) / (n - 1);
    
    z2 = g * (1 - sqrt(x(1) / g));
    
    
    z = [z1 z2]';
    
end