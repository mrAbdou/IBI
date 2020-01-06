function [ pop] = init(QS,QC,varSize, meilleurs)
population = zeros(varSize);% matrice des quatite (de sucre et du cafe)
for i = 1 : varSize(1)
    population(i,1) = QS(1) + (QS(2) - QS(1))*rand;
    population(i,2) = QC(1) + (QC(2) - QC(1))*rand;
    population(i,4) = rand;
    population(i,5) = rand;
end
pop = population;
end

