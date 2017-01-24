tic;
knn3c = knnc([],3);
parzenc = parzenc([]);
qdc = qdc([]);

combinerProd = [knn3c parzenc qdc]*prodc;
combinerMean = [knn3c parzenc qdc]*meanc;
combinerMin = [knn3c parzenc qdc]*minc;
combinerMax = [knn3c parzenc qdc]*maxc;
combinerMedian = [knn3c parzenc qdc]*medianc;
combinerVote = [knn3c parzenc qdc]*votec;

pcam = pcam([],40);

[E_combiner_pix_cb_prod, S_combiner_pix_cb_prod] = prcrossval(dataset_pixel_basic, pcam*combinerProd, 10, 2);
[E_combiner_pix_cb_mean, S_combiner_pix_cb_mean] = prcrossval(dataset_pixel_basic, pcam*combinerMean, 10, 2);
[E_combiner_pix_cb_min, S_combiner_pix_cb_min] = prcrossval(dataset_pixel_basic, pcam*combinerMin, 10, 2);
[E_combiner_pix_cb_max, S_combiner_pix_cb_max] = prcrossval(dataset_pixel_basic, pcam*combinerMax, 10, 2);
[E_combiner_pix_cb_median, S_combiner_pix_cb_median] = prcrossval(dataset_pixel_basic, pcam*combinerMedian, 10, 2);
[E_combiner_pix_cb_vote, S_combiner_pix_cb_vote] = prcrossval(dataset_pixel_basic, pcam*combinerProd, 10, 2);
toc;