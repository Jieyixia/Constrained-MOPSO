function Position = OBL(Position, VarMax, VarMin)

op = VarMax + VarMin - Position;
mid = (VarMax + VarMin) / 2;
% lb = min(op, mid);
% ub = max(op, mid);
% 
% Position = lb + rand(size(Position)) .* (ub - lb);

% super opposite-based learning
flag = op >= mid;
lb = op(flag);
Position(flag) = lb + rand(1, sum(flag)) .* (VarMax(flag) - lb);

ub = op(~flag);
Position(~flag) = VarMin(~flag) + rand(1, sum(~flag)) .* (ub - VarMin(~flag));

end