
A = []; B = [];
Aeq = []; beq = [];
lb = -5;
ub = 5;
noncolon = [];
goal = [0, 0];

N = 17;
x = zeros(N+1,1);
f = zeros(N+1,nf);

options = optimoptions('fgoalattain');
% Algorytm Multistart
for r = 0:N
    x0=(rand(1,1)-0.5)*10;
    weight = [rand(1), rand(1)];
    
    
    [x(r+1,:),f(r+1,:)] = fgoalattain(@Schaffer,x0,goal,weight,...
        A,B,Aeq,beq,lb,ub,noncolon,options);
end

x
f(:,1)
f(:,2)

figure
plot(f(:,1),f(:,2),'k.');
title('Front Pareto dla Algorytmu Multistart');
xlabel('x^2')
ylabel('(x-2)^2')
