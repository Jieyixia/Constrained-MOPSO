% [CostFunction, nVar, VarMax, VarMin, ~] = Problems('ctp6');
% VarSize = [1 nVar]; 
% n = 1000000;
% flag = zeros(n, 1);
% cost = zeros(2, n);
% cv = flag;
% theta = 0.1*pi;
% e = -2;
% for i = 1 : n
%     
%     pos = unifrnd(VarMin, VarMax, VarSize);
%     [cost(:, i),  cv(i)] = CostFunction(pos);
%     
%     flag(i) = ~(cv(i)>0);
%  
% end
% figure(2)
% plot(cost(1, :), cost(2, :), 'o')
% hold on
% f_cost = cost(:, flag == 1);
% plot(f_cost(1, :), f_cost(2, :), 'o')
% 
% legend('search space', 'feasible')

% n = 20000;
% x = [0.3 * ones(n, 1) linspace(0, 50, n)'];
% cv = zeros(n, 1);
% cost = zeros(n, 2);
% 
% for i = 1 : n
%     [z, v] = test(x(i, :));
%     cost(i, :) = z';
%     cv(i) = v;
% end
% x2 = x(cv == 0, 2);
% f2 = cost(cv == 0, 2);

[X, Y] = meshgrid(0:0.01:1, 0:0.00001:0.01);

n = numel(X);
x = zeros(n, 2);
for i = 1 : n
    x(i, 1) = X(i);
    x(i, 2) = Y(i);
end
cv = zeros(n, 1);
cost = zeros(n, 2);
for i = 1 : n
    [z, v] = test(x(i, :));
    cost(i, :) = z';
    cv(i) = v;
end
% x2 = x(cv == 0, 2);
f = cost(cv == 0, :);
figure
plot(f(:, 1), f(:, 2), '.')
    


function [z, v] = test(x)
    
z1 = x(1);

g = 1 + 9*x(2)^0.25;

z2 = g * (1 - z1 / g);

z = [z1 z2]';

theta = 0.1 * pi; a = 40; 

b = 0.5; c = 1; d = 2; e = -2;

v = cos(theta) * (z2 - e) - sin(theta) * z1 - ...
    a * abs(sin(b * pi * (sin(theta) * (z2 - e) + cos(theta) * z1)^c))^d;

v = -v;

v = max(v, 0);
end
