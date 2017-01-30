% Script for testing interesting numbers of extracted features by PCA to
% see witch of the three combining techniques (median/product/vote) and 
% which number of extracted features is optimal. Scenario 1 followed by
% scenario 2. The ranges of number of extracted features differ.

% Scenario 1
% Selecting combination of best classifiers for scenario 1.
combining_classifiers_1 = [knnc([],3) parzenc([],1.20) qdc([])];
pca_matrix_names = {'featnum' 'median' 'product' 'vote'};
combining_classifiers_2 = [parzenc([],0.78) ldc([]) fisherc([])];
% Test number of features in range.
for i = 30:1:50
    i
    tic

    % Add combining rules.
    combinerMedian = combining_classifiers_1*medianc;
    combinerProd = combining_classifiers_1*prodc;
    combinerVote = combining_classifiers_1*votec;
    % Apply PCA for i.
    pcam = pcam([], i);
    
    % Run crossvalidation for a dataset best for scenario 1.
    [E1, S1] = prcrossval(dataset_pixel_basic, pcam*combinerMedian, 10, 10);
    [E2, S2] = prcrossval(dataset_pixel_basic, pcam*combinerProd, 10, 10);
    [E3, S3] = prcrossval(dataset_pixel_basic, pcam*combinerVote, 10, 10);
    
    % Put results in matrices.
    pca_matrix(i-29,1) = i;
    pca_matrix(i-29,2) = E1;
    pca_matrix(i-29,3) = E2;
    pca_matrix(i-29,4) = E3;
    
    pca_matrix_S(i-29,1) = i;
    pca_matrix_S(i-29,2) = S1;
    pca_matrix_S(i-29,3) = S2;
    pca_matrix_S(i-29,4) = S3;
    toc
end

% Show results
pca_matrix_names
pca_matrix_S
pca_matrix

% Scenario 2
% Selecting combination of best classifiers for scenario 2.
combining_classifiers_2 = [parzenc([],0.78) ldc([]) fisherc([])];
% Test number of features in range.
for i = 10:1:30
    i
    tic

    % Add combining rules.
    combinerMedian = combining_classifiers_2*medianc;
    combinerProd = combining_classifiers_2*prodc;
    combinerVote = combining_classifiers_2*votec;
    % Apply PCA for i.
    pcam = pcam([], i);
    
    % Run crossvalidation for a dataset best for scenario 2.
    [E1, S1] = prcrossval(dataset_pixel_deskew_small, pcam*combinerMedian, 10, 10);
    [E2, S2] = prcrossval(dataset_pixel_deskew_small, pcam*combinerProd, 10, 10);
    [E3, S3] = prcrossval(dataset_pixel_deskew_small, pcam*combinerVote, 10, 10);
    
    % Put results in matrices.
    pca_matrix2(i-9,1) = i;
    pca_matrix2(i-9,2) = E1;
    pca_matrix2(i-9,3) = E2;
    pca_matrix2(i-9,4) = E3;
    
    pca_matrix_S2(i-9,1) = i;
    pca_matrix_S2(i-9,2) = S1;
    pca_matrix_S2(i-9,3) = S2;
    pca_matrix_S2(i-9,4) = S3;
    toc
end

% Show results.
pca_matrix_names
pca_matrix_S2
pca_matrix2