function [z, c] = LIR_CMOP13(x)

    n = numel(x);

    J = 3 : n;

    g = 10 * sum((x(J) - 0.5).^2);
    
    z1 = (1.7057 + g) * cos(0.5 * pi * x(1)) * cos(0.5 * pi * x(2));
    
    z2 = (1.7057 + g) * cos(0.5 * pi * x(1)) * sin(0.5 * pi * x(2));

    z3 = (1.7057 + g) * sin(0.5 * pi * x(1));
    
    z = [z1 z2 z3]';
    
    t = sum(z.^2);
    
    c = zeros(2, 1);

    c(1) = (t - 9) * (t - 4);

    c(2) = (t - 3.61) * (t - 3.24);

    c = -c;
    
    c = max(c, 0);
    
end