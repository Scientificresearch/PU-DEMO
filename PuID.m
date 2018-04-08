function ID = PuID(y, s, seed)
% y: label
% s: sampling size
% seed: Random seed
classlabel = unique(y);
n = length(classlabel);
ID = zeros(s,n);
rng(seed)
for i=1:n
    indexi = find(y == classlabel(i));
    ID(:,i) = randsample(indexi, s);
end
end

