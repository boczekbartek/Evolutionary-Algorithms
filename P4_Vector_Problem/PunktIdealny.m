clc;

X = -5:0.5:5;
FitnessFCN = @SchafferFCN;

% Parametry zadani
A = []; B = [];
Aeq = []; beq = [];
lb = -5;
ub = 5;
noncolon = [];
goal = [0, 0];

% Liczenie Frontu Pareto
nf = 2; % number of objective functions
N = length(X); % number of points for plotting
onen = 1/N;
x = zeros(N+1,1);
f = zeros(N+1,nf);
fun = @simple_mult;
x0 = 0.5;
options = optimoptions('fgoalattain','Display','off');
for r = 0:N
    t = onen*r; % 0 through 1
    weight = [t,1-t];
    
    % Algorytm Punktu Idealnego
    [x(r+1,:),f(r+1,:)] = fgoalattain(FitnessFCN,x0,goal,weight,...
        A,B,Aeq,beq,lb,ub,noncolon,options);
end

% Wykres
figure
plot(f(:,1),f(:,2),'k.');

title('Front Pareto dla Algorytmu Punktu Idealnego');
xlabel('x^2')
ylabel('(x-2)^2')



% %plot obstacles
% f1 = X.^2;
% f2 = (X-2).^2;
% 
% plot(X,f1);
% hold on;
% plot(X,f2,'r');
% plot(x,fval(1),'*');
% plot(x,fval(2),'-');
% grid on;
% title('Plot of objectives ''x^2'' and ''(x-2)^2''');
% legend('x^2','(x-2)^2','Wynik optymalizacji');