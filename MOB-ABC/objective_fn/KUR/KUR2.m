function [result] = KUR2(x)
%KUR2 
y = abs(x).^0.8 + 5 *sin(x).^3;
result = sum(y);
end

