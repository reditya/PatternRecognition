knn3 = knnc([],3);
parzen = parzenc([]);
knn4 = knnc([],4);
knn5 = knnc([],5);
qd = qdc([]);
ld = ldc([]);
logl = loglc([]);
nm = nmc([]);
fisher = fisherc([]);

%combining_classifiers = [knn3 parzen qd]; % Scenario 1
combining_classifiers = [fisher parzen ld]; % Scenario 2

%repetitions = 2; % Scenario 1
repetitions = 2;  % Scenario 2

combinerProd = combining_classifiers*prodc;
combinerMean = combining_classifiers*meanc;
combinerMin = combining_classifiers*minc;
combinerMax = combining_classifiers*maxc;
combinerMedian = combining_classifiers*medianc;
combinerVote = combining_classifiers*votec;

%pcam = pcam([], 40); % Scenario 1
pcam = pcam([], 20); % Scenario 2

1
tic;
[E_combiner_pix_cb_prod, S_combiner_pix_cb_prod] = prcrossval(dataset_pixel_deskew_small, pcam*combinerProd, 10, repetitions);
toc
2
tic;
[E_combiner_pix_cb_mean, S_combiner_pix_cb_mean] = prcrossval(dataset_pixel_deskew_small, pcam*combinerMean, 10, repetitions);
toc
3
tic;
[E_combiner_pix_cb_min, S_combiner_pix_cb_min] = prcrossval(dataset_pixel_deskew_small, pcam*combinerMin, 10, repetitions);
toc
4
tic;
[E_combiner_pix_cb_max, S_combiner_pix_cb_max] = prcrossval(dataset_pixel_deskew_small, pcam*combinerMax, 10, repetitions);
toc
5
tic;
[E_combiner_pix_cb_median, S_combiner_pix_cb_median] = prcrossval(dataset_pixel_deskew_small, pcam*combinerMedian, 10, repetitions);
toc
6
tic;
[E_combiner_pix_cb_vote, S_combiner_pix_cb_vote] = prcrossval(dataset_pixel_deskew_small, pcam*combinerProd, 10, repetitions);
toc
combo_names = {'product', 'mean', 'minimum', 'maximum', 'median', 'vote'};
combo_E_vector = {E_combiner_pix_cb_prod, E_combiner_pix_cb_mean, E_combiner_pix_cb_min, E_combiner_pix_cb_max, E_combiner_pix_cb_median, E_combiner_pix_cb_vote};
combo_S_vector = {S_combiner_pix_cb_prod, S_combiner_pix_cb_mean, S_combiner_pix_cb_min, S_combiner_pix_cb_max, S_combiner_pix_cb_median, S_combiner_pix_cb_vote};
[combo_names' combo_E_vector' combo_S_vector']