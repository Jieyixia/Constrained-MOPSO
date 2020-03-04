function [z, c] = CTP1(x)

    n = numel(x);
    
    z1 = x(1);
   
    g = 1 + 9 * (sum(x(2 : end)) / (n - 1))^0.25;
    
    z2 = g * exp(-z1/g);
    
    z = [z1 z2]';
    
    a = [0.858 0.728];
    
    b = [0.541 0.295];
    
    c = zeros(2, 1);
    
    for i = 1 : 2
        
        c(i) = z2 - a(i) * exp(-b(i) * z1);
        
    end
    
    c = -c;
    
    c = max(c, 0);
    
end