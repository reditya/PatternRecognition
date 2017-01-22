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
        % http://stackoverflow.com/questions/27684478/how-do-i-calculate-the-central-moment-in-an-image
        % computing moment
        % combined with : https://github.com/grfiv/MNIST/blob/fc5ed37dc00ab24ae2d4aba91712795637528e1d/deskew.ipynb
        obj = data2im(deskew_dataset(index));
        %obj = im2bw(obj);
        %obj = im2double(obj);
        %sz = size( obj ); %// assuming image is gray scale - 2D array
        %x = ( 1:sz(2) );
        %y = ( 1:sz(1) ).'; %'
        %x = x - mean(x);
        %y = y - mean(y);
        %Mpq = sum( reshape( bsxfun( @times, bsxfun( @times, img, x.^p ), y.^q ), [], 1 ) ); %// computing the p-q moment
        %M11 = sum( reshape( bsxfun( @times, bsxfun( @times, obj, x.^1 ), y.^1 ), [], 1 ) ); %// computing the p-q moment
        %M02 = sum( reshape( bsxfun( @times, bsxfun( @times, obj, x.^0 ), y.^2 ), [], 1 ) ); %// computing the p-q moment
        %skew = M11 / M02;
        
        % transform the image
        %tform = affine2d([1 1 0 ;skew 1 0; 0 0 1]);
        
        %%% OPENCV IMPLEMENTATION
        m = cv.moments(obj);
        skew = getfield(m,'mu11')/getfield(m,'mu02');
        M = [1 skew -0.5*16*skew; 0 1 0];
        J = cv.warpAffine(obj, M, 'Interpolation', 'Linear', 'WarpInverse','1');
        
        %%% END OPENCV
        %J = imwarp(obj,tform);
        %J = im2bw(J);
        preproc1 = im_box([],1,1)*im_resize([],[16 16])*im_gauss([]);
        J = J*preproc1;
        J = imsharpen(J);
        %J = imresize(J,[16 16]);
        Jarray(index,:) = J(:);
        Jlabel(index,:) = digitIdx(i+1,:);
        subplot(10,10,index)
        subimage(J)
        index
   end
end

dataset_deskew_small = prdataset(Jarray,Jlabel);
