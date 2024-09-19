clear;
%% NOTA: Posizionarsi all'interno della cartella "Consegna"
%Task1
run '.\caricamento_casi_training_Task1.m';
run '.\Task 1\caricamento_casi_test_Task1.m';
load '.\Task 1\Task 1.mat';
run '.\Task 1\script_Task_1.m';

%Aggiunta Predizioni Task 1 alla Tabella dei risultati
run '.\Task 1\aggiunta_risultati_Task1.m';

%% Task 2
run '.\caricamento_casi_training_Task2.m';
run '.\Task 2\caricamento_casi_test_Task2.m';
load '.\Task 2\Task 2.mat';

run '.\Task 2\script_Task_2.m';
%Aggiunta Predizioni Task 2 alla Tabella dei risultati
run '.\Task 2\aggiunta_risultati_Task2.m';

%% Task 3
run '.\caricamento_casi_training_Task3.m';
run '.\Task 3\caricamento_casi_test_Task3.m';
load '.\Task 3\Task 3.mat';
run '.\Task 3\script_Task_3.m'
%Aggiunta Predizioni Task 3 alla Tabella dei risultati
run '.\Task 3\aggiunta_risultati_Task3.m';

%% Task 4
run '.\caricamento_casi_training_Task4.m';
load '.\Task 4\Task 4.mat';
run '.\Task 4\caricamento_casi_test_Task4.m';
run '.\Task 4\script_Task_4.m'
%Aggiunta Predizioni Task 4 alla Tabella dei risultati
run '.\Task 4\aggiunta_risultati_Task4.m';

%% Task 5
run '.\caricamento_casi_training_Task5.m';
load '.\Task 5\Task 5.mat';
run '.\Task 5\caricamento_casi_test_Task5.m';
run '.\Task 5\script_Task_5.m'
%Aggiunta Predizioni Task 5 alla Tabella dei risultati
run '.\Task 5\aggiunta_risultati_Task5.m';