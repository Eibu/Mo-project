function [result] = KUR1(x)
%KUR1 
result = 0;
N = length(x);
for i = 1:N-1
    result = result -10*exp(-0.2*sqrt(x(i)^2 + x(i+1)^2));
end
end

