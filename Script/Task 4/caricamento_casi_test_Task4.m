% Caricamento tabella risultati se mancante o in assenza di Task 2
if (~exist('risultati', 'var')) || (exist('risultati', 'var') && ~ismember('Task 2',risultati.Properties.VariableNames))
    run '.\..\catchErrorTask2.m';
end
casiTestTask4 = table();
% Estrazione casi relativi a guasti di tipo valve fault
for i=1:height(risultati)
    if (table2array(risultati(i,4)) == 1)
        casiTestTask4 = vertcat(casiTestTask4,risultati(i,1:2));
    end
end
casiTestTask4.Properties.VariableNames = ["Casi","Rilevazioni"];
clear i;