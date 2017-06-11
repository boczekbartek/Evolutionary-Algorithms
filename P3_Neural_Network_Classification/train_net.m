function [net]= train_net(train_set,labels,hidden_neurons_count)
    %Opis: funkcja tworz�ca i ucz�ca sie� neuronow�
    %Parametry:
    %   train_set: zbi�r ucz�cy - kolejne punkty w kolejnych wierszach
    %   labels:    etykiety punkt�w - {-1,1}
    %   hidden_neurons_count: liczba neuron�w w warstwie ukrytej
    %Warto�� zwracana:
    %   net - obiekt reprezentuj�cy sie� neuronow�

    %inicjalizacja obiektu reprezentuj�cego sie� neuronow�
    %funkcja aktywacji: neuron�w z warstwy ukrytej - tangens hiperboliczny,
    %                   neuronu wyj�ciowego - liniowa
    %funkcja ucz�ca:   Levenberga-Marquardta 
    net=newff(train_set',labels',hidden_neurons_count,...
              {'tansig', 'purelin'},'trainlm');
          
    rand('state',sum(100*clock));           %inicjalizacja generatora liczb 
                                            %pseudolosowych
 	net=init(net);                          %inicjalizacja wag sieci
    net.lw{2,1} = (rand(1,hidden_neurons_count)-0.5)*0.3;
    net.trainParam.goal = 0.00001;          %warunek stopu - poziom b��du
    net.trainParam.epochs = 200;            %maksymalna liczba epok
    net.trainParam.showWindow = true;      %nie pokazywa� okna z wykresami
                                 %w trakcie uczenia
    net.trainParam.min_grad = 1e-15;
    net=trainlm(net,train_set',labels');      %uczenie sieci
    