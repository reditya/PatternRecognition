deskew_dataset = prnist([1], [1:100:1000]); 
preproc_basic = im_box([],0,1);
deskew_dataset = deskew_dataset*preproc_basic;

dig_class = [0:9];
obj_class = [1:10];
for i = dig_class
   for j = obj_class
        digit = i;
        index = i*10 + j;       
        img = data2im(deskew_dataset(index));
        img = img(:, :, 1);
        img = double(img);

        % perform pca on cloud of white points
        [r, c] = find(img);
        coeff = pca([r,c]);
        angle = atan2(coeff(1,1), coeff(1,2));

        % rotate back
        img = imrotate(img, angle / pi * 180);
        show(img);
   end
end

       %digit = i;
       %index = i*10 + j;
       %tmp = 255*data2im(deskew_dataset(index));
       %[dst,theta] = imdeskew(tmp,45);
       %output = imrotate(tmp,theta,'loose');
       %output = imresize(output,[16 16]);
       %result = prdataset(output);

img = 255*data2im(deskew_dataset(10));
img = img(:, :, 1);
img = double(img);

% perform pca on cloud of white points
[r, c] = find(img);
coeff = pca([r,c]);
angle = atan2(coeff(1,1), coeff(1,2));

% rotate back
img = imrotate(img, angle / pi * 180-90);
show(img);
        