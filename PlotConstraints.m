function PlotConstraints(pop)
% only draw 2D plot currently

    n = numel(pop);   
    CV = zeros(n, 1);
    for i = 1 : n
        CV(i) = sum(pop(i).CV);
    end
    
    pop_costs=[pop.Cost];
    
    if size(pop_costs, 1) == 2
        idx = CV == 0;
        
        plot(pop_costs(1,idx), pop_costs(2,idx), 'ko');
        hold on;
        
        plot(pop_costs(1, ~idx), pop_costs(2, ~idx), 'b+');
        
        if sum(idx) == 0 
            legend('infeasible')
        else
            if sum(~idx) == 0
                legend('feasible')
            else
                legend('feasible', 'infeasible')
            end
        end
        
       
        xlabel('1^{st} Objective');
        ylabel('2^{nd} Objective');
    end
    hold off;
end