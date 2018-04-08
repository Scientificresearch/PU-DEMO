function [Acc ] = TopAcc(decvalue, groudtruth)
% This function calculate the top 1 multi-classifcation Accuracy
% Input: decvalue is the decision value  with size  numTest*n; groudtruth is
% groudtruth (n*1 vector)
[~,predict] = max(decvalue');
Acc =  sum(predict'== groudtruth)/length(groudtruth);
end

 