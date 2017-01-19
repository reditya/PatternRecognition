function result = my_rep(dataset)
    preproc_basic = im_box([],0,1)*im_resize([], [16 16]);
    preproc_dataset_basic = dataset*preproc_basic;
    %pixel representation
    d_pixel = prdataset(preproc_dataset_basic);
    %feature representation
    d_features = im_features(d_pixel,'all');
    d_profiles = im_profile(d_pixel,16,16);
    %dissimilarity representation
    %small_reps = gendat(d_pixel, 0.05);
    %dis_cityblock = proxm(small_reps,'c');
    %dis_euclidean = proxm(small_reps,'d',2);
    %d_cityblock = d_pixel*dis_cityblock;
    %d_euclidean = d_pixel*dis_euclidean;   
    result = d_pixel;
end
