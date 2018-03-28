function [gamma] = gamma_metric(population, config, H)
%GAMMA_METRIC 
N = length(population);
population = evaluate_obj_val(population,config.objectives.functions);
ovs = reshape([population.objectiveValues],[2 N])';
segments = segment(config,H);
distances = zeros(1,N);
for i = 1:N
    distances(i) = nearest_dist(ovs(i,:),segments);
    
end
gamma = mean(distances);
disp("Convergence measure : ");
disp(gamma);
end

function best = nearest_dist(x,Y)
    df =  min((Y-x).^2);
    best = sqrt(sum(df));
end


function segments = segment(config,H)

interval = config.objectives.optimal_solutions;
f1 = config.objectives.functions{1};
f2 = config.objectives.functions{2};
N = length(interval(:,1));
X = zeros(H,N);
for n = 1:N
    u =interval(n,2);
    l =interval(n,1);
    if(l~=u)
        X(:,n) = l:(u-l)/(H-1):u;
    else
        X(:,n) = repelem(u,H);
    end
end
sizeX = length(X);
segments = zeros(sizeX,2);
for i = 1:sizeX
    segments(i,1) = f1(X(i,:));
    segments(i,2) = f2(X(i,:));
end
end