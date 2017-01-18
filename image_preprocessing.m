close all;
clear;
clc;

prwaitbar off
prwarning off

nistdataset = prnist([0:9], [1:100:1000]);
preproc = im_box([],10,1)*im_rotate*im_box([],0)*im_gauss(2)*im_resize([], [16 16]);

% preprocessing on one image.
img = nistdataset(10,:);
show(img);
figure;
preproc_img = img*preproc;
show(preproc_img);
%figure;
%show(reshape(+preproc_img,[16,16]));

% preprocessing on whole set.
figure;
show(nistdataset, 10);
figure;
show(nistdataset*preproc, 10)