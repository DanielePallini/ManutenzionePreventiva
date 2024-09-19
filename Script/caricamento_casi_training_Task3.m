% Caricamento DatasetTask2 se mancante
if ~exist('DatasetTask2', 'var')
    run '.\caricamento_casi_training_Task2.m';
end
%% Caricamento casi training Task 3

labels = readtable('.\train\labels.xlsx');
faultCodes = labels(:,8:15);
%faultCodes = table2array(faultCodes);
tempCodes = table();
% 1÷8 Posizione Bolle
for i = 1:height(faultCodes)
    for j = 1:8
        if (string(table2array(faultCodes(i,j))) == "Yes")
            tempCodes = vertcat(tempCodes, table(j));
        end
    end
end


TempDatasetTask3 = DatasetTask2 ;
DatasetTask3 = table();
% Estrazione casi relativi a guasti di tipo bubble contamination
for i=1:height(TempDatasetTask3)
    if ((table2array(TempDatasetTask3(i,3)) == 2))
        DatasetTask3 = vertcat(DatasetTask3,TempDatasetTask3(i,:));
    end
end
DatasetTask3 = [DatasetTask3(:,1:2) tempCodes];
DatasetTask3.Properties.VariableNames = ["Casi","Rilevazioni","FaultCode"];
clear i j labels faultCodes tempCodes TempDatasetTask3;

