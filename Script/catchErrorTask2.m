%% Catch Error per risultati Task 2

run '.\catchErrorTask1.m';
run '.\Task 2\caricamento_casi_test_Task2.m';
load '.\Task 2\Task 2.mat';
run '.\Task 2\script_Task_2.m';
%Aggiunta Predizioni Task 2 alla Tabella dei risultati
run '.\Task 2\aggiunta_risultati_Task2.m';
clearvars -except risultati DatasetTask2;