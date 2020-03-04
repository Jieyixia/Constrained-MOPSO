function z = dtlz5(x, M)

    z = zeros(M, 1);
    
    g = sum((x(M:end) - 0.5).^2);
    
    theta = zeros(M - 1, 1); 
    
    for i = 1 : M - 1
        
        theta(i) = pi / (4 * (1 + g)) * (1 + 2 * g * x(i));
        
    end
    
    for i = 1 : M
        
        t = 1;
         
        for j = 1 : M - i
            
            t = t * cos(theta(j) * pi / 2);
            
        end
        
        if i > 1
            
            t = t * sin(theta(M - i + 1) * pi / 2);
            
        end

        z(i) = t * (1 + g);
        
    end
    
end
