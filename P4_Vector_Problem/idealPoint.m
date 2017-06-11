A = []; B = [];
Aeq = []; beq = [];
lb = -5;
ub = 5;
noncolon = [];
goal = [0, 0];
N = 17;
a = 1/N;
x = zeros(N+1,1);
f = zeros(N+1,2);
x0 = 0.5;

options = optimoptions('fgoalattain');
% Algorytm Punktu Idealnego
for r = 0:N
    t = a*r;
    weight = [t,1-t];
   
    [x(r+1,:),f(r+1,:)] = fgoalattain(@Schaffer,x0,goal,weight,...
        A,B,Aeq,beq,lb,ub,noncolon,options);
end

x
f(:,1)
f(:,2)


figure
plot(f(:,1),f(:,2),'k.');
title('Front Pareto dla Algorytmu Punktu Idealnego');
xlabel('x^2')
ylabel('(x-2)^2')
