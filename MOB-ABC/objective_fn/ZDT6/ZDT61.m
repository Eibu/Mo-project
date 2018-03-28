function [result] = ZDT61(x)
%ZDT61 
x1 = x(1);
result = 1-exp(-4*x1)*(sin(6*pi*x1))^6;
end

