
%{

    test effect of PCA on im_profiles

%}

%scaling
scaled_features = scalem([]);

%scenario1
%dataset_current_features = dataset_profiles;

%scenario2
dataset_current_features = dataset_profiles_small;

qdc_pca = zeros(1,32);
ldc_pca = zeros(1,32);
knn2_pca = zeros(1,32);
knn3_pca = zeros(1,32);
knn4_pca = zeros(1,32);
parzenc_pca = zeros(1,32);
loglc_pca = zeros(1,32);
nmc_pca = zeros(1,32);
fisherc_pca = zeros(1,32);
bpxnc_pca = zeros(1,32);

feat_num = [1:1:32];
for c = feat_num
    pcam = pcam([],c); % find pca c-features
    % qdc
    classifier = scaled_features*qdc([]);
    [E_qdc_current,Std_qdc_current] = prcrossval(dataset_current_features, pcam*classifier, 10, 2);
    qdc_pca(c) = E_qdc_current;
    
    % ldc
    classifier = scaled_features*ldc([]);
    [E_ldc_current,Std_ldc_current] = prcrossval(dataset_current_features, pcam*classifier, 10, 2);
    ldc_pca(c) = E_ldc_current;
    
    % knn2
    classifier = scaled_features*{knnc([],2)}
    [E_knn2_current,Std_knn2_current] = prcrossval(dataset_current_features, pcam*classifier, 10, 2);
    knn2_pca(c) = E_knn2_current;
    
    % knn3
    classifier = scaled_features*{knnc([],3)}
    [E_knn3_current,Std_knn3_current] = prcrossval(dataset_current_features, pcam*classifier, 10, 2);
    knn3_pca(c) = E_knn3_current;
    
    % knn4
    classifier = scaled_features*{knnc([],4)}
    [E_knn4_current,Std_knn4_current] = prcrossval(dataset_current_features, pcam*classifier, 10, 2);
    knn4_pca(c) = E_knn4_current;
    
    % parzenc
    classifier = scaled_features*{parzenc([])};
    [E_parzenc_current,Std_parzenc_current] = prcrossval(dataset_current_features, pcam*classifier, 10, 2);
    parzenc_pca(c) = E_parzenc_current;
    
    % loglc
    classifier = scaled_features*{loglc([])};
    [E_loglc_current,Std_loglc_current] = prcrossval(dataset_current_features, pcam*classifier, 10, 2);
    loglc_pca(c) = E_loglc_current;
    
    % nmc
    classifier = scaled_features*{nmc([])};
    [E_nmc_current,Std_nmc_current] = prcrossval(dataset_current_features, pcam*classifier, 10, 2);
    nmc_pca(c) = E_nmc_current;
    
    % fisherc
    classifier = scaled_features*{fisherc([])};
    [E_fisherc_current,Std_fisherc_current] = prcrossval(dataset_current_features, pcam*classifier, 10, 2);
    fisherc_pca(c) = E_fisherc_current;
    
    % bpxnc
    classifier = scaled_features*{bpxnc([])};
    [E_bpxnc_current,Std_bpxnc_current] = prcrossval(dataset_current_features, pcam*classifier, 10, 2);  
    bpxnc_pca(c) = E_bpxnc_current;
end

plot(feat_num,bpxnc_pca,'',feat_num,fisherc_pca,'',feat_num,nmc_pca,'',feat_num,loglc_pca,'',feat_num,parzenc_pca,'',feat_num,knn4_pca,'',feat_num,knn3_pca,'',feat_num,knn2_pca,'',feat_num,ldc_pca,'',feat_num,qdc_pca,'');
legend('bpxnc','fisherc','nmc','loglc','parzenc','knn4','knn3','knn2','ldc','qdc');
