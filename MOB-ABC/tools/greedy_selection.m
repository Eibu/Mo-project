function [abc] = greedy_selection(abc,v,x)
%GREEDY_SELECTION Applies a greed selection on s1 and s2, and updates the
%archive depeding on the result
if dominates(x,v)
    %Nothing to do
else
    abc.archive = [abc.archive v];
    if dominates(v,x)
    x.dominated = 1;
    abc.archive(abc.archive==x).increaseTrialCounter;
    else
        if rand()<0.5
            abc.archive(abc.archive==x)=v;
        else
            abc.archive(abc.archive==x).increaseTrialCounter;
        end
    end
end
end

