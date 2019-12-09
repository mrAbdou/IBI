function [ fils1, fils2 ] = croisement( individu1, individu2, probabilite)
colonnes = size(individu1,2);
prob = rand();
if(prob >= probabilite)
    prob = randi(colonnes - 1);
    fils1 = [individu1(1:prob),individu2(prob+1:size(individu1,2))];
    fils2 = [individu2(1:prob),individu1(prob+1:size(individu1,2))];

else
    fils1 = individu1;
    fils2 = individu2;
end
end
