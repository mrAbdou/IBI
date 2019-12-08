clear;
clc;
nbrVilles = 5;
nbrSolution = 6;
maxDistance = 50;
nbrPaires = 2;
nbrIterations = 10;
prob_mutation = 0.09;
prob_croisement = 0.01;
population = init(nbrSolution,nbrVilles);
mat_adj = [0 5 3 0 0;
           5 0 4 8 6;
           3 4 0 7 0;
           0 8 7 0 2;
           0 0 0 2 0];
[lignes, colonnes] = size(population);
k = 0;
while nbrIterations > 0
%evaluation : ----------------------------
for i = 1 : lignes
    F = fitness( population(i,:), mat_adj);
   population(i, colonnes + 1) = F;
end
k = k+1;
minFitness(k) = min(population(:, colonnes + 1));
%----------------croisement--------------------
pop_sel = selection(population, nbrVilles, nbrSolution, nbrPaires);
pop_sel =pop_sel(:,1:size(pop_sel,2) - 1)
[lignes, colonnes] = size(pop_sel);
for i = 1 : 2 : lignes - 1
[fils1,fils2] = croisement(pop_sel(i,:),pop_sel(i+1,:),prob_croisement);

pop_cr(i,:) = removeDuplicated(fils1);
pop_cr(i+1,:) = removeDuplicated(fils2);
end
pop_cr
[lignes, colonnes] = size(pop_cr);
%---------------mutation---------------------------------
for i = 1 : lignes
pop_mut(i,:) = mutation(pop_cr(i,:),prob_mutation);
end
pop_mut

population = remplacement(pop_mut,pop_sel,mat_adj,nbrPaires )
nbrIterations = nbrIterations - 1;
end
min(minFitness);
