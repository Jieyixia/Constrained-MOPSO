function z = dtlz7(x, M)

    z = zeros(M, 1);
    
    k = numel(x) - M + 1;
    
    g = 1 + 9 / k * sum(x(M:end));
    
    for i = 1 : M - 1
        
        z(i) = x(i);
        
    end
    
    h = M - sum(z(1 : M - 1) / (1 + g) .* (1 + sin(3 * pi * z(1: M - 1))));
    
    z(M) = (1 + g) * h;
    
end
