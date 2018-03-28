function [result] = ZDT62(x)
%ZDT62 
f1 = ZDT61(x);
gx = g(x);
result = gx*(1-(f1/gx)^2);

end

function result = g(x)
    n= length(x);
    result = 1+9*(sum(x(2:n))/(n-1))^(0.25);
end