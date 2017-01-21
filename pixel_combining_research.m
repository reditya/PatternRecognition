knnc1 = knnc([],3);
knnc2 = knnc([],4);
knnc3 = knnc([],5);

combinerProd = [knnc1 knnc2 knnc2]*prodc;
combinerMean = [knnc1 knnc2 knnc2]*meanc;
combinerMin = [knnc1 knnc2 knnc2]*minc;
combinerMax = [knnc1 knnc2 knnc2]*maxc;
combinerMedian = [knnc1 knnc2 knnc2]*medianc;
combinerVote = [knnc1 knnc2 knnc2]*votec;
%combinerAll = {combinerProd, combinerMean, combinerMin, combinerMax, combinerMedian, combinerVote};
%[E_combiner_dis_cb, S_combiner_dis_cb] = prcrossval(dataset_pixel_cityblock, combinerAll, 10, 2);
[E_combiner_pix_cb_prod, S_combiner_pix_cb_prod] = prcrossval(dataset_pixel_basic, combinerProd, 10, 2);
[E_combiner_pix_cb_mean, S_combiner_pix_cb_mean] = prcrossval(dataset_pixel_basic, combinerMean, 10, 2);
[E_combiner_pix_cb_min, S_combiner_pix_min] = prcrossval(dataset_pixel_basic, combinerMin, 10, 2);
[E_combiner_pix_cb_max, S_combiner_pix_cb_max] = prcrossval(dataset_pixel_basic, combinerMax, 10, 2);
[E_combiner_pix_cb_median, S_combiner_pix_cb_median] = prcrossval(dataset_pixel_basic, combinerMedian, 10, 2);
[E_combiner_pix_cb_vote, S_combiner_pix_cb_vote] = prcrossval(dataset_pixel_basic, combinerProd, 10, 2);