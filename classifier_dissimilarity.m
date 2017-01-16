% dissimilarity representation
% w = scalem([],'variance')*proxm([],'c');
%w = proxm([],'c');
%clsf_dis_knnc = {w*knnc([],3)};
%clsf_dis_fisherc = {w*fisherc([])};
%e0 = clevalf(trn_set,classifier,featnum,[],1,tst_set);
%[E_knn_f_d,Std_knn_f_d] = prcrossval(dataset_pixel, clsf_dis_knnc, 10, 2);
% [E_fisher_p_d,Std_fisher_p_d] = prcrossval(dataset_pixel, clsf_dis_fisherc, 10, 2);

small_reps = gendat(dataset_pixel, 0.05);
w = proxm(small_reps,'c');
dataset_pixel_dis = dataset_pixel*w;
%scatterd(c*pca(c,2));



