function [abc] = onlooker_bee_phase(abc)
%ONLOOKER_BEE_PHASE Simulates the work of the onlooker bees

%Here we select the sources on which the onlookers will work
[winners,indexes] = binary_tournament(abc.archive);
N = length(winners);
a = abc.archive;
for i=1:N
    %Here we pick a neighbour randomly
    k=1;
    if rand()<0.5
        k=-1;
    end
    %the neighbour index is j
    j = mod(indexes(i)+k,N);
    %Here is created a neighbour food source
    new = source(a(indexes(i)).vars + randBounded(-1,1)*(a(indexes(i)).vars-a(j).vars));
    new.ovs = abc.config.compute(new.vars);
    abc = greedy_selection(abc,new,a(indexes(i)));
end


end

