function [abc] = evaluate(abc)
%EVALUATE the sources fitness and sort it by fitness
a = abc.archive;
N = length(a);
nondominated = ones(1,N);
dominationMatrix = zeros(N);
for i=1:N-1
    for j=i+1:N
        if(nondominated(i) && nondominated(j))
            if dominates(a(i),a(j))
                dominationMatrix(i,j)=1;
                nondominated(j)=0;
            else
                if dominates(a(j),a(i))
                    dominationMatrix(j,i)=1;
                    nondominated(i)=0;
                end
            end
        end
    end
end
abc.archive= abc.archive(nondominated==1);
% %The strengths are the number of domination of each source
%strengths = sum(dominationMatrix');
% %the fitness of one is the strength of its dominators divided by its
% %strength plus 1 (division by 0 may appear else)
% fitnesses = (strengths*dominationMatrix)./(strengths+1);
% for i =1:N
%     abc.archive(i).fitness = fitnesses(i);
% end
% [~,order] = sort(fitnesses);
% abc.archive = abc.archive(order);
end

