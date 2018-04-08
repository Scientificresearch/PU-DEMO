function [ labelTest ] = PU_sampleTe(yTest)
% This function transform the test labels into the binary one {-1, 1}
classlabel = unique(yTest);
n = length(classlabel);
N = length(yTest);
labelTest  = -ones(N,n);
for i = 1:n 
    indexi = find(yTest==i);
    labelTest(indexi,i) = 1;
end
end

