close all;
clear;
clc;

prwaitbar off
prwarning off

nistdataset = prnist([0:9], [1:100:1000]);
%preproc = im_box([],10,1)*im_rotate*im_rotate(pi/2)*im_box([],0)*im_gauss(2)*im_resize([], [16 16]);
preproc = im_box([],10,1)*im_rotate*im_box([],0)*im_gauss(2)*im_resize([], [16 16]);
preproc_basic = im_box([],0,1)*im_resize([], [16 16]);

% preprocessing on one image.
img = nistdataset(20,:);
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
show(nistdataset*preproc, 10);
figure;
show(nistdataset*preproc_basic, 10);

%dipimage usage
%doubles = data2im(img);
%figure;
%imshow(doubles)
%figure;
%preproc_dip_image = closing(doubles,10,'elliptic');
%imshow(double(preproc_dip_image));