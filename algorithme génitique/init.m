function [ pop ] = init( lignes,colonnes,min,max)
pop = randi([min,max],lignes,colonnes);
end

