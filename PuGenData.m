function [Xini, yini, XRest, yRest] = PuGenData(X, Y, ID, i)
% This function aims to generate thedata for multi-classification case
y = M2B(Y,i); %%Multi classification to binary form
idxIni = ID(:);
idxRest = setdiff(1:length(Y), idxIni, 'stable');
Xini = X(idxIni,:);
yini = y(idxIni);
XRest = X(idxRest,:);
yRest = y(idxRest);
end

