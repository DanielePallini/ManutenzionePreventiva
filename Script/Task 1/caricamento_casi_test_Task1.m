%% Load test

files = dir(fullfile('.\..\test\data', '*.csv'));

casiTestTask1 = cell(1, numel(files));

for i = 1:numel(files)
    nomeFile = fullfile('.\..\test\data', files(i).name);
    casiTestTask1{i} = readtable(nomeFile);
end
casiTestTask1 = transpose(casiTestTask1);
casiTestTask1 = cell2table(casiTestTask1);
casiTestTask1 = [repmat({''}, height(casiTestTask1), 1) casiTestTask1];
casiTestTask1.Properties.VariableNames = ["Casi","Rilevazioni"];
for i = 1:height(casiTestTask1)
    stringa = 'Caso ' + string(i+177);
    casiTestTask1(i,1) = cellstr(stringa);
end
