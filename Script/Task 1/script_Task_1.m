%% Classificazione
[predizioni,scores] = mediumTreeTask1.predictFcn(TabellaTestTask1);

responseTask1 = table();

predizioni = array2table(predizioni);
esito = table([0;1]);
size = height(predizioni) - 2;

% Applicazione del Worst Case in caso di 1 in un frame 
% e aggregazione in casi
for i=1:3:size
    sum = predizioni(i,1)+predizioni(i+1,1)+predizioni(i+2,1);
    condizione = table2array(sum);
    if (condizione == 0)
        responseTask1 = vertcat(responseTask1,esito(1,1));
    else if (condizione >= 1)
        responseTask1 = vertcat(responseTask1,esito(2,1));    
    end
    end
end
responseTask1.Properties.VariableNames = ["Task 1"];
%% Confronto delle predizioni con i dati reali presi dal file answer.csv

% Matrice di confusione
C = confusionmat(answerTask1,table2array(responseTask1));
ConfusionMatrixTask1 = (array2table(C,'RowNames', {'True Normal','True Fault'}, 'VariableNames', {'Predicted Normal','Predicted Fault'}))

tp1 = C(1,1);
fp1 = C(2,1);
fn1 = C(1,2);

tp2 = C(2,2);
fp2 = C(1,2);
fn2 = C(2,1);

% Metriche
precision1 = tp1 / (tp1 + fp1);
recall1 = tp1 / (tp1 + fn1);
F1score1 = (2 * precision1 * recall1) / (precision1 + recall1);
specificity = tp2 / (tp2 + fn2);
accuracy = trace(C) / height(responseTask1); 

labels = {'Accuracy','Precision', 'Recall', 'F1 Score', 'Specificity'};
metricsTask1 = table([accuracy;precision1;recall1;F1score1;specificity],'RowNames',labels,'VariableNames',{'Metrics Task 1 (%)'});
metricsTask1 = 100 .* metricsTask1
%% Pulizia Workspace
clearvars -except metricsTask1 ConfusionMatrixTask1 TabellaTestTask1 TabellaTrainingTask1 responseTask1 answerTask1 mediumTreeTask1 DatasetTask1 casiTestTask1 risultati




