function [z, c] = LIR_CMOP9(x)

    n = numel(x);

    J1 = 3 : 2 : n;

    J2 = 2 : 2 : n;

    g1 = sum((x(J1) - sin(0.5 * J1 * pi * x(1) / 30)).^2);

    g2 = sum((x(J2) - cos(0.5 * J2 * pi * x(1) / 30)).^2);
    
    z1 = 1.7057 * x(1) * (10 ∗ g1 + 1);
    
    z2 = 1.7057 * (1 − x(1)^2) * (10 ∗ g2 + 1);
    
    z = [z1 z2]';
    
    p = 1.4; q = p;

    a = 1.5; b = 6;

    r = 0.1; theta = -0.25 * pi; alpha = 0.25 * pi;
    
    c = zeros(2, 1);
    
    f1 = (z1 - p) * cos(theta) - (z2 - q) * sin(theta);

    f2 = (z1 - p) * sin(theta) + (z2 - q) * cos(theta);

    c(1) = f1^2 / a^2 + f2^2 / b^2 - r;

    t1 = z1 * sin(alpha) + z2 * cos(alpha);

    t2 = z1 * cos(alpha) - z2 * sin(alpha);

    c(2) = t1 - sin(4 * pi * t2) - 2;

    c = -c;
    
    c = max(c, 0);
    
end