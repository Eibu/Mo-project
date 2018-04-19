classdef Problem
    %OBJECTIVES_FN Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        functions;
        optimal_solutions;%setup like [-2 2;0 5]
        bounds;
    end
    
    methods
        function obj = Problem(functions, optimal_solutions,bounds)
            obj.functions = functions;
            obj.optimal_solutions = optimal_solutions;
            obj.bounds = bounds;
        end
        
        function obj_vals = compute(obj,variables)
            N = length(obj.functions);
            obj_vals = zeros(1,N);
            for i = 1:N
                fn = obj.functions{i};
                obj_vals(i) = fn(variables);
            end
        end
    end
end

