function [value] = randBounded(lower_bound,upper_bound)
%RANDBOUNDED generates a uniformly randomly generated real between lower
%bound and upper bound
value = lower_bound+rand()*(upper_bound-lower_bound);
end

