function [ fit_val ] = fitness( solution, mat_adj)
x = 0;
solution = solution(1,1:5);
for i = 1 : size(solution,2) - 1
x = x + mat_adj(solution(1,i), solution(1,i+1));
end
fit_val = x;
end

