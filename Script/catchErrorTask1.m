%% Catch Error per risultati Task 1
run '.\Task 1\caricamento_casi_test_Task1.m';
load '.\Task 1\Task 1.mat';
run '.\Task 1\script_Task_1.m';
%Aggiunta Predizioni Task 1 alla Tabella dei risultati
risultati = [casiTestTask1 responseTask1];
clearvars -except risultati DatasetTask1;
