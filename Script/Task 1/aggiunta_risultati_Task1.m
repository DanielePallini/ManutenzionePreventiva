%% Aggiunta Task 1 a tabella "risultati"
% Caricamento DatasetTask2 se mancante
if ~exist('risultati', 'var')
    risultati = [casiTestTask1 responseTask1];
else
    % Eliminazione eventuali duplicati
    if ismember('Task 1',risultati.Properties.VariableNames)
        risultati = removevars(risultati, 'Task 1');
    end
    risultati = [risultati responseTask1];    
    % Riordinamento colonne
    order = {'Casi','Rilevazioni','Task 1','Task 2','Task 3','Task 4','Task 5 (%)'};
    [~, newOrder] = ismember(order,risultati.Properties.VariableNames);
    risultati = risultati(:,nonzeros(newOrder));
    clear newOrder order; 
end

