function [ solution ] = init( nbrSolution, nbrVilles, mat_adj)
i = 1;
err = 0;
while(i<= nbrSolution)
    s = randperm(nbrVilles);
    j = 1;
    while(j<size(s,2) - 1 && err == 0)
        if(mat_adj(s(j),s(j+1)) == 0)
            err = err + 1;
        end
        j = j + 1;
    end
    if(err ~= 0)
        sol(i,:) = s;
        i = i + 1;
    end
    
end
solution = sol

