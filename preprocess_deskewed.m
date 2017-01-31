% This function will transform prnist dataset into deskewed images
% prdataset
function result = my_rep(dataset)
    deskew_dataset = dataset;
    preproc_basic = im_box([],1,1)*im_resize([],[16 16]);
    deskew_dataset = deskew_dataset*preproc_basic;

    clear Jarray;
    clear Jlabel;

    perclass = size(dataset,1)/10;
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
            %subplot(10,10,index)
            %subimage(J)
            %index
       end
    end

    result = prdataset(Jarray,Jlabel);
end