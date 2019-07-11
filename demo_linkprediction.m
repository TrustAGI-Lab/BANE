%% Divide Network
load cora.mat %wiki.mat %blogcatalog.mat %cora.mat citeseer.mat
net = network;
ratioTrain = 0.9; % 90% for training, 10% for test
[train, test] = DivideNet(net,ratioTrain);              
train = sparse(train); 
test = sparse(test);
train = spones(train + train'); 
test = spones(test+test');           
%% 
A = train;
[U,S1] = svds(A, 200); % svd for the embedding


S = U * U';
n = 10000;
CalcAUC( train, test, S, n )