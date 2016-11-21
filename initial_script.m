% script for final project
clear;
clc;

% load the dataset
d = prnist([0:9], [1:10:1000]); %load 100 objects from each class
%show(data);

%%%% PREPROCESSING PART %%%%
% make a bounding box so that all images have same box
% resize to 16x16 pixels
preproc = im_box([],0,1)*im_resize([], [16 16])
d2 = d*preproc;
% change to prdataset
d3 = prdataset(d2);
% extract all features of the image
dataset = im_features(d3,d3,'all');
%%%% END PREPROCESSING %%%%


