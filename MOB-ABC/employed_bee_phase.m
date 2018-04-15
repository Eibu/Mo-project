function [abc] = employed_bee_phase(abc)
%EMPLOYED_BEE_PHASE simulates the work of an employed bee
a = abc.archive;
N = length(a);
for i = 1:N
    %Here we pick a neighbour randomly
    k=1;
    if rand()<0.5
        k=-1;
    end
    %the neighbour index is j
    j = mod(i+k,N);
    %Here is created a neighbour food source
    new = source(a(i).vars + randBounded(-1,1)*(a(i).vars-a(j).vars));
    new.ovs = abc.config.compute(new.vars);
    abc = greedy_selection(abc,new,a(i));
end
end
