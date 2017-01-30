% Evaluation using nist_eval function
% There are two types of my_rep function 
% For scenario 1, preprocess_basic will be used, which use basic pixel representation
% For scenario 2, preprocess_deskewed will be used, which use deskewed image
% representation
% Scenario 1
% Best classifier is : PCA on 40, combining [knn3 parzen qd], combine on median 
pca_matrix_names = {'featnum' 'median' 'product' 'vote'};
for i = 30:1:50
    i
    tic
    we1_1 = pcam(dataset_pixel_basic,i)*knnc([],3);
    we2_1 = pcam(dataset_pixel_basic,i)*parzenc([],1.20);  % h is from optimizing parzenc using built-in function in parzenc.m
    we3_1 = pcam(dataset_pixel_basic,i)*qdc([]);
    combined_we_1 = [we1_1 we2_1 we3_1];
    clsf_nist_1 = dataset_pixel_basic*combined_we_1*medianc;
    clsf_nist_1_2 = dataset_pixel_basic*combined_we_1*prodc;
    clsf_nist_1_3 = dataset_pixel_basic*combined_we_1*votec;

    err_scenario_1 = nist_eval('preprocess_basic',clsf_nist_1,100);
    pca_matrix(i-29,1) = i;
    pca_matrix(i-29,2) = err_scenario_1;
    pca_matrix(i-29,3) = nist_eval('preprocess_basic',clsf_nist_1_2,100);
    pca_matrix(i-29,4) = nist_eval('preprocess_basic',clsf_nist_1_3,100);
    toc
end

pca_matrix_names
pca_matrix

% Scenario 2
% For scenario 2: pca 22 for parzen and ld and 21 for fisher and combining
% on prodc
pca_matrix_names2 = {'featnum' 'product' 'median' 'vote'};
for i = 10:1:30
    i
    tic
    we1_2 = pcam(dataset_deskew_small,i)*parzenc([],0.78); % h is from optimizing parzenc using built-in function in parzenc.m
    we2_2 = pcam(dataset_deskew_small,i)*ldc([]);
    we3_2 = pcam(dataset_deskew_small,i)*fisherc([]);
    combined_we_2 = [we1_2 we2_2 we3_2];
    clsf_nist_2 = dataset_deskew_small*combined_we_2*prodc;
    clsf_nist_2_2 = dataset_deskew_small*combined_we_2*medianc;
    clsf_nist_2_3 = dataset_deskew_small*combined_we_2*votec;

    err_scenario_2 = nist_eval('preprocess_deskewed',clsf_nist_2,100);
    pca_matrix2(i-9,1) = i;
    pca_matrix2(i-9,2) = err_scenario_2;
    pca_matrix2(i-9,3) = nist_eval('preprocess_deskewed',clsf_nist_2_2,100);
    pca_matrix2(i-9,4) = nist_eval('preprocess_deskewed',clsf_nist_2_3,100);
    toc
end

pca_matrix_names2
pca_matrix2