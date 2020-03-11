function [z, c] = LIR_CMOP2(x)

    n = numel(x);

    J1 = 3 : 2 : n;

    J2 = 2 : 2 : n;

    g1 = sum((x(J1) - sin(0.5 * pi * x(1))).^2);

    g2 = sum((x(J2) - cos(0.5 * pi * x(1))).^2);
    
    z1 = x(1) + g1;
    
    z2 = 1 - sqrt(x(1)) + g2;
    
    z = [z1 z2]';

    g = [g1 g2]';
    
    a = 0.51;
    
    b = 0.5;
    
    c = zeros(2, 1);
    
    for i = 1 : 2
        
        c(i) = (a - g(i)) * (g(i) - b);
        
    end
    
    c = -c;
    
    c = max(c, 0);
    
end