function [abc] = evaluate(abc)
%EVALUATE the sources fitness and sort it by fitness
a = abc.archive;
N = length(a);
dominationMatrix = zeros(N);
for i=1:N-1
    for j=i+1:N
        if dominates(a(i),a(j))
            dominationMatrix(i,j)=1;
        else
            if dominates(a(j),a(i))
                dominationMatrix(j,i)=1;
            end
        end
    end
end
%The strengths are the number of domination of each source
strengths = sum(dominationMatrix');
%the fitness of one is the strength of its dominators divided by its
%strength plus 1 (division by 0 may appear else)
fitnesses = (strengths*dominationMatrix)./(strengths+1);
for i =1:N
    abc.archive(i).fitness = fitnesses(i);
end
[~,order] = sort(fitnesses);
abc.archive = abc.archive(order);
end

