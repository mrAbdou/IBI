clear;
clc;
lignes = 10;
colonnes = 5;
min_valeur = 0;
max_valeur = 1;
nbr_paires = 3;
nombre_iterations = 30;
taux_mutation = 0.09;
taux_croisement = 0.01;
%------------------------------------------------------------------
population_initial = init(lignes, colonnes, min_valeur, max_valeur);
resultats = [];
k = 1;
[population_selectionner, resultats(k)] = selection(population_initial,nbr_paires);
%taux_croisement = randi(size(population_selectionner,2));
k = k +1 ;
while nombre_iterations > 0;
    for i = 1 : 2 : size(population_selectionner, 1)-1
        population(i,:)= croisement(population_selectionner(i,:),population_selectionner(i+1,:),taux_croisement);
    end;
    
 %taux_mutation = rand();
    for i = 1 : size(population, 1)
        populationM(i,:) = mutation(population(i,:),taux_mutation);
    end;
    %disp('mutation');
    %population
    %populationR = population_selectionner;
    populationR = remplacement(populationM, population_selectionner,nbr_paires);
    [population_selectionner, resultats(k)] = selection(populationR,nbr_paires);
    k = k + 1;
    nombre_iterations = nombre_iterations - 1;
    
end
resultats
plot(resultats);

%max(resultats)