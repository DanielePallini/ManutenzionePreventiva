% Caricamento DatasetTask1 se mancante
if ~exist('DatasetTask1', 'var')
    run '.\caricamento_casi_training_Task1.m';
end
%% Caricamento casi training Task 2

labels = readtable('.\train\labels.xlsx');
faultCodes = labels(:,3);
faultCodes = table2array(faultCodes);
tempCodes = table();

% 0=Normal 1=Fault Anomaly 2=Bubble Anomaly
for i = 1:height(faultCodes)
    switch(string(faultCodes(i)))
        case 'Normal'
            tempCodes = vertcat(tempCodes, table(0));
        case 'Fault'
            tempCodes = vertcat(tempCodes, table(1));
        case 'Anomaly'
            tempCodes = vertcat(tempCodes, table(2));            
    end
end

TempDatasetTask2 = [DatasetTask1(:,1:2) tempCodes];
DatasetTask2 = table();
% Estrazione casi relativi a guasti
for i=1:height(TempDatasetTask2)
    if ((table2array(TempDatasetTask2(i,3))) == 1 || (table2array(TempDatasetTask2(i,3)) == 2))
        DatasetTask2 = vertcat(DatasetTask2,TempDatasetTask2(i,:));
    end
end
DatasetTask2.Properties.VariableNames = ["Casi","Rilevazioni","FaultCode"];
clear i labels faultCodes tempCodes TempDatasetTask2;

