function [delta] = diversity_metric(population,config)
%DELTA 
N = length(population);
interval = config.problem.optimal_solutions;
u = interval(:,2);
l = interval(:,1);
fns = config.problem.functions;
uov = eval(u,fns);
lov = eval(l,fns);
ovs = (reshape([population.ovs],[2 N]))';
[df,id1] = nearest_dist(uov,ovs); 
[dl,~] = nearest_dist(lov,ovs);
current = ovs(id1,:);
distances = zeros(1,N-1);
i = 1;
while(length(ovs)>1)
    [distances(i),id] = nearest_dist(current,ovs);
    current = ovs(id,:);
    ovs(id,:)=[];
    i = i+1;
end
d_mean = mean(distances);
delta = (df+dl+sum(distances-d_mean))/(df+dl+(N-1)*d_mean);
disp('Diversity measure :');
disp(delta);
end

function [best,idx] = nearest_dist(x,Y)
d =  sqrt(sum(((Y-x).^2)'));
[best,idx] = min(d);
end

function ovs = eval(x,functions)
N = length(functions);
ovs = zeros(1,N);
for i = 1:N
    fi = functions{i};
    ovs(i) = fi(x);
end
end
