function [ label ] = M2B(y, n)
% Transform the multi-classification to binary classification
% n denotes the class would be assigned to +1
label = -ones(length(y),1);
index = find(y==n);
label(index) = 1;
end

