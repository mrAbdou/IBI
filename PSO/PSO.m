clc;
clear;
close all;
%% declaration et initialisation :
nVars = 5; %nombre de variables utiliser : 1 ==> QS; 2 ==> QC; 3==>gout 4==> vitesse QS 5==> vitesse QC
nIndividus = 50;% nombre d'individus
nIterations = 100;% nombre d'iterations
varSize = [nIndividus nVars];% taille de population
QS = [2 10];% bornes du valeurs de QS
QC = [6 8];% bornes du valeurs de QS
w = 2;% coeiffition d'inertie
c1 = 1;% coeiffition d'attraction 1
c2 = 1;% coeiffition d'attraction 2
population = zeros(varSize);% matrice des quatite (de sucre et du cafe)
meilleurs = repmat(-inf, nIndividus, nVars-2);%matrice des meilleurs valeurs de gout pour chaque individu
population = init(QS,QC,varSize, meilleurs);% initialisation de la population
for j = 1 : nIndividus
    population(j,3) = fitness(population(j,:));
    if meilleurs(j,3) <= population(j,3)
        meilleurs(j,1) = population(j,1);
        meilleurs(j,2) = population(j,2);
        meilleurs(j,3) = population(j,3);
    end
end
for i = 1 : nIterations
    MG = sortrows(meilleurs, -3);
    meilleursGlobal(i,:) = MG(1,:);
    for j = 1 : nIndividus
        V = formule(w,c1,c2,population(j,4:5),meilleursGlobal(i,1:2),population(j,1:2),meilleurs(j,1:2));
        population(j,4) = V(1);
        population(j,5) = V(2);
        P = miseAjour( population(j,1:2),population(j,4:5));
        population(j,1) = P(1);
        population(j,2) = P(2);
        
        population(j,3) = fitness(population(j,:));
        if meilleurs(j,3) <= population(j,3)
            meilleurs(j,1) = population(j,1);
            meilleurs(j,2) = population(j,2);
            meilleurs(j,3) = population(j,3);
        end
    end
end
plot(meilleursGlobal(:,3))