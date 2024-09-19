% Caricamento DatasetTask3 se mancante
if ~exist('DatasetTask2', 'var')
    run '.\caricamento_casi_training_Task2.m';
end
%% Caricamento casi training Task 4

labels = readtable('.\train\labels.xlsx');
faultCodes = labels(:,4:7);
%faultCodes = table2array(faultCodes);
tempCodes = table();
% 1÷4 Valvola guasta
for i = 1:height(faultCodes)
    for j = 1:4
        if (table2array(faultCodes(i,j)) ~= 100)
            tempCodes = vertcat(tempCodes, table(j));
        end
    end
end

TempDatasetTask4 = DatasetTask2 ;
DatasetTask4 = table();
% Estrazione casi relativi a guasti di tipo valve fault
for i=1:height(TempDatasetTask4)
    if ((table2array(TempDatasetTask4(i,3)) == 1))
        DatasetTask4 = vertcat(DatasetTask4,TempDatasetTask4(i,:));
    end
end
DatasetTask4 = [DatasetTask4(:,1:2) tempCodes];
DatasetTask4.Properties.VariableNames = ["Casi","Rilevazioni","FaultCode"];
clear i j labels faultCodes tempCodes TempDatasetTask4 DatasetTask2;

