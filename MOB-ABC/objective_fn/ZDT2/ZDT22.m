function [result] = ZDT22(x)
%ZDT22 
gx = g(x);
result = gx*(1-(x(1)/gx)^2);
end
function result = g(x)
    n= length(x);
    result = 1+9*sum(x(2:n))/(n-1);
end
