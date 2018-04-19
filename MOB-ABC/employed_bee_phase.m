function [abc] = employed_bee_phase(abc)
%EMPLOYED_BEE_PHASE simulates the work of an employed bee
a = abc.archive;
N = length(a);
bounds = abc.config.problem.bounds;
l = length(bounds(:,1));
for i = 1:N
    %Here is created a neighbour food source
    new = source();
    phi = randi([0 1],[1 l]);
    alpha = (rand([1 l])*2-1);%(1-abc.generation/abc.config.maximum_generation).*(rand([1 l])*2-1);
    x = a(i).vars;
    %We retrieve the maximal viable gain/loss
    delta_max = min(x-bounds(:,1),bounds(:,2)-x);
    delta_max=delta_max(1,:);
    new.vars = x+(phi).*(alpha.*delta_max);%phi.*((2*x+y)/3)+(~phi).*x;%
    new.ovs = abc.config.problem.compute(new.vars);
    abc = greedy_selection(abc,new,i);
end
end
