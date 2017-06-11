function [Y] = Schaffer(x)
Y = zeros(2,length(x));
Y(1,:) = x.^2;
Y(2,:) = (x-2).^2;