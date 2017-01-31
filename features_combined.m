%these three features gave the best results for im_features scenario2
w1 = loglc([]);
w2 = ldc([]);
w3 = fisherc([]);
combining_classifiers = [w2 w3];

%{scenario2 improfiles
%}


scaled_features = scalem([]);

%scenario1
%dataset_current_features = dataset_features;
%dataset_current_features = dataset_profiles;


%scenario2
%dataset_profiles = dataset_profiles_small;
dataset_current_features = dataset_features_small;

combinerProd = combining_classifiers*prodc;
combinerMean = combining_classifiers*meanc;
combinerMin = combining_classifiers*minc;
combinerMax = combining_classifiers*maxc;
combinerMedian = combining_classifiers*medianc;
combinerVote = combining_classifiers*votec;

%number of features to test
total_nr_f = 24;

feat_num = [1:1:total_nr_f];

vote_pca = zeros(1,total_nr_f);
prod_pca = zeros(1,total_nr_f);
mean_pca = zeros(1,total_nr_f);
min_pca = zeros(1,total_nr_f);
max_pca = zeros(1,total_nr_f);
median_pca = zeros(1,total_nr_f);

vote_pca_std = zeros(1,total_nr_f);
prod_pca_std = zeros(1,total_nr_f);
mean_pca_std = zeros(1,total_nr_f);
min_pca_std = zeros(1,total_nr_f);
max_pca_std = zeros(1,total_nr_f);
median_pca_std = zeros(1,total_nr_f);

for c = feat_num
    
    pcam = pcam([],c); % find pca c-features
    [E_feat_prod, S_feat_prod] = prcrossval(dataset_current_features, scaled_features*(pcam*combinerProd), 10, 2);
    [E_feat_mean, S_feat_mean] = prcrossval(dataset_current_features, scaled_features*(pcam*combinerMean), 10, 2);
    [E_feat_min, S_feat_min] = prcrossval(dataset_current_features, scaled_features*(pcam*combinerMin), 10, 2);
    [E_feat_max, S_feat_max] = prcrossval(dataset_current_features, scaled_features*(pcam*combinerMax), 10, 2);
    [E_feat_median, S_feat_median] = prcrossval(dataset_current_features, scaled_features*(pcam*combinerMedian), 10, 2);
    [E_feat_vote, S_feat_vote] = prcrossval(dataset_current_features, scaled_features*(pcam*combinerProd), 10, 2);

    prod_pca(c) = E_feat_prod;
    mean_pca(c) = E_feat_mean;
    min_pca(c) = E_feat_min;
    max_pca(c) = E_feat_max;
    median_pca(c) = E_feat_median;
    vote_pca(c) = E_feat_vote;
    
    prod_pca_std(c) = S_feat_prod;
    mean_pca_std(c) = S_feat_mean;
    min_pca_std(c) = S_feat_min;
    max_pca_std(c) = S_feat_max;
    median_pca_std(c) = S_feat_median;
    vote_pca_std(c) = S_feat_vote;
end
