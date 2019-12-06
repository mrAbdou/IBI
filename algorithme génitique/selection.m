function [ pop, maxFitness ] = selection( population , nbrPaires)
[lignes,colonnes] = size(population);
p = population;
p(:,colonnes + 1) = fitness(p);
colonnes = size(p,2);
total_fitness = sum(p(:,colonnes));%roulette
p(:,colonnes + 1) = (p(:,colonnes) / total_fitness)*100;
colonnes = size(p,2);
for i = 1 : size(p, 1)
    p(i,colonnes+1) = sum(p(1:i,colonnes));
end
colonnes = size(p,2);
for i = 1 : 2*nbrPaires
    prob = randi(100);
    for j = 1 : lignes
        if(p(j,colonnes) >= prob)
            pop2(i,:) = p(j,:);
            break;
        end
    end
end
maxFitness = max(pop2(:,6));
pop = pop2(:,1:5);
end

