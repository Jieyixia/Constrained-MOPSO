function z = dtlz1(x, M)
    n = numel(x);
    k = n - M + 1;
    z = zeros(M, 1);
    g = 100 * (k + sum((x(M:end) - 0.5).^2 - cos(20 * pi * (x(M:end) - 0.5))));
    for i = 1 : M
        t = 1;
        for j = 1 : M - i
            t = t * x(j);
        end

        if i > 1
            t = t * (1 - x(M - i + 1));
        end
        z(i) = 0.5 * t * (1 + g);
    end
end
