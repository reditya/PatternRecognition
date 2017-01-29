tic;
% Initial script to form the dataset used across the project
clear;
clc;

% Load the NIST dataset
nistdataset = prnist([0:9], [1:2:1000]); %load 500 objects from each class
nistdataset_small = prnist([0:9], [1:100:1000]);


% Load deskew dataset
load('deskew_data');

%%%% PREPROCESSING PART %%%%
% make a bounding box so that all images have same box and resize the 
% images to 16x16 pixels 
preproc = im_box([],10,1)*im_rotate*im_box([],0)*im_gauss(2)*im_resize([], [16 16]);
preproc_basic = im_box([],0,1)*im_resize([], [16 16]);

preproc_dataset = nistdataset*preproc;
preproc_dataset_basic = nistdataset*preproc_basic;
preproc_dataset_basic_small = nistdataset_small*preproc_basic;

% Pixel representation
% the first representation after converting to prdataset is pixels
% representation
dataset_pixel = prdataset(preproc_dataset);
dataset_pixel_deskew = dataset_deskew;
dataset_pixel_deskew_small = dataset_deskew_small;
dataset_pixel_basic = prdataset(preproc_dataset_basic);
dataset_pixel_basic_small = prdataset(preproc_dataset_basic_small);

% Features representation
% Scenario 1
% extract all features of the image
dataset_features = im_features(dataset_pixel_basic,'all');
% extract profiles of the image
dataset_profiles = im_profile(dataset_pixel_basic,16,16);

% Scenario 2
% extract all features of the image
dataset_features_small = im_features(dataset_pixel_basic_small,'all');
% extract profiles of the image
dataset_profiles_small = im_profile(dataset_pixel_basic_small,16,16);

% Dissimilarity representation
% use small representation of 5% of the whole dataset
% the dissimilarity is based on pixels
% Scenario 1
reps = gendat(dataset_pixel_basic, 0.05);
d_cb = proxm(reps,'c');
d_euc = proxm(reps,'d',2);
dp_cb = dataset_pixel_basic*d_cb;
dp_euc = dataset_pixel_basic*d_euc;

% Scenario 2
reps_small = gendat(dataset_pixel_basic_small, 0.05);
d_cb_small = proxm(reps_small,'c');
d_euc_small = proxm(reps_small,'d',2);
dp_cb_small = dataset_pixel_basic_small*d_cb_small;
dp_euc_small = dataset_pixel_basic_small*d_euc_small;

% separate the dataset into training and test set
[trn_f tst_f] = gendat(dataset_features,0.5);
[trn_p tst_p] = gendat(dataset_profiles,0.5);
[trn_pix tst_pix] = gendat(dataset_pixel,0.5);
[trn_pix_bas tst_pix_bas] = gendat(dataset_pixel_basic,0.5);

running_time = toc;
%%%% END PREPROCESSING %%%%
running_time = toc
%running_time +/- 164.0019
