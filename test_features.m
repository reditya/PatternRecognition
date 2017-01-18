%NX,NY = argument
dataset_profiles = im_profile(dataset_pixel,24,24);
%number of data points in image = argument
dataset_harris = im_harris(dataset_pixel,100);
%Type of moment = argument
dataset_moments = im_moments(dataset_pixel,'none');
%
dataset_mean = im_mean(dataset_pixel);
%for all features of the image
dataset_features = im_features(dataset_pixel,'all');

%todo scale
dataset_current_features = dataset_profiles;

% qdc
classifier = qdc([]);
[E_qdc_current,Std_qdc_current] = prcrossval(dataset_current_features, classifier, 10, 2);
% ldc
classifier = ldc([]);
[E_ldc_current,Std_ldc_current] = prcrossval(dataset_current_features, classifier, 10, 2);
% knnc
classifier = {knnc([],2), knnc([],3), knnc([],4), knnc([],5), knnc([],6)};
[E_knn_current,Std_knn_current] = prcrossval(dataset_current_features, classifier, 10, 2);
% parzenc
classifier = {parzenc([])};
[E_parzenc_current,Std_parzenc_current] = prcrossval(dataset_current_features, classifier, 10, 2);
% loglc
classifier = {loglc([])};
[E_loglc_current,Std_loglc_current] = prcrossval(dataset_current_features, classifier, 10, 2);
% nmc
classifier = {nmc([])};
[E_nmc_current,Std_nmc_current] = prcrossval(dataset_current_features, classifier, 10, 2);
% fisherc
classifier = {fisherc([])};
[E_fisherc_current,Std_fisherc_current] = prcrossval(dataset_current_features, classifier, 10, 2);
% bpxnc
classifier = {bpxnc([])};
[E_bpxnc_current,Std_bpxnc_current] = prcrossval(dataset_current_features, classifier, 10, 2);

