% plik:  main.m 
% opis:  przyk³adowy skrypt pokazuj¹cy u¿ycie sieci neuronowych w 
%        programie MATLAB
% autor: Zbigniew Szymañski <z.szymanski@ii.pw.edu.pl>
% data:  2013-11-20

clc;        %wyczyszczenie okna komend Matlaba    
clear;      %czyœci pamiêæ Matlaba

% Import danych z pliku tekstowego
dane_tren = importdata('approx_5_train.asc')';
dane_test = importdata('approx_5_test.asc')';

rozm_d_test = length(dane_test);
rozm_d_tren = length(dane_tren);

% Uczenie sieci neuronowej
blad_table=zeros(20,1);
blad_test_table=zeros(20,1);
numer_experymentu = 1;
rezultaty = zeros(20,3);
for i = [1:15 20 25 30 40 50]
    numer_experymentu 
    liczba_neuronow_ukrytych=i;
    [net]=train_net(dane_tren(:,1),dane_tren(:,2),liczba_neuronow_ukrytych);
    output_tren = net(dane_tren(:,1)');
    output_test = net(dane_test(:,1)');
    blad_tren = sum((dane_tren(:,2)'-output_tren).^2)/rozm_d_tren;
    blad_test = sum((dane_test(:,2)'-output_test).^2)/rozm_d_test;
    rezultaty(numer_experymentu,:) = [i,blad_tren, blad_test];
   
    figure
    plot(dane_tren(:,1),dane_tren(:,2),'-',dane_tren(:,1),output_tren')
    title(sprintf('Ilosc neuronow ukrytych: %d na tle danych uczacych',i))
    figure
    nn_output_test = net(dane_test(:,1)');
    plot(dane_test(:,1),dane_test(:,2),'-',dane_test(:,1),output_test')
    title(sprintf('Ilosc neuronow ukrytych: %d na tle danych testujacych',i))
    fprintf('Ilosc neuronow: %d, Blad_ucz: %.8f, Blad_test: %.8f',i,blad_tren,...
    blad_test);
  
    numer_experymentu = numer_experymentu + 1;
end

rezultaty2 = zeros(20,10);
rezultaty2(:,2) = Inf; % bedzie tu wpisywany minimalny blad
for i = 1:20
    liczba_neuronow_ukrytych=4;
    [net]=train_net(dane_tren(:,1),dane_tren(:,2),liczba_neuronow_ukrytych);
    output_tren = net(dane_tren(:,1)');
    blad_tren = sum((dane_tren(:,2)'-output_tren).^2)/rozm_d_tren;
   
    
    % liczenie aktualnie najlepszej sieci
    if min(rezultaty2(:,2)) > blad_tren
        best_net = net;
        iteracja_najlepszej = i;
    end
     
    % zapisywanie wynikow
    rezultaty2(i,:) = [i,blad_tren, net.iw{1,1}', net.lw{2,1}];
end


% wykresy dla najlepszej sieci
output_tren = best_net(dane_tren(:,1)');
output_test = best_net(dane_test(:,1)');
figure
plot(dane_tren(:,1), dane_tren(:,2),dane_tren(:,1), output_tren)
title(sprintf('Optymalna sieæ dla 4 neuronów - dane uczace'))
figure
plot(dane_test(:,1), dane_test(:,2), dane_test(:,1), output_test )
title(sprintf('Optymalna sieæ dla 4 neuronów - dane testujace'))


% wykresy bledow
figure
plot(rezultaty(3:end,1), rezultaty(3:end,2), 'r')
hold on
plot(rezultaty(3:end,1), rezultaty(3:end,3), 'g');
title ('Porownanie b³êdów œredniokwadratowych na zbiorze ucz¹cym oraz trenuj¹cym w zale¿noœci od liczby neuronów')
legend('Blad trenujacy','Blad testujacy');
hold off


