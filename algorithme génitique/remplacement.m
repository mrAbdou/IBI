function [ pop ] = remplacement(population, fils, nbrPaires)
pop1 = [population;fils];
pop1 = [pop1, fitness(pop1)];
pop1 = sortrows(pop1, -size(pop1,2));
pop = pop1(1:2*nbrPaires,1:5);
end

