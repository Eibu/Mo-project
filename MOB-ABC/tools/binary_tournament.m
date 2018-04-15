function [winners,final_indexes] = binary_tournament(fight_pool)
%BINARY_TOURNAMENT 
N = length(fight_pool);
%final_indexes stores the initial indexes of the sources
final_indexes = 1:N;
perms = randperm(N);
winners(N) = source;
for i=1:N
    if dominates(fight_pool(i),fight_pool(perms(i)))
        winners(i) = fight_pool(i);
    else 
        if dominates(fight_pool(perms(i)),fight_pool(i))
            winners(i)=fight_pool(perms(i));
            final_indexes(i)=perms(i);
        else%If neither dominates, pick one randomly
            if rand()<0.5
                winners(i)=fight_pool(perms(i));
                final_indexes(i)=perms(i);
            else
                winners(i)=fight_pool(i);
            end
        end
    end
end

end