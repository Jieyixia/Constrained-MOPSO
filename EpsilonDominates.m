function b=EpsilonDominates(x,y, Epsilon)

    cv1 = x.CV;
    cv2 = y.CV;
    
    % if x is feasible and y is infeasible, x dominates y
    if all(cv1 < Epsilon) && any(cv2 > Epsilon)
        b = true;
        return
    end
    
    % if y is feasible and x is infeasible, x does not dominates y
    if all(cv2 < Epsilon) && any(cv1 > Epsilon)
        b = false;
        return
    end
    
    % x and y are both infeasible
    if any(cv1 > Epsilon) && any(cv2 > Epsilon)
        if sum(cv1) < sum(cv2)
            b = true;
        else
            b = false;
        end
        return
    end
    
    % x and y are both feasible 
    b = all(x.Cost<=y.Cost) && any(x.Cost<y.Cost);
    
end