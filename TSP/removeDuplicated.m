function [x] = removeDuplicated(v)
length = size(v,2);
uniq = unique(v);

for i=1:length
    if ~ismember(i,uniq)
        uniq(size(uniq,2)+1) = i;
    end
end
x = uniq;
end
