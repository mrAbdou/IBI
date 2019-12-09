function [ pop ] = selection( population, nbrSolution, nbrVilles, nbrPaires)
[lignes,colonnes] = size(population);
population = sortrows(population,-colonnes)
score = 1;
score_total = 0;
for i = 1 : lignes
    population(i,colonnes + 1) = score;
    score_total = score_total + score;
    score = score + 1;
end
colonnes = size(population, 2);
for i = 1 : lignes
    population(i, colonnes + 1) = population(i, colonnes) / score_total;
end
colonnes = size(population, 2);
for i = 1 : lignes
    population(i, colonnes + 1) = sum(population(1:i,colonnes));
end
colonnes = size(population, 2);
for i =1 :  2 * nbrPaires
    prob = rand();
    for j = 1 : lignes
        if(population(j,colonnes) >= prob)
            population2(i,:) = population(j,:);
            break;
        end
    end
end
pop = population2(:,1:nbrVilles);
end

