function [result] = ZDT32(x)
%ZDT32 
gx = g(x);
result = gx*(1- sqrt(x(1)/gx) - x(1)/gx * sin(10*pi*x(1)));
end


function result = g(x)
    n= length(x);
    result = 1+9*sum(x(2:n))/(n-1);
end
