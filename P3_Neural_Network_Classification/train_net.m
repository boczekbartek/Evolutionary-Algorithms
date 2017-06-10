function [net]= train_net(train_set,labels,hidden_neurons_count)
    %Opis: funkcja tworz¹ca i ucz¹ca sieæ neuronow¹
    %Parametry:
    %   train_set: zbiór ucz¹cy - kolejne punkty w kolejnych wierszach
    %   labels:    etykiety punktów - {-1,1}
    %   hidden_neurons_count: liczba neuronów w warstwie ukrytej
    %Wartoœæ zwracana:
    %   net - obiekt reprezentuj¹cy sieæ neuronow¹

    %inicjalizacja obiektu reprezentuj¹cego sieæ neuronow¹
    %funkcja aktywacji: neuronów z warstwy ukrytej - tangens hiperboliczny,
    %                   neuronu wyjœciowego - liniowa
    %funkcja ucz¹ca:   Levenberga-Marquardta 
    net=newff(train_set',labels',hidden_neurons_count,...
              {'tansig', 'purelin'},'trainlm');
          
    rand('state',sum(100*clock));           %inicjalizacja generatora liczb 
                                            %pseudolosowych
 	net=init(net);                          %inicjalizacja wag sieci
    net.lw{2,1} = (rand(1,hidden_neurons_count)-0.5)*0.3;
    net.trainParam.goal = 0.00001;          %warunek stopu - poziom b³êdu
    net.trainParam.epochs = 200;            %maksymalna liczba epok
    net.trainParam.showWindow = true;      %nie pokazywaæ okna z wykresami
                                 %w trakcie uczenia
    net.trainParam.min_grad = 1e-15;
    net=trainlm(net,train_set',labels');      %uczenie sieci
    