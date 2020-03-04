function Position = OBL(Position, VarMax, VarMin)

mid = (VarMax + VarMin) / 2;
lb = min(Position, mid);
ub = max(Position, mid);

Position = lb + rand(size(Position)) .* (ub - lb);

end