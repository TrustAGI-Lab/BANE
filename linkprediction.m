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
[U,S1] = svds(P, 200);
% A = A+eye(nodenum);
% D = diag(sum(A,1));
% DN = diag(sum(A,1).^(-1));
% L = D - A;
% P = ((eye(nodenum)-0.7*DN*L)^4)*X;
% [U,S1] = svds(P, 200);
% P = U*S1;
% B=dcc(P',100,0.001);

%%
%S = B*B';
S = U * U
n = 10000;
CalcAUC( train, test, S, n )