%% Caricamento 177 casi di training
cartella = '.\train\data';
files = dir(fullfile(cartella, '*.csv'));

casi = cell(1, numel(files));

for i = 1:numel(files)
    nomeFile = fullfile(cartella, files(i).name);
    casi{i} = readtable(nomeFile);
end
casi = transpose(casi);

%% Recupero FaultCodes
labels = readtable('.\train\labels.xlsx');
faultCodes = labels(:,3);
faultCodes = table2array(faultCodes);

for i = 1:numel(faultCodes)
    numeriCasi(i,1) = table('Caso ' + string(i));
    switch(string(faultCodes(i)))
        case 'Normal'
            faultCodes(i) = num2cell(0);
        otherwise
            faultCodes(i) = num2cell(1);
    end
end 

%% Preparazione Dataset
DatasetTask1 =  [numeriCasi cell2table(casi) cell2table(faultCodes)];
DatasetTask1.Properties.VariableNames = ["Casi","Rilevazioni","FaultCode"];

clearvars -except DatasetTask1 risultati;