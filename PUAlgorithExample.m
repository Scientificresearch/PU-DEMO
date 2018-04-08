clear
clc

%% Data loading -- The data contains (XTrain, YTrain)  and (XTest, YTest)
load mnist_HOG.mat
%% Data loading end
n = length(unique(YTrain));     %Num of class labels                 
NP = 10;                        %Number of positive samples
iter = 10;                      %Number of iterations                         
numQ = 3000;                    %Number of queries in each iteration
%=================Generate initial data and initial model==================
IDX = PuID(YTrain, NP, 6);      %Get the sampling indexes of NP samples for each class, (NP x n))
yTest = PU_sampleTe(YTest);     %Transform to n binary form, {-1, 1}

shrink = 0.5;                   %Shrinkage parameter
eta = 3;                        %Margin parameter
CMD = ['-s 2 -e 1e-4 -c 16'];   %Parameter setting for libsvm (https://www.csie.ntu.edu.tw/~cjlin/libsvm/)
for i = 1:n                     %ith class label
    fprintf('======Class %d======\n', i)
    %Generate PU learning based training and testing data
    [iXini, iyini, iXRest, iyRest] = PuGenData(XTrain, YTrain, IDX, i);
    %Get the predicted label and decision values via libsvm
    [predlabel(:,i), decv(:,i)] = PU_IniModel(iXini, iyini, iXRest, iyRest,CMD);
    for j= 1:iter               %PU iterate processing
        [predNext, decNext, decTest(:,i),etaNext] = PU_Iter(eta, shrink, decv(:,i), predlabel(:,i), ...
            iXRest, iyRest, XTest, yTest(:,i), numQ, XTrain, IDX, i, CMD);
        predlabel(:,i) = predNext;
        decv(:,i) = decNext;
        eta = etaNext;
    end
end
Acc = TopAcc(decTest, YTest);  %Estimate the accuray for kth iteration
fprintf('===========Accuracy: %f ==========\n', Acc)







