% This function will transform the prnist dataset into pixel representation
function result = my_rep(dataset)
    preproc_basic = im_box([],0,1)*im_resize([], [16 16]);
    preproc_dataset_basic = dataset*preproc_basic;
    %pixel representation
    d_pixel = prdataset(preproc_dataset_basic);
    result = d_pixel;
end
