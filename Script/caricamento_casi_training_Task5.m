% Caricamento DatasetTask2 se mancante
if (~exist('DatasetTask2', 'var') || ~exist('DatasetTask1', 'var'))
    run '.\caricamento_casi_training_Task2.m';
end
%% Caricamento casi training Task 5

labels = readtable('.\train\labels.xlsx');
faultCodes = labels(:,4:7);

tempCodes = [];
% 1÷4 Valvola guasta
for i = 1:height(faultCodes)
    for j = 1:4
        if (table2array(faultCodes(i,j)) ~= 100)
            tempCodes = vertcat(tempCodes,table2array(faultCodes(i,j)));
            break;
        end
    end
end

DatasetTask5 = table();

TempDatasetTask5 = DatasetTask2;
% Estrazione casi relativi a guasti di tipo valve fault
for i=1:height(TempDatasetTask5)
    if ((table2array(TempDatasetTask5(i,3)) == 1))
        DatasetTask5 = vertcat(DatasetTask5,TempDatasetTask5(i,:));
    end
end
tempCodesT = array2table(tempCodes);
tempCodesT.Properties.VariableNames = "SV1";
% Estrazione di 12 casi Normal (Apertura 100%, 4 per ogni Spacecraft)
DatasetTask5 = [DatasetTask1(1:4,1:2) labels(1:4,4);
                DatasetTask1(36:39,1:2) labels(36:39,4);
                DatasetTask1(71:74,1:2) labels(71:74,4);
                DatasetTask5(:,1:2) tempCodesT];
DatasetTask5.Properties.VariableNames = ["Casi","Rilevazioni","Percentage"];
clear i j labels faultCodes tempCodes tempCodesT TempDatasetTask5 DatasetTask1 DatasetTask2;

