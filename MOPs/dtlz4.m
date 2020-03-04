function z = dtlz4(x, M)

    z = zeros(M, 1);
    
    g = sum((x(M:end) - 0.5).^2);
    
    for i = 1 : M
        
        t = 1;
        
        for j = 1 : M - i
            
            t = t * cos(x(j)^100 * pi / 2);
            
        end
        
        if i > 1
            
            t = t * sin(x(M - i + 1)^100 * pi / 2);
            
        end

        z(i) = t * (1 + g);
        
    end
    
end
