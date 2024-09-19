%% Aggiunta Task 5 a tabella "risultati"
j = 1;
temp = table(NaN(height(risultati),1));

for i = 1:height(risultati)
    if (table2array(risultati(i,4)) == 1)
        temp(i,1) = responseTask5(j,1);
        j = j+1;   
    end
end
temp.Properties.VariableNames = "Task 5 (%)";

% Eliminazione eventuali duplicati
if ismember('Task 5 (%)',risultati.Properties.VariableNames)
    risultati = removevars(risultati, 'Task 5 (%)');
end

risultati = [risultati temp];
% Riordinamento colonne
order = {'Casi','Rilevazioni','Task 1','Task 2','Task 3','Task 4','Task 5 (%)'};
[~, newOrder] = ismember(order,risultati.Properties.VariableNames);
risultati = risultati(:,nonzeros(newOrder));
clear i j temp order newOrder;