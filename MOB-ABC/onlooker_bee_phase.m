function [abc] = onlooker_bee_phase(abc)
%ONLOOKER_BEE_PHASE Simulates the work of the onlooker bees

%Here we select the sources on which the onlookers will work
[~,indexes] = binary_tournament(abc.archive);
%N = length(winners);
a = abc.archive;
N = length(indexes);
tau = abc.config.tau;
bounds = abc.config.problem.bounds;
l = length(bounds(:,1));
for i=1:N
    %Here we pick a neighbour randomly
    k=1;
    if rand()<0.5
        k=-1;
    end
    %the neighbour index is j
    j = mod(indexes(i)+k,N);
    if j==0
        j=mod(j+k,N);
    end
    %Here is created a neighbour food source
    new = source();
    phi = randi([0 1],[1 l]);
    %Degressive weight 
    alpha = (rand([1 l])*2-1);
    x = a(indexes(i)).vars;
    y = a(j).vars;
    %We retrieve the maximal viable gain/loss
    delta_max = min(x-bounds(:,1),bounds(:,2)-x);
    delta_max=delta_max(1,:);
    new.vars = phi.*((1-tau)*x+tau*y)+(~phi).*(x+alpha.*delta_max);
    new.ovs = abc.config.problem.compute(new.vars);
    abc = greedy_selection(abc,new,indexes(i));
end


end

