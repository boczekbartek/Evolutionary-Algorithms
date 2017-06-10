function Y = SchafferFCN(x)

% Initialize for two objectives 
Y = zeros(2,length(x));

% Compute first objective
Y(1,:) = x.^2;

% Compute second objective
Y(2,:) = (x-2).^2;