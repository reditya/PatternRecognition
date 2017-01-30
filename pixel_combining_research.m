% Script for testing a combination for or scenario 1 or 2.
% Combination of classifiers will be tested product, mean, min, max, median
% and vote.

% Initialize all possibly to be used classifiers.
knn3 = knnc([],3);
parzen = parzenc([]);
knn4 = knnc([],4);
knn5 = knnc([],5);
qd = qdc([]);
ld = ldc([]);
logl = loglc([]);
nm = nmc([]);
fisher = fisherc([]);

% Combine classifiers which had best individual results.
%combining_classifiers = [knn3 parzen qd]; % Scenario 1
combining_classifiers = [fisher parzen ld]; % Scenario 2

% Choose number of repatitions for the crossvalidation.
%repetitions = 2; % Scenario 1
repetitions = 2;  % Scenario 2

% Apply different combination rules for combined classifiers.
combinerProd = combining_classifiers*prodc;
combinerMean = combining_classifiers*meanc;
combinerMin = combining_classifiers*minc;
combinerMax = combining_classifiers*maxc;
combinerMedian = combining_classifiers*medianc;
combinerVote = combining_classifiers*votec;

% Insert number of to be extracted features by PCA.
%pcam = pcam([], 40); % Scenario 1
pcam = pcam([], 22); % Scenario 2

%Scenario 1: dataset_pixel_basic
%Scenario 2: dataset_pixel_deskew_small

% Run test for all combining rules by selecting dataset and PCA features.
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

% Show all error and standard deviation results for all combination rules.
combo_names = {'product', 'mean', 'minimum', 'maximum', 'median', 'vote'};
combo_E_vector = {E_combiner_pix_cb_prod, E_combiner_pix_cb_mean, E_combiner_pix_cb_min, E_combiner_pix_cb_max, E_combiner_pix_cb_median, E_combiner_pix_cb_vote};
combo_S_vector = {S_combiner_pix_cb_prod, S_combiner_pix_cb_mean, S_combiner_pix_cb_min, S_combiner_pix_cb_max, S_combiner_pix_cb_median, S_combiner_pix_cb_vote};
[combo_names' combo_E_vector' combo_S_vector']