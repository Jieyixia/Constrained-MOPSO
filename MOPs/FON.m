function z = FON(x)

    
    z1 = 1 - exp(-sum((x - 1 / sqrt(3)).^2));
    
    z2 = 1 - exp(-sum((x + 1 / sqrt(3)).^2));
    
    z = [z1 z2]';
    
end