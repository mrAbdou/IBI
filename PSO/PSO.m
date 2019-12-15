clear;
clc;
nbrPart = 5;
nbrIterations = 2;
vitesse = rand(nbrPart,2);
w = 1;
c1 = 2;
c2 = 2;

%colonnes 1 : QS values
%colonnes 2 : QC values
pop = init(nbrPart);

%nbrVar : nombre de variable (colonnes)
%nbrPart : nombre de particule ou bien solution (lignes)
j = 1;
[nbrPart, nbrVal] = size(pop);
while j <= nbrIterations
    %[nbrPart, nbrVal] = size(pop);
    for i = 1 :nbrPart
        pop(i,:) = miseAjour(pop(i,:),vitesse);
    end
    
    p = -(ones(nbrPart, nbrVal + 1) ./ zeros(nbrPart,nbrVal + 1));
    for i = 1 : nbrPart
        pop(i,nbrVal+1) = fitness(pop(i,:));
        if p(i,size(pop,2)) < pop(i,size(pop,2))
            p(i,1:size(pop,2)) = pop(i,:);
        end
    end
    gBest = zeros(1,nbrVal);
    best = sortrows(pop, -(nbrVal+1));
    g = best(1,:);
    if(g(1,nbrVal) >= gBest(1,nbrVal))
        gBest = g;
    end
    pop = pop(:,1:nbrVal);
    vitesse
    for i = 1 : size(pop,1)
        vitesse(i,:) = formule(w,c1,c2,vitesse(i,:), gBest(1,1:nbrVal),pop(i,:),p(i,1:nbrVal));
    end
    vitesse
    
    j = j + 1;
end