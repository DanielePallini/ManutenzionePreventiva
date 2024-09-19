% Caricamento tabella risultati se mancante
if ~exist('risultati', 'var')
    run '.\..\catchErrorTask1.m';
end
casiTestTask2 = table();
% Estrazione casi relativi a guasti 
for i=1:height(risultati)
    if (table2array(risultati(i,3)) == 1)
        casiTestTask2 = vertcat(casiTestTask2,risultati(i,1:2));
    end
end
casiTestTask2.Properties.VariableNames = ["Casi","Rilevazioni"];
clear i;