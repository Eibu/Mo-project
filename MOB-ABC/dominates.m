% Do indiv1 dominates indiv2 according to objective values and not the
% rank?
function boolean = dominates(indiv1, indiv2)
    b1 = (sum(indiv1.objectiveValues <= indiv2.objectiveValues) >= length(indiv1.objectiveValues));
    if b1
        b2 = (sum(indiv1.objectiveValues < indiv2.objectiveValues) >= 1);
        boolean = b1&&b2;
    else
        boolean = b1;
    end
end

