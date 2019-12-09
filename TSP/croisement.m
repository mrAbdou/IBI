function [ fils1, fils2 ] = croisement( individu1, individu2, probabilite, mat_adj)
colonnes = size(individu1,2);
prob = rand();
if(prob >= probabilite)
    prob = randi(colonnes - 1);
    f1 = [individu1(1:prob),individu2(prob+1:size(individu1,2))];
    f2 = [individu2(1:prob),individu1(prob+1:size(individu1,2))];
    if verification(f1, mat_adj) == 0
        f1 = individu1;
        f2 = individu2;
    end
else
    f1 = individu1;
    f2 = individu2;
end
fils1 = f1;
fils2 = f2;
end
