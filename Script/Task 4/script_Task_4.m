%% Linear Normalization (Min-Max)

min = min(TabellaTrainingTask4);     % minimo per ogni colonna 
max = max(TabellaTrainingTask4);     % massimo per ogni colonna 
range = max - min;                   % max - min per ogni colonna

%% Normalizzazione

TabellaTrainingTask4 = (TabellaTrainingTask4 - min) ./ range;
% Tabella di test normalizzata rispetto a quella di training
TabellaTestTask4 = (TabellaTestTask4 - min) ./ range;
% Riaggiunta FaulCode alla Tabella Training
TabellaTrainingTask4  = [TabellaTrainingTask4 FaultCodeTrainingTask4];

%% Classificazione 1÷4 Valvola guasta
[yfit,scores] = mediumKNNTask4.predictFcn(TabellaTestTask4);

%% Aggregazione dei frame in casi tramite criterio di Voting
responseTask4 = table();
size = height(yfit)-2;
for i=1:3:size
    moda = mode(yfit(i:i+2,1));
    if (height(moda) > 1)
        moda = moda(1,1);
    end
    responseTask4 = vertcat(responseTask4,table(moda));
end
responseTask4.Properties.VariableNames = ["Task 4"];

%% Confronto delle predizioni con i dati reali presi dal file answer.csv
% Matrice di confusione 
C = confusionmat(answerTask4,table2array(responseTask4));
ConfusionMatrixTask4 = (array2table(C,'RowNames', {'True SV1','True SV2', 'True SV3','True SV4'}, ...
    'VariableNames', {'Predicted SV1','Predicted SV2', 'Predicted SV3','Predicted SV4'}))
% Metriche
metricsTask4 = table((trace(C) / height(responseTask4))*100,'RowNames',{'Accuracy'},'VariableNames',{'Metrics Task 4 (%)'})
%% Pulizia Workspace
clearvars -except metricsTask4 ConfusionMatrixTask4 TabellaTestTask4 TabellaTrainingTask4 responseTask4 answerTask4 mediumKNNTask4 DatasetTask4 risultati
