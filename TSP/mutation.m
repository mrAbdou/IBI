function [output]= mutation( individu, probM)
p = rand();
i = individu;
colonnes = size(individu, 2);
if p >= probM
    point_mutation1 = randi([1,colonnes - 1]);
    point_mutation2 = randi([1,colonnes - 1]);    
    temp = i(1,point_mutation1);
    i(1,point_mutation1) = i(1,point_mutation2);
    i(1,point_mutation2) = temp;
end
output = i;

end