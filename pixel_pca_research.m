featnum = [1:1:256]; % all [1:1:256]
featnum(1) = 1;
res_3NN = zeros(size(featnum));
res_4NN = zeros(size(featnum));
res_5NN = zeros(size(featnum));
res_parzen = zeros(size(featnum));
res_qdc = zeros(size(featnum));
res_ldc = zeros(size(featnum));
res_loglc = zeros(size(featnum));
res_nmc = zeros(size(featnum));
res_fisherc = zeros(size(featnum));

for c = featnum
    tic;
    pca_pix_3NN = knnc([],3);
    pca_pix_4NN = knnc([],4);
    pca_pix_5NN = knnc([],5);
    pca_pix_parzen = parzenc([]);
    pca_pix_qdc = qdc([]);
    pca_pix_ldc = ldc([]);
    pca_pix_loglc = loglc([]);
    pca_pix_nmc = nmc([]);
    pca_pix_fisherc = fisherc([]);
    
    wp = pcam([],c);
    c
    res_3NN(c) = prcrossval(dataset_pixel_basic,wp*pca_pix_3NN,10,2);
    res_4NN(c) = prcrossval(dataset_pixel_basic,wp*pca_pix_4NN,10,2);
    res_5NN(c) = prcrossval(dataset_pixel_basic,wp*pca_pix_5NN,10,2);
    res_parzen(c) = prcrossval(dataset_pixel_basic,wp*pca_pix_parzen,10,2);
    res_qdc(c) = prcrossval(dataset_pixel_basic,wp*pca_pix_qdc,10,2);
    res_ldc(c) = prcrossval(dataset_pixel_basic,wp*pca_pix_ldc,10,2);
    res_loglc(c) = prcrossval(dataset_pixel_basic,wp*pca_pix_loglc,10,2);
    res_nmc(c) = prcrossval(dataset_pixel_basic,wp*pca_pix_nmc,10,2);
    res_fisherc(c) = prcrossval(dataset_pixel_basic,wp*pca_pix_fisherc,10,2);
    toc;
end