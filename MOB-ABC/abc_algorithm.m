classdef abc_algorithm
    %ABC_ALGORITHM 
    
    properties
        hive_size;
        employed_bee_count;
        onlooker_bee_count;
        archive;
        config;
        stop;
        generation;
        trial_limit;
    end
    
    methods
        function obj = abc_algorithm(config)
            %ABC_ALGORITHM Construct an instance of this class
            obj.config = config;
            obj.hive_size = config.hive_size;
            obj.trial_limit = config.hive_size*length(config.problem.bounds)/(length(config.problem.functions)+1);
            obj.employed_bee_count = obj.hive_size/2;
            obj.archive = generateFoodSources(config,obj.employed_bee_count);
            obj.onlooker_bee_count = obj.hive_size-obj.employed_bee_count;
            obj.archive(obj.employed_bee_count) = sources;
            obj.stop = 0;
        end
        
        function obj = run(obj)
            while(~obj.stop)
                obj = obj.employed_bees_phase(obj);
                obj = obj.onlooker_bees_phase(obj);
                obj.archive = obj.update_archive(obj);
                obj = obj.stop_criterion(obj);
            end
        end
        
        
        function obj = employed_bees_phase(obj)
            obj = employed_bee_phase(obj);
        end
        
        function obj = onlooker_bees_phase(obj)
            obj = onlooker_bee_phase(obj);
        end
        
        function archive = update_archive(obj)
            obj = evaluate(obj);
            %TODO truncature
            archive = obj.archive;
        end
        
        function obj = stop_criterion(obj)
            obj.generation = obj.generation +1;
            if(obj.generation>=obj.config.maximum_generation)
                obj.stop = 1;
            end
        end
    end
end

