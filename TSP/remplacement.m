function [ pop ] = remplacement(population, fils,mat_adj, nbrPaires)
pop1 = [population;fils];
[lignes, colonnes] = size(pop1);
for i = 1 : lignes
    F = fitness( pop1(i,:), mat_adj);
   pop1(i, colonnes + 1) = F;
end
pop1 = sortrows(pop1, size(pop1,2));
pop = pop1(1:2*nbrPaires,1:5);
end

