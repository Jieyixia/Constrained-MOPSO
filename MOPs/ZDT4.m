function z = ZDT4(x)

    n = numel(x);
    
    z1 = x(1);
    
    g = 1 + 10 * (n - 1) + sum(x(2 : end) .^ 2 - 10 * cos(4 * pi * x(2 : end)));
    
    z2 = g * (1 - sqrt(x(1) / g));
    
    z = [z1 z2]';
    
end