% Random Seed
load seed.mat
func = {'zdt1', 'zdt2', 'zdt3', 'zdt4', 'zdt6',...
         'dtlz1', 'dtlz2', 'dtlz3', 'dtlz4', 'dtlz7',...
         'osy', 'ctp1', 'ctp2', 'ctp3', 'ctp4', 'ctp5',...
         'ctp6', 'ctp7'};

for MaxIt = 300 : 100 : 600

for func_no = 17
    
    func_name = func{func_no}; 

    parfor i = 1 : 30
        mopso(seed(i), func{func_no}, MaxIt, i);
    end
    
end
end

