function [result] = ZDT42(x)
%ZDT42 
gx = g(x);
result = gx*(1-sqrt(x(1)/gx));
end

function result = g(x)
N = length(x);
result = 1+10*(N-1)+sum(x(2:N).^2 - 10*cos(4*pi*x(2:N)));
end