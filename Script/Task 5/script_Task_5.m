%% Regressione Apertura Valvole
y_pred = trilayeredNeuralNetworkTask5.predictFcn(TabellaTestTask5);

%% Aggregazione dei frame in casi tramite media aritmetica
responseTask5 = table();

for i=1:3:28
    somma = y_pred(i,1)+y_pred(i+1,1)+y_pred(i+2,1);
    Percentage = somma/3;
    responseTask5 = vertcat(responseTask5,array2table(Percentage));
end

%% Arrotondamento e settaggio a 99% delle aperture uguali o superiori a 100%
responseTask5 = round(responseTask5);
for i=1:10
    if (table2array(responseTask5(i,1)) >= 100 )
        responseTask5(i,1) = array2table(99);
    end
end
responseTask5.Properties.VariableNames = ["Task 5 (%)"];

labels = {'RMSE','MAE', 'MSE', 'MAPE'};

rmseMetric = rmse(table2array(responseTask5),answerTask5);
maeMetric = mean(abs(table2array(responseTask5) - answerTask5));
mseMetric = rmseMetric^2;
mapeMetric = mape(table2array(responseTask5),answerTask5);
metricsTask5 = table([rmseMetric;maeMetric;mseMetric;mapeMetric],'RowNames',labels,'VariableNames',{'Metrics Task 5'})

%% Pulizia Workspace
clearvars -except metricsTask5 ConfusionMatrixTask5 TabellaTestTask5 TabellaTrainingTask5 responseTask5 answerTask5 trilayeredNeuralNetworkTask5 DatasetTask5 risultati