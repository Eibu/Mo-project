function sources = generateFoodSources(config,size)
%GENERATEFOODSOURCES Generates "size" food sources using the problem
%
sources(size)=source;
for i=1:size
    sources(i)=source(generateVariables(config));
    sources(i).ovs = config.problem.compute(sources(i).vars);
end

end

function vars = generateVariables(config)
bounds = config.problem.bounds;
N = length(bounds);
vars = zeros(1,N);
for i =1:N
    vars(i)=randBounded(bounds(i,1),bounds(i,2));
end
end