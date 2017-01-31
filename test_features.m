%{
    %scenario 1
    dataset_profiles = im_profile(dataset_pixel_basic,24,24);
    dataset_harris = im_harris(dataset_pixel_basic,100);
    dataset_moments = im_moments(dataset_pixel_basic,'none');
    dataset_mean = im_mean(dataset_pixel_basic);
    dataset_features = im_features(dataset_pixel_basic,'all');
%}

%scenario 2

%NX,NY = argument
dataset_profiles = im_profile(dataset_pixel_basic_small,24,24);
%number of data points in image = argument
dataset_harris = im_harris(dataset_pixel_basic_small,100);
%Type of moment = argument
dataset_moments = im_moments(dataset_pixel_basic_small,'none');
%
dataset_mean = im_mean(dataset_pixel_basic_small);
%for all features of the image
dataset_features = im_features(dataset_pixel_basic_small,'all');



%use to scale features
scaled_features = scalem([]);



%{
    %profiles
%}

dataset_current_features = dataset_profiles;

% qdc
classifier = scaled_features*qdc([]);
[E_qdc_profiles,Std_qdc_profiles] = prcrossval(dataset_current_features, classifier, 10, 2);
% ldc
classifier = scaled_features*ldc([]);
[E_ldc_profiles,Std_ldc_profiles] = prcrossval(dataset_current_features, classifier, 10, 2);
% knnc
classifier = scaled_features*{knnc([],2), knnc([],3), knnc([],4), knnc([],5), knnc([],6)};
[E_knn_profiles,Std_knn_profiles] = prcrossval(dataset_current_features, classifier, 10, 2);
% parzenc
classifier = scaled_features*{parzenc([])};
[E_parzenc_profiles,Std_parzenc_profiles] = prcrossval(dataset_current_features, classifier, 10, 2);
% loglc
classifier = scaled_features*{loglc([])};
[E_loglc_profiles,Std_loglc_profiles] = prcrossval(dataset_current_features, classifier, 10, 2);
% nmc
classifier = scaled_features*{nmc([])};
[E_nmc_profiles,Std_nmc_profiles] = prcrossval(dataset_current_features, classifier, 10, 2);
% fisherc
classifier = scaled_features*{fisherc([])};
[E_fisherc_profiles,Std_fisherc_profiles] = prcrossval(dataset_current_features, classifier, 10, 2);
% bpxnc
classifier = scaled_features*{bpxnc([])};
[E_bpxnc_profiles,Std_bpxnc_profiles] = prcrossval(dataset_current_features, classifier, 10, 2);




%{
    %imfeatures
%}

dataset_current_features = dataset_features;

% qdc
classifier = scaled_features*qdc([]);
[E_qdc_features,Std_qdc_features] = prcrossval(dataset_current_features, classifier, 10, 2);
% ldc
classifier = scaled_features*ldc([]);
[E_ldc_features,Std_ldc_features] = prcrossval(dataset_current_features, classifier, 10, 2);
% knnc
classifier = scaled_features*{knnc([],2), knnc([],3), knnc([],4), knnc([],5), knnc([],6)};
[E_knn_features,Std_knn_features] = prcrossval(dataset_current_features, classifier, 10, 2);
% parzenc
classifier = scaled_features*{parzenc([])};
[E_parzenc_features,Std_parzenc_features] = prcrossval(dataset_current_features, classifier, 10, 2);
% loglc
classifier = scaled_features*{loglc([])};
[E_loglc_features,Std_loglc_features] = prcrossval(dataset_current_features, classifier, 10, 2);
% nmc
classifier = scaled_features*{nmc([])};
[E_nmc_features,Std_nmc_features] = prcrossval(dataset_current_features, classifier, 10, 2);
% fisherc
classifier = scaled_features*{fisherc([])};
[E_fisherc_features,Std_fisherc_features] = prcrossval(dataset_current_features, classifier, 10, 2);
% bpxnc
classifier = scaled_features*{bpxnc([])};
[E_bpxnc_features,Std_bpxnc_features] = prcrossval(dataset_current_features, classifier, 10, 2);



%{
    %harris
%}

dataset_current_features = dataset_harris;

% qdc
classifier = scaled_features*qdc([]);
[E_qdc_harris,Std_qdc_harris] = prcrossval(dataset_current_features, classifier, 10, 2);
% ldc
classifier = scaled_features*ldc([]);
[E_ldc_harris,Std_ldc_harris] = prcrossval(dataset_current_features, classifier, 10, 2);
% knnc
classifier = scaled_features*{knnc([],2), knnc([],3), knnc([],4), knnc([],5), knnc([],6)};
[E_knn_harris,Std_knn_harris] = prcrossval(dataset_current_features, classifier, 10, 2);
% parzenc
classifier = scaled_features*{parzenc([])};
[E_parzenc_harris,Std_parzenc_harris] = prcrossval(dataset_current_features, classifier, 10, 2);
% loglc
classifier = scaled_features*{loglc([])};
[E_loglc_harris,Std_loglc_harris] = prcrossval(dataset_current_features, classifier, 10, 2);
% nmc
classifier = scaled_features*{nmc([])};
[E_nmc_harris,Std_nmc_harris] = prcrossval(dataset_current_features, classifier, 10, 2);
% fisherc
classifier = scaled_features*{fisherc([])};
[E_fisherc_harris,Std_fisherc_harris] = prcrossval(dataset_current_features, classifier, 10, 2);
% bpxnc
classifier = scaled_features*{bpxnc([])};
[E_bpxnc_harris,Std_bpxnc_harris] = prcrossval(dataset_current_features, classifier, 10, 2);



%{
    %moments
%}

dataset_current_features = dataset_moments;

% qdc
classifier = scaled_features*qdc([]);
[E_qdc_moments,Std_qdc_moments] = prcrossval(dataset_current_features, classifier, 10, 2);
% ldc
classifier = scaled_features*ldc([]);
[E_ldc_moments,Std_ldc_moments] = prcrossval(dataset_current_features, classifier, 10, 2);
% knnc
classifier = scaled_features*{knnc([],2), knnc([],3), knnc([],4), knnc([],5), knnc([],6)};
[E_knn_moments,Std_knn_moments] = prcrossval(dataset_current_features, classifier, 10, 2);
% parzenc
classifier = scaled_features*{parzenc([])};
[E_parzenc_moments,Std_parzenc_moments] = prcrossval(dataset_current_features, classifier, 10, 2);
% loglc
classifier = scaled_features*{loglc([])};
[E_loglc_moments,Std_loglc_moments] = prcrossval(dataset_current_features, classifier, 10, 2);
% nmc
classifier = scaled_features*{nmc([])};
[E_nmc_moments,Std_nmc_moments] = prcrossval(dataset_current_features, classifier, 10, 2);
% fisherc
classifier = scaled_features*{fisherc([])};
[E_fisherc_moments,Std_fisherc_moments] = prcrossval(dataset_current_features, classifier, 10, 2);
% bpxnc
classifier = scaled_features*{bpxnc([])};
[E_bpxnc_moments,Std_bpxnc_moments] = prcrossval(dataset_current_features, classifier, 10, 2);


%{
    %mean
%}
dataset_current_features = dataset_mean;

% qdc
classifier = scaled_features*qdc([]);
[E_qdc_mean,Std_qdc_mean] = prcrossval(dataset_current_features, classifier, 10, 2);
% ldc
classifier = scaled_features*ldc([]);
[E_ldc_mean,Std_ldc_mean] = prcrossval(dataset_current_features, classifier, 10, 2);
% knnc
classifier = scaled_features*{knnc([],2), knnc([],3), knnc([],4), knnc([],5), knnc([],6)};
[E_knn_mean,Std_knn_mean] = prcrossval(dataset_current_features, classifier, 10, 2);
% parzenc
classifier = scaled_features*{parzenc([])};
[E_parzenc_mean,Std_parzenc_mean] = prcrossval(dataset_current_features, classifier, 10, 2);
% loglc
classifier = scaled_features*{loglc([])};
[E_loglc_mean,Std_loglc_mean] = prcrossval(dataset_current_features, classifier, 10, 2);
% nmc
classifier = scaled_features*{nmc([])};
[E_nmc_mean,Std_nmc_mean] = prcrossval(dataset_current_features, classifier, 10, 2);
% fisherc
classifier = scaled_features*{fisherc([])};
[E_fisherc_mean,Std_fisherc_mean] = prcrossval(dataset_current_features, classifier, 10, 2);
% bpxnc
classifier = scaled_features*{bpxnc([])};
[E_bpxnc_mean,Std_bpxnc_mean] = prcrossval(dataset_current_features, classifier, 10, 2);

