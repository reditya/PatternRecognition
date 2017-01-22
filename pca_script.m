% using pca and evaluate with clevalf
featnum = [1:2:64];
% featnum = [1:10:250];
res_qdc = zeros(size(featnum));
% res_dis = zeros(size(featnum));
for c = featnum
    classifier = qdc([]);
    %classifier = svc([],proxm('r',2));
    %[trn,tst] = gendat(dataset_pixel,0.5);
    wp = pcam([],c);
    %clsf = knnc(trn,3)*wp;
    %res(c) = testc(tst,clsf);
    res_qdc(c) = prcrossval(dataset_deskew,wp*classifier,10,1);
    c
%    res_knnc(c)
end
%featnum = [1:1:256];
%Ecleval_2 = clevalf(dataset_pixel,wp*classifier,featnum,[],1);

% combiner (2,3,4-NN)
w1 = pcam([],42)*knnc([],3);
w2 = pcam([],42)*knnc([],4);
w3 = parzenc([]);
combinerProd = [w1 w2]*prodc;
combinerMean = [w1 w2]*meanc;
combinerMin = [w1 w2]*minc;
combinerMax = [w1,w2,w3]*medianc;
combinerMedian = [w1 w2]*medianc;
combinerVote = [w1 w2]*votec;
%combinerAll = {combinerProd, combinerMean, combinerMin, combinerMax, combinerMedian, combinerVote};
%[E_pix, S_pix] = prcrossval(dataset_pixel, combinerAll, 10, 2);
%[E_pix_prod, S_pix_prod] = prcrossval(dataset_pixel, combinerProd, 10, 2);
%[E_pix_mean, S_pix_mean] = prcrossval(dataset_pixel, combinerMean, 10, 2);
%[E_pix_min, S_combiner_dis_min] = prcrossval(dataset_pixel, combinerMin, 10, 2);
[E_pix_max, S_pix_max] = prcrossval(dataset_pixel, combinerMax, 10, 1);
%[E_pix_median, S_pix_median] = prcrossval(dataset_pixel, combinerMedian, 10, 2);
%[E_pix_vote, S_pix_vote] = prcrossval(dataset_pixel, combinerProd, 10, 2);
