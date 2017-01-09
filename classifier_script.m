% using qdc
%[Eqdc Rqdc] = tst_p*qdc(trn_p,0.05,0.05)*testc;
% using knnc
%[Eknnc Rknnc] = tst_p*knnc(trn_p,2)*testc;
% using ldc
%[Eldc Rldc] = tst_p*ldc(trn_p)*testc;
% using parzenc
%[Eparzenc Rparzenc] = tst_p*parzenc(trn_p)*testc;
% using loglc
%[Eloglc Rloglc] = tst_p*loglc(trn_p)*testc;
% using nmc
%[Enmc Rnmc] = tst_p*nmc(trn_p)*testc;
% using fisherc
%[Efisherc Rfisherc] = tst_p*fisherc(trn_p)*testc;

% plain qdc
classifier = {knnc([],2), knnc([],3), knnc([],4), knnc([],5), knnc([],6)};
%featnum = [1:1:32];
%E = clevalf(datasetpro, classifier, featnum , 0.5, 10);
%figure(1);
%plote(E);
[E_knn_pixels,Std_knn_pixels] = prcrossval(dataset_pixel, classifier, 10, 2);
%[E_knn_profiles,Std_knn_profiles] = prcrossval(dataset_profiles, classifier, 20, 2);
%[E_knn_features,Std_knn_features] = prcrossval(dataset_features, classifier, 20, 2);
