% basic classifier evaluation
% pixels representation
% list of classifier to test : ldc, qdc, knnc, parzenc, loglc, nmc, fisherc, svc,
% bpxnc (neural network), treec?, rnnc, lmnc, neurc

% qdc
classifier = qdc([]);
[E_qdc_pixels,Std_qdc_pixels] = prcrossval(dataset_pixel, classifier, 10, 2);
% ldc
classifier = ldc([]);
[E_ldc_pixels,Std_ldc_pixels] = prcrossval(dataset_pixel, classifier, 10, 2);
% knnc
classifier = {knnc([],2), knnc([],3), knnc([],4), knnc([],5), knnc([],6)};
[E_knn_pixels,Std_knn_pixels] = prcrossval(dataset_pixel, classifier, 10, 2);
% parzenc
classifier = {parzenc([])};
[E_parzenc_pixels,Std_parzenc_pixels] = prcrossval(dataset_pixel, classifier, 10, 2);
% loglc
classifier = {loglc([])};
[E_loglc_pixels,Std_loglc_pixels] = prcrossval(dataset_pixel, classifier, 10, 2);
% nmc
classifier = {nmc([])};
[E_nmc_pixels,Std_nmc_pixels] = prcrossval(dataset_pixel, classifier, 10, 2);
% fisherc
classifier = {fisherc([])};
[E_fisherc_pixels,Std_fisherc_pixels] = prcrossval(dataset_pixel, classifier, 10, 2);
% bpxnc
classifier = {bpxnc([])};
[E_bpxnc_pixels,Std_bpxnc_pixels] = prcrossval(dataset_pixel, classifier, 10, 2);

