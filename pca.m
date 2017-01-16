% using pca and evaluate with clevalf
featnum = [1:1:256];
% featnum = [1:10:250];
res_knnc = zeros(size(featnum));
% res_dis = zeros(size(featnum));
for c = featnum
    classifier = knnc([], 3);
    %classifier = svc([],proxm('r',2));
    %[trn,tst] = gendat(dataset_pixel,0.5);
    wp = pcam([],c);
    %clsf = knnc(trn,3)*wp;
    %res(c) = testc(tst,clsf);
    res_knnc(c) = prcrossval(dataset_pixel,wp*classifier,10,1);
end
%featnum = [1:1:256];
%Ecleval_2 = clevalf(dataset_pixel,wp*classifier,featnum,[],1);
