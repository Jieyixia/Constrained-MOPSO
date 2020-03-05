function mopso(seed,  func_name,  MaxIt,  It_no)
% Random Seed
rng(seed, 'twister')

% Problem Definition
[CostFunction, nVar, VarMax, VarMin, ~] = Problems(func_name);
VarSize = [1 nVar]; 

% MOPSO Parameters
nPop = 100;    % Population Size
nRep = 100;    % Repository Size

w = 0.5;    % Inertia Weight
wdamp = 0.99;    % Damping Rate

c1 = 1;    % Personal Learning Coefficient
c2 = 2;    % Global Learning Coefficient

nGrid = 50;    % Number of Grids per Dimension

alpha = 0.1;    % Inflation Rate
beta = 2;    % Leader Selection Pressure
gamma = 2;    % Deletion Selection Pressure
mu = 0.4;    % Mutation Rate

% Data Structure
empty_particle.Position = [];
empty_particle.Velocity = [];
empty_particle.Cost = [];
empty_particle.CV = [];    % Constraint Violation
empty_particle.Best.Position = [];
empty_particle.Best.Cost = [];
empty_particle.IsDominated = [];
empty_particle.GridIndex = [];
empty_particle.GridSubIndex = [];
empty_particle.TargetRegionFlag = [];

% Initialization
pop = repmat(empty_particle, nPop, 1);

for i = 1:nPop
    
    pop(i).Position = unifrnd(VarMin, VarMax, VarSize);
    pop(i).Velocity = zeros(VarSize);
    [pop(i).Cost,  pop(i).CV] = CostFunction(pop(i).Position);
        
    % Update Personal Best
    pop(i).Best.Position = pop(i).Position;
    pop(i).Best.Cost = pop(i).Cost;
    pop(i).Best.CV = pop(i).CV;
    
end

% Relax Constraints
Epsilon  =  max([pop.CV],  [],  2);
% Epsilon = 1; 

pop = DetermineDomination(pop,  Epsilon);

rep = pop(~[pop.IsDominated]);

Grid = CreateGrid(rep, nGrid, alpha);

for i = 1:numel(rep)
    rep(i) = FindGridIndex(rep(i), Grid);
end

% Main Loop
for it = 1:MaxIt
    
    disp(['MOPSO-',  func_name,  '-',  num2str(It_no), ': It-',  num2str(it)])
    
    for i = 1:nPop

        leader = SelectLeader(rep, beta);
        
        pop(i).Velocity = w*pop(i).Velocity ...
            +c1*rand(VarSize).*(pop(i).Best.Position-pop(i).Position) ...
            +c2*rand(VarSize).*(leader.Position-pop(i).Position);
        
        pop(i).Position = pop(i).Position + pop(i).Velocity;
        
        % Satisfy Box Constraints
        pop(i).Position = max(pop(i).Position,  VarMin);
        pop(i).Position = min(pop(i).Position,  VarMax);
                
        [pop(i).Cost,  pop(i).CV] = CostFunction(pop(i).Position);
        
        % Apply Mutation
        pm = (1-(it-1)/(MaxIt-1))^(1/mu);
        if rand<pm
            NewSol.Position = Mutate(pop(i).Position, pm, VarMin, VarMax);
            
            % Satisfy Box Constraints
            NewSol.Position = max(NewSol.Position,  VarMin);
            NewSol.Position = min(NewSol.Position,  VarMax);
            
            [NewSol.Cost,  NewSol.CV] = CostFunction(NewSol.Position);
            
            if EpsilonDominates(NewSol, pop(i),  Epsilon)
                pop(i).Position = NewSol.Position;
                pop(i).Cost = NewSol.Cost;
                pop(i).CV = NewSol.CV;

            elseif EpsilonDominates(pop(i), NewSol,  Epsilon)
                % Do Nothing

            else
                if rand<0.5
                    pop(i).Position = NewSol.Position;
                    pop(i).Cost = NewSol.Cost;
                    pop(i).CV = NewSol.CV;
                end
            end
        end
        
        if EpsilonDominates(pop(i), pop(i).Best,  Epsilon)
            pop(i).Best.Position = pop(i).Position;
            pop(i).Best.Cost = pop(i).Cost;
            pop(i).Best.CV = pop(i).CV;
            
        elseif EpsilonDominates(pop(i).Best, pop(i),  Epsilon)
            % Do Nothing
            
        else
            if rand<0.5
                pop(i).Best.Position = pop(i).Position;
                pop(i).Best.Cost = pop(i).Cost;
                pop(i).Best.CV = pop(i).CV;
            end
        end
        
    end
    
    % Opposition-Based Learning Every 10 Generations
    if mod(it,  5) == 0   
        for i = 1 : nPop
            OblSol.Position = OBL(pop(i).Position, VarMin, VarMax);
            [OblSol.Cost, OblSol.CV] = CostFunction(OblSol.Position);
            if EpsilonDominates(OblSol, pop(i), Epsilon)
                pop(i).Position = OblSol.Position;
                pop(i).Cost = OblSol.Cost;
                pop(i).CV = OblSol.CV;
            end
            if EpsilonDominates(pop(i), pop(i).Best, Epsilon)
                pop(i).Best.Position = pop(i).Position;
                pop(i).Best.Cost = pop(i).Cost;
                pop(i).Best.CV = pop(i).CV;
            end
        end
    end
   
    pop = DetermineDomination(pop,  Epsilon); 
    
    % Add Non-Dominated Particles to Repository
    rep = [rep
         pop(~[pop.IsDominated])]; %#ok
    
    % Determine Domination of New Resository Members
    rep = DetermineDomination(rep,  Epsilon);
    
    % Keep only Non-Dminated Members in the Repository
    rep = rep(~[rep.IsDominated]);
    
    % Update Grid
    Grid = CreateGrid(rep, nGrid, alpha);

    % Update Grid Indices
    for i = 1:numel(rep)
        rep(i) = FindGridIndex(rep(i), Grid);
    end
    
    % Check if Repository is Full
    if numel(rep)>nRep
        
        Extra = numel(rep)-nRep;
        for e = 1:Extra
            rep = DeleteOneRepMember(rep, gamma);
        end
        
    end
   
    % plot
    figure(1)
    PlotConstraints(rep);
    hold off;
    pause(0.1)
   
    % Damping Inertia Weight
    w = w*wdamp;
%     Epsilon = Epsilon * 0.93;
    Epsilon  =  Epsilon * (1 - it / 100);
    
end

h  =  figure;
PlotConstraints(rep);
hold off;

path  =  ['figure_20200227/',  'CTP6_wdamp095'];
if ~exist(path, 'dir')
    mkdir(path);
end

filename  =  [path,  '/',  func_name,  '-',  num2str(It_no)];
saveas(h,  filename,  'png');
end

