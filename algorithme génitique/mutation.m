function [output]= mutation( individu, probM)
p = rand();
i = individu;
colonnes = size(individu, 2);
if p >= probM
    point_mutation = randi([1,colonnes - 1]);
    i(1,point_mutation) = 1-individu(1,point_mutation);
end
output = i;

end