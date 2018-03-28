function [result] = FON1(x)
%FON1 
result = 0;
N = length(x);
for i = 1:N
    result = result + (x(i) - 1/sqrt(3))^2;
end
result = 1-exp(-result);
end

