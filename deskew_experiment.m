make_it_tight = true;
subplot = @(m,n,p) subtightplot (m, n, p, [0.01 0.01], [0.01 0.01], [0.01 0.01]);
if ~make_it_tight,  clear subplot;  end

% Create small deskewed dataset for training (10 objects per class)
deskew_dataset = prnist([0:9], [1:100:1000]); 
preproc_basic = im_box([],1,1)*im_resize([],[16 16]);
deskew_dataset = deskew_dataset*preproc_basic;

clear Jarray;
clear Jlabel;

perclass = 10;
dig_class = [0:9];
obj_class = [1:perclass];
digitIdx = ['digit_0';'digit_1';'digit_2';'digit_3';'digit_4';'digit_5';'digit_6';'digit_7';'digit_8';'digit_9']
for i = dig_class
   for j = obj_class
        index = i*perclass + j;    
        obj = data2im(deskew_dataset(index));

        %%% OPENCV IMPLEMENTATION
        % Compute the second moments order and transform the image
        % accordingly
        % Reference : https://opencv-python-tutroals.readthedocs.io/en/latest/py_tutorials/py_ml/py_svm/py_svm_opencv/py_svm_opencv.html
        m = cv.moments(obj);
        skew = getfield(m,'mu11')/getfield(m,'mu02');
        M = [1 skew -0.5*16*skew; 0 1 0];
        J = cv.warpAffine(obj, M, 'Interpolation', 'Linear', 'WarpInverse','1');        
        %%% END OPENCV
        
        preproc1 = im_box([],1,1)*im_resize([],[16 16])*im_gauss([]);
        J = J*preproc1;
        J = imsharpen(J);
        Jarray(index,:) = J(:);
        Jlabel(index,:) = digitIdx(i+1,:);
        axis off;
        subplot(10,10,index);
        subimage(J);
        index
   end
end

dataset_deskew_small = prdataset(Jarray,Jlabel);

% Create big deskewed dataset, 500 objects per class (total 5000 objects)
clear Jarray;
clear Jlabel;

deskew_dataset = prnist([0:9], [1:2:1000]); 
preproc_basic = im_box([],1,1)*im_resize([],[16 16]);
deskew_dataset = deskew_dataset*preproc_basic;

clear Jarray;
clear Jlabel;

perclass = 500;
dig_class = [0:9];
obj_class = [1:perclass];
digitIdx = ['digit_0';'digit_1';'digit_2';'digit_3';'digit_4';'digit_5';'digit_6';'digit_7';'digit_8';'digit_9']
for i = dig_class
   for j = obj_class
        index = i*perclass + j;    
        obj = data2im(deskew_dataset(index));

        %%% OPENCV IMPLEMENTATION
        m = cv.moments(obj);
        skew = getfield(m,'mu11')/getfield(m,'mu02');
        M = [1 skew -0.5*16*skew; 0 1 0];
        J = cv.warpAffine(obj, M, 'Interpolation', 'Linear', 'WarpInverse','1');
        %%% END OPENCV

        preproc1 = im_box([],1,1)*im_resize([],[16 16])*im_gauss([]);
        J = J*preproc1;
        J = imsharpen(J);
        Jarray(index,:) = J(:);
        Jlabel(index,:) = digitIdx(i+1,:);
        subplot(10,10,index)
        subimage(J)
        index
   end
end

dataset_deskew = prdataset(Jarray,Jlabel);

