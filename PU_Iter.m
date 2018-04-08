function [predNext,decNext,decTest, etaNext] = PU_Iter(eta, shrink, decvalue,... 
predlabel, XRest, yRest, XTest, yTest, numQ, X, IDX, i, cmd)
% This function tries to return the decision value for the test examples
% eta: margin parameter
% shrink: Shrinkage parameter
% decvalue: decision value for XRest
% predlabel:  predicted label for XRest
% numQ: number of query samples
% X: The original dataset 
% IDX: random sampeld positive example set
s = size(IDX, 1);
etaNext= eta*shrink;
idxGP = find(decvalue > eta);
idxGN = find(decvalue <= eta);
predlabel(idxGP) = 1;
predlabel(idxGN) = -1;

idxQ  = randsample(1:length(yRest), numQ);
XQ = XRest(idxQ,:);
yQ  = predlabel(idxQ);

GuessXTrain = [X(IDX(:,i), :); XQ];
GuessYTrain = [ones(s,1); yQ];

model = train(GuessYTrain, sparse(GuessXTrain), cmd);
[predNext, ~, decNext] = predict(yRest, sparse(XRest), model);
[~,~, decTest] = predict(yTest, sparse(XTest), model);
end

