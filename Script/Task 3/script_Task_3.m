%% Classificazione 1÷8 Posizione Bolle
[yfit,scores] = bilayeredNeuralNetworkTask3.predictFcn(TabellaTestTask3);

%% Aggregazione dei frame in casi tramite criterio di Voting
responseTask3 = table();
size = height(yfit)-2;
for i=1:3:size
    moda = mode(yfit(i:i+2,1));
    if (height(moda) > 1)
        moda = moda(1,1);
    end
    responseTask3 = vertcat(responseTask3,table(moda));
end
responseTask3.Properties.VariableNames = ["Task 3"];
%% Confronto delle predizioni con i dati reali presi dal file answer.csv
% Matrice di confusione 
C = confusionmat(answerTask3,table2array(responseTask3));
ConfusionMatrixTask3 = (array2table(C,'RowNames', {'True BP1','True BP2', 'True BP3','True BP4','True BP5', 'True BP6','True BP7'} ...
    , 'VariableNames', {'Predicted BP1','Predicted BP2', 'Predicted BP3','Predicted BP4','Predicted BP5', 'Predicted BP6','Predicted BP7'}));

BV1Column = table(zeros(height(ConfusionMatrixTask3),1));
BV1Rows = array2table(zeros(1,8));
BV1Rows.Properties.VariableNames = {'Predicted BP1','Predicted BP2', 'Predicted BP3','Predicted BP4','Predicted BP5', 'Predicted BP6','Predicted BP7','Predicted BV1'};
BV1Column.Properties.VariableNames = ["Predicted BV1"];
BV1Rows.Properties.RowNames = ["True BV1"];
ConfusionMatrixTask3 = [ConfusionMatrixTask3 BV1Column];
ConfusionMatrixTask3 = [ConfusionMatrixTask3; BV1Rows]
% Metriche
metricsTask3 = table((trace(C) / height(responseTask3))*100,'RowNames',{'Accuracy'},'VariableNames',{'Metrics Task 3 (%)'})
%% Pulizia Workspace
clearvars -except metricsTask3 ConfusionMatrixTask3 TabellaTestTask3 TabellaTrainingTask3 responseTask3 answerTask3 bilayeredNeuralNetworkTask3 DatasetTask2 DatasetTask3 risultati
