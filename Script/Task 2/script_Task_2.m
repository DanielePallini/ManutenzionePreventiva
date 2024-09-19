%% Individuazione della soglia tramite applicazione del modello 
% sui dati di training e visualizzazione in un boxplot

% [yfit,scoressvm] = SVMTask2.predictFcn(TabellaTrainingTask2);
% scores = scoressvm(:,1);
% boxchart(scores);
% ylabel('Distance from Hyperplane');


%% Classificazione 1=Valve Fault 2=Bubble Anomaly
[yfit,scoressvm] = SVMTask2.predictFcn(TabellaTestTask2);
scores = scoressvm(:,1);

%% Aggregazione dei frame in casi tramite criterio di Voting
% e calcolo della distanza dall'iperpiano tramite media aritmetica 
% dei 3 frame per ogni caso
responseTask2 = table();
meanAll = table();

size = height(yfit)-2;
for i=1:3:size
    sum = yfit(i,1)+yfit(i+1,1)+yfit(i+2,1);
    if (sum <= 4)
        responseTask2 = vertcat(responseTask2,table(1));
    else
        responseTask2 = vertcat(responseTask2,table(2));    
    end

    mean = (scores(i,1)+scores(i+1,1)+scores(i+2,1))/3;
    mean = array2table(mean);
    meanAll = vertcat(meanAll,mean);
end
%% Riconoscimento dei casi Unknown per distanze dall'iperpiano maggiori di 2 
for i=1:height(responseTask2)
    if (table2array(meanAll(i,1))>2)
        responseTask2(i,1) = table(3);
    end
end
responseTask2.Properties.VariableNames = ["Task 2"];

%% Confronto delle predizioni con i dati reali presi dal file answer.csv

% Matrice di confusione 
C = confusionmat(answerTask2,table2array(responseTask2));
ConfusionMatrixTask2 = (array2table(C,'RowNames', {'True Fault','True Anomaly', 'True Unknown'}, 'VariableNames', {'Predicted Fault','Predicted Anomaly', 'Predicted Unknown'}))
% Metriche
metricsTask2 = table((trace(C) / height(responseTask2))*100,'RowNames',{'Accuracy'},'VariableNames',{'Metrics Task 2 (%)'})
%% Pulizia Workspace
clearvars -except metricsTask2 ConfusionMatrixTask2 TabellaTestTask2 TabellaTrainingTask2 responseTask2 answerTask2 SVMTask2 DatasetTask2 risultati
