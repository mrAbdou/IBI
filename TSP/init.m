function [ solution ] = init( nbrSolution, nbrVilles)
for i = 1 : nbrSolution
solution(i,:) = randperm(nbrVilles);
end
end

