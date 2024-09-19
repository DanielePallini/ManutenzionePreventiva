%% Aggiunta Task 3 a tabella "risultati"
j = 1;
temp = table(NaN(height(risultati),1));

for i = 1:height(risultati)
    if (table2array(risultati(i,4)) == 2)
        temp(i,1) = responseTask3(j,1);
        j = j+1;   
    end
end
temp.Properties.VariableNames = "Task 3";

% Eliminazione eventuali duplicati
if ismember('Task 3',risultati.Properties.VariableNames)
    risultati = removevars(risultati, 'Task 3');
end

risultati = [risultati temp];
% Riordinamento colonne
order = {'Casi','Rilevazioni','Task 1','Task 2','Task 3','Task 4','Task 5 (%)'};
[~, newOrder] = ismember(order,risultati.Properties.VariableNames);
risultati = risultati(:,nonzeros(newOrder));
clear i j temp order newOrder;

