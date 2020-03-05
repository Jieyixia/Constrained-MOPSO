function Position = OBL(Position, VarMax, VarMin)

op = VarMax + VarMin - Position;
mid = (VarMax + VarMin) / 2;
lb = min(op, mid);
ub = max(op, mid);

Position = lb + rand(size(Position)) .* (ub - lb);

end