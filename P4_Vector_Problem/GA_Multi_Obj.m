 clc;


%Basic options
FitnessFCN = @SchafferFCN;
numOfVar = 1;

% Constraints
A = []; b = [];
Aeq = []; beq = [];
lb = -5;
ub = 5;

%Calculation
options = optimoptions(@gamultiobj);
[y,fval,EXITFLAG] = gamultiobj(FitnessFCN,numOfVar,A,b,Aeq,beq,lb,ub,options);


% Wykres
figure
plot(fval(:,1),fval(:,2),'k.');

title('Front Pareto dla GA Muliti Objective');
xlabel('x^2')
ylabel('(x-2)^2')
