classdef genetic_algorithm
    %GENETIC_ALGORITHM 
    properties
        population;
        config;
        stop;
    end
    
    methods
        function obj = genetic_algorithm(config)
            obj.config = config;
            obj.population = generate_Population(config);
        end
        
        function obj = run(obj)
            %RUN Main loop of the genetic algorithm
            pop = obj.population;
            while ~stopCriterion(obj,pop)
               pop = obj.localSearch(obj,pop);
               pop = obj.globalSeach(obj,pop);
            end
        end
    end
    
    methods (Access = private)
        function boolean = stopCriterion(obj,population)
            boolean = obj.config.stop_fn(obj,population);
        end
        
        function population = evaluate(obj,population)
            population = obj.config.evaluation(obj.config, population);
        end
        
        function population = localSearch(obj,population)
            population = obj.cofig.local_search(obj.config,population);
            population = obj.evaluate(obj.config,population);
        end
        
        function population = globalSeach(obj, population)
            population = obj.config.global_seach(obj.config,population);
            population = obj.evaluate(obj.config,population);
        end
        
        function population = generate_Population(config)
            population(config.SN)= individual;
            for i = 1:SN
                population(i).variables = 
            end
        end
    end
end

