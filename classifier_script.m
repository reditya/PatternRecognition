tic;
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

scale_factor = scalem([], 'variance')*pcam([], 20);
% findings : using scalem for dataset_features yield better performance.
% pcam need to be explored more.

% plain qdc
classifier = {knnc([],2), knnc([],3), knnc([],4), knnc([],5), qdc([]), ldc([]), parzenc([]), loglc([]), nmc([]), fisherc([]), bpxnc([]), treec([]), lmnc([])};
classifier_names = {'knnc2', 'knnc3', 'knnc4', 'knnc5', 'qdc', 'ldc', 'parzenc', 'loglc', 'nmc', 'fisherc', 'bpxnc', 'treec', 'lmnc'};
%featnum = [1:1:32];
%E = clevalf(datasetpro, classifier, featnum , 0.5, 10);
%figure(1);
%plote(E);
[E_pixels,Std_pixels] = prcrossval(dataset_pixel, classifier, 10, 2);
%[E_pixels_basic,Std_pixels_basic] = prcrossval(dataset_pixel_basic, classifier, 10, 2);
%[E_knn_profiles,Std_knn_profiles] = prcrossval(dataset_profiles, scale_factor*classifier, 20, 2);
%[E_knn_features,Std_knn_features] = prcrossval(dataset_features, classifier, 10, 2);
running_time = toc;

%%%% DESKEWED VERSION EVALUATION %%%%

%%% SCENARIO 1 %%%
tic;
classifier = {knnc([],2), knnc([],3), knnc([],4), knnc([],5), qdc([]), ldc([]), parzenc([]), loglc([]), nmc([]), fisherc([])};
classifier_names = {'knnc2', 'knnc3', 'knnc4', 'knnc5', 'qdc', 'ldc', 'parzenc', 'loglc', 'nmc', 'fisherc'};
[E_pixels_deskewed,Std_pixels_deskewed] = prcrossval(dataset_deskew, classifier, 10, 2);
running_time = toc;
