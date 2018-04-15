classdef configuration < handle  
    properties
        hive_size
        problem;
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
        function obj = config(hive_size,pbm,max_gen,pm,pc, stop_fn)
            obj.hive_size = hive_size;
            obj.problem = select_problem(pbm);
            obj.maximum_generation = max_gen;
            obj.pm = pm;
            obj.pc = pc;
            obj.stop_fn = stop_fn;
        end
        
        
        function p =select_problem(pbm)
            if pbm=="FON"
                p= Problem({@FON1 @FON2},repmat([-1/sqrt(3) 1/sqrt(3)],[3 1]),repmat([-4 4],[3 1]));
            end
            if pbm=="SCH"
                p= Problem({@SCH1 @SCH2},[0 2],[-1000 1000]);
            end
            if pbm =="POL"
                p= Problem({@POL1 @POL2},[-pi pi0],repmat([-4 4],[2 1]));
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

