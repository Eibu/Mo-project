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
    end
    
    methods
        function obj = abc_algorithm(config)
            %ABC_ALGORITHM Construct an instance of this class
            obj.config = config;
            obj.generation = 0;
            obj.hive_size = config.hive_size;
            obj.employed_bee_count = obj.hive_size/2;
            obj.archive = generateFoodSources(config,obj.employed_bee_count);
            obj.onlooker_bee_count = obj.hive_size-obj.employed_bee_count;
            obj.stop = 0;
        end
        
        function obj = run(obj)
            while(~obj.stop)
                obj = obj.employed_bees_phase();
                obj = obj.onlooker_bees_phase();
                obj = obj.update_archive();
                obj = obj.stop_criterion();
            end
            %obj = evaluate(obj);
        end
        
        
        function obj = employed_bees_phase(obj)
            obj = employed_bee_phase(obj);
        end
        
        function obj = onlooker_bees_phase(obj)
            obj = onlooker_bee_phase(obj);
        end
        
        function obj= update_archive(obj)
            %obj = evaluate(obj);
            if length(obj.archive)>obj.employed_bee_count
                obj = archive_truncature(obj);
            end
        end
        
        function obj = stop_criterion(obj)
            obj.generation = obj.generation +1;
            if(obj.generation>=obj.config.maximum_generation)
                obj.stop = 1;
            end
            disp("GENERATION")
            disp(obj.generation);
        end
    end
end

