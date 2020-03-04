function [CostFunction, nVar, VarMax, VarMin, true_pf] = Problems(func_name)
% Set Current Path
userpath('C:\Users\lizix\Seafile\Constrained-MOPSO\MOPs') 

% Load True Pareto Front
load('TruePF.mat', 'ZDT_PF', 'DTLZ_PF')
load('true_pf.mat', 'true_pf')

% Problem Definition
switch func_name
    case 'sch'
        CostFunction = @(x)SCH(x);
        nVar = 1; 
        VarMax = 1000;
        VarMin = -1000;      
        true_pf = true_pf{1};
        
    case 'fon'
        CostFunction = @(x)FON(x);
        nVar = 3; 
        VarMax = ones(1,  nVar) * 4;
        VarMin = ones(1,  nVar) * (-4);
        true_pf = true_pf{2};
        
    case 'zdt1'
        CostFunction = @(x)ZDT1(x);
        nVar = 30; 
        VarMax = ones(1,  nVar);
        VarMin = zeros(1,  nVar);      
        true_pf = ZDT_PF{1};
        
    case 'zdt2'
        CostFunction = @(x)ZDT2(x);
        nVar = 30; 
        VarMax = ones(1,  nVar);
        VarMin = zeros(1,  nVar);    
        true_pf = ZDT_PF{2};
        
    case 'zdt3'
        CostFunction = @(x)ZDT3(x);
        nVar = 30; 
        VarMax = ones(1,  nVar);
        VarMin = zeros(1,  nVar);     
        true_pf = ZDT_PF{3};
        
    case 'zdt4'
        CostFunction = @(x)ZDT4(x);
        nVar = 10; 
        VarMax = [1 ones(1,  nVar - 1) * 5];
        VarMin = [0 ones(1,  nVar - 1) * (-5)];  
        true_pf = ZDT_PF{4};
        
    case 'zdt6'
        CostFunction = @(x)ZDT6(x);
        nVar = 10; 
        VarMax = ones(1,  nVar);
        VarMin = zeros(1,  nVar);    
        true_pf = ZDT_PF{6};
        
    case 'dtlz1'
        CostFunction = @(x)dtlz1(x, 3);
        nVar = 10;
        VarMax = ones(1, nVar);
        VarMin = zeros(1, nVar);
        true_pf = DTLZ_PF{1};
        
    case 'dtlz2'
        CostFunction = @(x)dtlz2(x, 3);
        nVar = 10;
        VarMax = ones(1, nVar);
        VarMin = zeros(1, nVar);
        true_pf = DTLZ_PF{2};
        
    case 'dtlz3'
        CostFunction = @(x)dtlz3(x, 3);
        nVar = 10;
        VarMax = ones(1, nVar);
        VarMin = zeros(1, nVar);
        true_pf = DTLZ_PF{3};
        
    case 'dtlz4'
        CostFunction = @(x)dtlz4(x, 3);
        nVar = 10;
        VarMax = ones(1, nVar);
        VarMin = zeros(1, nVar);
        true_pf = DTLZ_PF{4};

    case 'dtlz5'
        CostFunction = @(x)dtlz5(x, 3);
        nVar = 10;
        VarMax = ones(1, nVar);
        VarMin = zeros(1, nVar);
        true_pf = DTLZ_PF{5};
        
    case 'dtlz6'
        CostFunction = @(x)dtlz6(x, 3);
        nVar = 10;
        VarMax = ones(1, nVar);
        VarMin = zeros(1, nVar);
        true_pf = DTLZ_PF{6};

    case 'dtlz7'
        CostFunction = @(x)dtlz7(x, 3);
        nVar = 10;
        VarMax = ones(1, nVar);
        VarMin = zeros(1, nVar);
        true_pf = DTLZ_PF{7};
        
    case 'osy'
        CostFunction = @(x)OSY(x);
        nVar = 6; 
        VarMax = [10, 10, 5, 6, 5, 10];
        VarMin = [0, 0, 1, 0, 1, 0];      
        true_pf = [];
        
    case 'ctp1'
        CostFunction = @(x)CTP1(x);
        nVar = 30; 
        VarMax = ones(1,  nVar);
        VarMin = zeros(1,  nVar);
        true_pf = [];
        
    case 'ctp2'
        CostFunction = @(x)CTP2(x);
        nVar = 30; 
        VarMax = ones(1,  nVar);
        VarMin = zeros(1,  nVar);
        true_pf = [];

    case 'ctp3'
        CostFunction = @(x)CTP3(x);
        nVar = 30; 
        VarMax = ones(1,  nVar);
        VarMin = zeros(1,  nVar);
        true_pf = [];
        
    case 'ctp4'
        CostFunction = @(x)CTP4(x);
        nVar = 30; 
        VarMax = ones(1,  nVar);
        VarMin = zeros(1,  nVar);
        true_pf = [];

    case 'ctp5'
        CostFunction = @(x)CTP5(x);
        nVar = 30; 
        VarMax = ones(1,  nVar);
        VarMin = zeros(1,  nVar);
        true_pf = [];
        
    case 'ctp6'
        CostFunction = @(x)CTP6(x);
        nVar = 30; 
        VarMax = ones(1,  nVar);
        VarMin = zeros(1,  nVar);
        true_pf = [];

    case 'ctp7'
        CostFunction = @(x)CTP7(x);
        nVar = 30; 
        VarMax = ones(1,  nVar);
        VarMin = zeros(1,  nVar);
        true_pf = [];
        
end
end

