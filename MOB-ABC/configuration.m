classdef configuration < handle  
    properties
        hive_size;
        problem;
        maximum_generation;
        tau;
    end
    
    methods
        function obj = configuration(hive_size,max_gen,tau)
            obj.hive_size = hive_size;
            obj.maximum_generation = max_gen;
            obj.tau = tau;
        end
        
        
        function p = select_problem(~,pbm)
            if pbm=="FON"
                p= Problem({@FON1 @FON2},repmat([-1/sqrt(3) 1/sqrt(3)],[3 1]),repmat([-4 4],[3 1]));
            end
            if pbm=="SCH"
                p= Problem({@SCH1 @SCH2},[0 2],[-1000 1000]);
            end
            if pbm =="POL"
                p= Problem({@POL1 @POL2},[-pi pi],repmat([-4 4],[2 1]));
            end
            if pbm=="KUR"
                p= Problem({@KUR1 @KUR2},[-5 5],repmat([-4 4],[2 1]));
            end
            if pbm =="ZDT1"
                p = Problem({@ZDT11 @ZDT12},[[0 1];repmat([0 0],[29 1])],repmat([0 1],[30 1]) );
            end
            if pbm=="ZDT2"
                p = Problem({@ZDT11 @ZDT22},[[0 1];repmat([0 0],[29 1])],repmat([0 1],[30 1]) );
            end
            if pbm=="ZDT3"
                p = Problem({@ZDT11 @ZDT32},[[0 1];repmat([0 0],[29 1])],repmat([0 1],[30 1]) );
            end
            if pbm=="ZDT4"
                p = Problem({@ZDT11 @ZDT42},[[0 1];repmat([0 0],[29 1])],[[0 1];repmat([-5 5],[29 1])] );
            end
            if pbm=="ZDT6"
                p = Problem({@ZDT61 @ZDT62},[[0 1];repmat([0 0],[29 1])],repmat([0 1],[30 1]) );
            end
        end
    end
end

