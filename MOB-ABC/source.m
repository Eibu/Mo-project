classdef source
    %SOURCE A source food 
    
    
    properties
        vars;
        ovs;%Objective values of this source
        fitness;
        trial_counter;%Conter of stagnation of the food source
        dominated;%boolean
    end
    
    methods
        
        function obj = source(vars)
            obj.vars = vars;
            obj.trial_counter =0;
        end
        
        function obj = increaseTrialCounter(obj)
            obj.trial_counter = obj.trial_counter+1;
        end
        
        function obj = resetTrialCounter(obj)
            obj.trial_counter = 0;
        end
    end
end

