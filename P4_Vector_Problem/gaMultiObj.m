A = []; b = [];
Aeq = []; beq = [];
lb = -5;
ub = 5;

options = optimoptions(@gamultiobj);
[y,fval,EXITFLAG] = gamultiobj(@Schaffer,1,A,b,Aeq,beq,lb,ub,options);

y
fval(:,1)
fval(:,2)

figure
plot(fval(:,1),fval(:,2),'k.');
title('Front Pareto dla GA Muliti Objective');
xlabel('x^2')
ylabel('(x-2)^2')
