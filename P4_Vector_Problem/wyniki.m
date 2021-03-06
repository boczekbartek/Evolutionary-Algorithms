x = [    0.0001
    0.0611
    0.1378
    0.2450
    0.2970
    0.4858
    0.5864
    0.7256
    0.8020
    0.8955
    0.9687
    1.0666
    1.0670
    1.1810
    1.2565
    1.4626
    2.0000
    2.0000
]

fval= ones(18,2);
fval(:,1) = [    0.0000
    0.0037
    0.0190
    0.0600
    0.0882
    0.2360
    0.3439
    0.5264
    0.6432
    0.8020
    0.9383
    1.1375
    1.1384
    1.3948
    1.5789
    2.1391
   4.0001
    4.0001
]

fval(:,2) = [    3.9998
    3.7594
    3.4679
    3.0800
    2.9001
    2.2929
    1.9983
    1.6242
    1.4352
    1.2199
    1.0637
    0.8713
    0.8706
    0.6708
    0.5527
    0.2888
    0.0000
    0.0000
]




X = -2:0.1:2

f1 = X.^2;
f2 = (X-2).^2;

plot(X,f1);
hold on;
plot(X,f2,'r');
plot(x,fval(:,1),'*');
plot(x,fval(:,2),'O');
grid on;
title('Ga multi objective ''x^2'' and ''(x-2)^2''');
legend('x^2','(x-2)^2','f_1(x)', 'f_2(x)');

