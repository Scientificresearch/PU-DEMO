function [ predlabel, decv] = PU_IniModel(Xini, yini, XRest, yRest, cmd)
% This function aims to compute the initial model and decision value
% parameter:
% n: number of class
% M: rest number of class

 model = train(yini, sparse(Xini), cmd);
 [predlabel, ~, decv] = predict(yRest, sparse(XRest), model);

end

