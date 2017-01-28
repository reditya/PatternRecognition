tic;
% Initial script to form the dataset used across the project
clear;
clc;

% Load the NIST dataset
nistdataset = prnist([0:9], [1:100:1000]); %load 500 objects from each class

% Load deskew dataset
load('deskew_data');

%%%% PREPROCESSING PART %%%%
% make a bounding box so that all images have same box and resize the 
% images to 16x16 pixels #need to find reference why 16x16#

preproc = im_box([],10,1)*im_rotate*im_box([],0)*im_gauss(2)*im_resize([], [16 16]);
preproc_basic = im_box([],0,1)*im_resize([], [16 16]);

preproc_dataset = nistdataset*preproc;
preproc_dataset_basic = nistdataset*preproc_basic;
% change to prdataset
% the first representation after converting to prdataset is pixels
% representation
dataset_pixel = prdataset(preproc_dataset);
dataset_pixel_deskew = dataset_deskew;
dataset_pixel_deskew_small = dataset_deskew_small;
dataset_pixel_basic = prdataset(preproc_dataset_basic);
% extract all features of the image
dataset_features = im_features(dataset_pixel,'all');
% extract profiles of the image
dataset_profiles = im_profile(dataset_pixel,16,16);
% separate the dataset into training and test set
[trn_f tst_f] = gendat(dataset_features,0.5);
[trn_p tst_p] = gendat(dataset_profiles,0.5);
[trn_pix tst_pix] = gendat(dataset_pixel,0.5);
[trn_pix_bas tst_pix_bas] = gendat(dataset_pixel_basic,0.5);
%%%% END PREPROCESSING %%%%
running_time = toc
%running_time +/- 164.0019
