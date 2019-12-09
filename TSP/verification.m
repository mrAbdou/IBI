function [ boolean ] = verification(solution, mat_adj )
err = 0;
for i = 1 : size(solution, 2) - 1
    if mat_adj(solution(i),solution(i+1)) == 0
        err = 1;
        break;
    end
end
boolean = (err == 0);
