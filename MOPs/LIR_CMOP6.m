function [z, c] = LIR_CMOP6(x)

    n = numel(x);

    J1 = 3 : 2 : n;

    J2 = 2 : 2 : n;

    g1 = sum((x(J1) - sin(0.5 * J1 * pi * x(1) / 30)).^2);

    g2 = sum((x(J2) - cos(0.5 * J2 * pi * x(1) / 30)).^2);
    
    z1 = x(1) + 10 * g1 + 0.7057;
    
    z2 = 1 - x(1)^2 + 10 * g2 + 0.7057;
    
    z = [z1 z2]';
    
    p = [1.8, 2.8]; q = p;

    a = [2, 2]; b = [8, 8];

    r = 0.1; theta = -0.25 * pi;
    
    c = zeros(2, 1);
    
    for i = 1 : 2

        f1 = (z1 - p(i)) * cos(theta) - (z2 - q(i)) * sin(theta);

        f2 = (z1 - p(i)) * sin(theta) + (z2 - q(i)) * cos(theta);
        
        c(i) = f1^2 / a(i)^2 + f2^2 / b(i)^2 - r;
        
    end
   
    c = -c;
    
    c = max(c, 0);
    
end