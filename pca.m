% using pca and evaluate with clevalf
featnum = [1:1:256];
res_qdc = zeros(size(featnum));
for c = featnum
    classifier = ldc([]);
    %classifier = svc([],proxm('r',2));
    %[trn,tst] = gendat(dataset_pixel,0.5);
    wp = pcam([],c);
    %clsf = knnc(trn,3)*wp;
    %res(c) = testc(tst,clsf);
    res_ldc(c) = prcrossval(dataset_pixel,wp*classifier,10,1);
end
%featnum = [1:1:256];
%Ecleval_2 = clevalf(dataset_pixel,wp*classifier,featnum,[],1);
