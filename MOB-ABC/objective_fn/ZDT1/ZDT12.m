function [result] = ZDT12(x)
%ZDT12
gx = g(x);
result = gx*( 1-sqrt(x(1)/gx) );
end

function result = g(x)
    n= length(x);
    result = 1+9*sum(x(2:n))/(n-1);
end