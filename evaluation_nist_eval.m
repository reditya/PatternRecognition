% evaluation using my_rep function
% to evaluate using nist_eval, we will only do it for pixel representation
% which is the best in our case

wparzen = dataset_pixel_basic*(parzenc([]));
wqdc = dataset_pixel_basic*(qdc([]));
wqdc_pca = dataset_pixel_basic*(pcam([],40)*qdc([]));
wldc = dataset_pixel_basic*(ldc([]));
wknnc = dataset_pixel_basic*(knnc([],3));
wadaboost = adaboostc(dataset_pixel_basic,parzenc([],0.25),100);


errparzen = nist_eval('my_rep',wparzen,100);
errqdc = nist_eval('my_rep',wqdc,100);
errqdc_pca = nist_eval('my_rep',wqdc_pca,100);
errldc = nist_eval('my_rep',wldc,100);
errknnc = nist_eval('my_rep',wknnc,100);
erradaboostc = nist_eval('my_rep',wadaboost,100);
