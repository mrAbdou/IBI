function [ solution ] = init( nbrSolution, nbrVilles, mat_adj)
i = 1;
while i <= nbrSolution
    s = randperm(nbrVilles);
    if verification(s, mat_adj)
        sol(i,:) = s(1,:);
        i = i + 1;
    end
end
solution = sol;

