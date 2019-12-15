function [ pop ] = init( nbrPart)
min_QS = 2;
max_QS = 10;
min_QC = 6;
max_QC = 8;
p(:,1) = min_QS + (max_QS-min_QS).*rand(nbrPart,1);
p(:,2) = min_QC + (max_QC-min_QC).*rand(nbrPart,1);
pop = p;
end

