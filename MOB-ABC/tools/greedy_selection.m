function [abc] = greedy_selection(abc,v,x_idx)
%GREEDY_SELECTION Applies a greed selection on s1 and s2, and updates the
%archive depeding on the result
if ~dominates(abc.archive(x_idx),v)
    abc.archive = [abc.archive v];
    if dominates(v,abc.archive(x_idx))
    abc.archive(x_idx).increaseTrialCounter;
    else
         if rand()<0.5
             abc.archive(x_idx)=v;
         else
             abc.archive(x_idx).increaseTrialCounter;
         end
    end
end
end

