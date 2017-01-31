% Evaluation using nist_eval function
% There are two types of my_rep function 
% For scenario 1, preprocess_basic will be used, which use basic pixel representation
% For scenario 2, preprocess_deskewed will be used, which use deskewed image
% representation

% Training set initialization.
% Load the NIST dataset
nistdataset = prnist([0:9], [1:2:1000]); %load 500 objects from each class
% Load deskew dataset
load('deskew_data');
% Preprocessing
preproc_basic = im_box([],0,1)*im_resize([], [16 16]);
preproc_dataset_basic = nistdataset*preproc_basic;
% Pixel representation
dataset_pixel_basic = prdataset(preproc_dataset_basic);

% Scenario 1
% Best classifier is : PCA on 34, combining [knn3 parzen qd], combine on median 
we1_1 = pcam(dataset_pixel_basic,34)*knnc([],3);
we2_1 = pcam(dataset_pixel_basic,34)*parzenc([],1.20);  % h is from optimizing parzenc using built-in function in parzenc.m
we3_1 = pcam(dataset_pixel_basic,34)*qdc([]);
combined_we_1 = [we1_1 we2_1 we3_1];
clsf_nist_1 = dataset_pixel_basic*combined_we_1*medianc;

err_scenario_1 = nist_eval('preprocess_basic',clsf_nist_1,100)
% result : 0.0300

% Scenario 2
% For scenario 2: pca 21 for parzen, ld and fisher and combining
% on prodc
we1_2 = pcam(dataset_deskew_small,21)*parzenc([],0.78); % h is from optimizing parzenc using built-in function in parzenc.m
we2_2 = pcam(dataset_deskew_small,21)*ldc([]);
we3_2 = pcam(dataset_deskew_small,21)*fisherc([]);
combined_we_2 = [we1_2 we2_2 we3_2];
clsf_nist_2 = dataset_deskew_small*combined_we_2*prodc;

err_scenario_2 = nist_eval('preprocess_deskewed',clsf_nist_2,100)
% result : 0.1410