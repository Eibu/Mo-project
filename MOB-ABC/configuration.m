classdef configuration < handle  
    properties
        population_size
        objectives
        maximum_generation
        pm
        pc
        stop_fn
        evaluation_fn
        local_search
        global_search
        SN%Source food counter
        limit%The number of cycles before saying a source food can't be improved
    end
    
    methods
        function obj = config(pop_size,obj_fn,max_gen,pm,pc, stop_fn)
            obj.population_size = pop_size;
            obj.objectives = obj_fn;
            obj.maximum_generation = max_gen;
            obj.pm = pm;
            obj.pc = pc;
            obj.stop_fn = stop_fn;
        end
    end
end

