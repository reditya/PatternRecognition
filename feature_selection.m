% feature selection technique
% list of classifier : ldc, qdc, knnc, parzenc, loglc, nmc, fisherc, svc,
% bpxnc (neural network), treec?, rnnc, lmnc, neurc
classifier = qdc([]);
featnum = [1:1:24]; % based on which features to use
prwaitbar off;
prwarning off;
mf = max(featnum) % max feature

%%%% 
trn_set = trn_f;
tst_set = tst_f;
%%%%
e0 = clevalf(trn_set,classifier,featnum,[],1,tst_set);
rp = randperm(size(dataset_features,2)); %size() returns the number of features while randperm returns permutation of number of features
% randperm returns random order of those 32 features
er = clevalf(trn_set(:,rp),classifier,featnum,[],1,tst_set(:,rp));
[w,r] = featseli(trn_set,'eucl-m',mf);
e1 = clevalf(trn_set*w,classifier,featnum,[],1,tst_set*w);
[w,r] = featself(trn_set,'eucl-m',mf)
e2 = clevalf(trn_set*w,classifier,featnum,[],1,tst_set*w);
[w,r] = featselb(trn_set,'eucl-m',mf)
e3 = clevalf(trn_set*w,classifier,featnum,[],1,tst_set*w);
[w,r] = featsellr(trn_set,'eucl-m',mf)
e4 = clevalf(trn_set*w,classifier,featnum,[],1,tst_set*w);
figure
plote({e0,er,e1,e2,e3,e4})
legend({'o','r','i','f','b','l'})
% looking at the result of plote, the optimum number of features for qdc is
% 32, or all of them

% feature selection can be applied to feature. for pixels representation,
% it can't be applied. it can be applied to im_features and im_profile
