% dissimilarity representation
w = scalem([],'variance')*proxm([]);
clsf_dis_knnc = {w*knnc([],3)};
clsf_dis_fisherc = {w*fisherc([])};
%e0 = clevalf(trn_set,classifier,featnum,[],1,tst_set);
% [E_knn_f_d,Std_knn_f_d] = prcrossval(dataset_pixel, clsf_dis, 10, 2);
[E_fisher_p_d,Std_fisher_p_d] = prcrossval(dataset_pixel, clsf_dis_fisherc, 10, 2);



