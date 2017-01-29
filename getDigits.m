make_it_tight = true;
subplot = @(m,n,p) subtightplot (m, n, p, [0.01 0.01], [0.01 0.01], [0.01 0.01]);
if ~make_it_tight,  clear subplot;  end

% However this process can be used for any check: it is template specific
% In case a check other than aceptgiro is used: the template can be updated
% accordingly

% array containing the handwritten digits
amount = zeros(98,256); 
account = zeros(140,256); 

for j=1:14
    img_list = strcat('scans/',int2str(j),'.jpg');
    image_ = imread(img_list); %load the image file
    [x,y,z] = size(image_); % get the size of the image
    relevant_area = image_(round(x/6.5):round(x/2.7),round(y/4.96):round(y/1.96),1:z); % get the relevant area of the check
    [x_,y_,z_] = size(relevant_area); % size of the relevant area

    % define some variables regarding the handwritten digits locations
    startX = floor(x_/15);
    endX = floor(x_/2.5);
    startY = floor(y_/57);
    stepSize = floor(y_/10);

    %get the handwritten digits for the amount
    for i = 1:7
        endY = stepSize*i;
        currentStart = stepSize*(i-1);
        if i > 5
            endY = stepSize*(i+1);
            currentStart = stepSize*(i);
        end
        currentDigit = relevant_area(startX:endX,startY+currentStart:endY,1:z);
        currentDigit = imcrop(currentDigit,[5 7 30 30]);
        binaryDigit = im2bw(currentDigit,graythresh(currentDigit));
        binaryDigit = imcomplement(binaryDigit);
        %binaryDigit = imclearborder(binaryDigit);
        binaryDigit = im2double(binaryDigit);
        binaryDigit = imsharpen(binaryDigit);
        %account(:,:,i) = imresize(binaryDigit, [32 32]);
        K = binaryDigit;
        K = K*im_box([],1,1);

        m = cv.moments(K);
        skew = getfield(m,'mu11')/getfield(m,'mu02');
        M = [1 skew -0.5*16*skew; 0 1 0];
        K = cv.warpAffine(K, M, 'Interpolation', 'Linear', 'WarpInverse','1');      
        %K = imsharpen(K);
        K = K*im_gauss([])*im_center([])*im_resize([],[16 16]);
        
        index = i+(j-1)*7;
        amount(index,:) = K(:);
        %axis off
        %subplot(14,7,index)
        %subimage(K)  
    end

    %define some variables for the digit locations
    startX = floor(x_/1.7);
    endX = x_ - floor(x_/57);
    startY = floor(y_/57);
    stepSize = floor(y_/10);

    % get the handwritten digits for the account info
    for i = 1:10
        endY = stepSize*i;
        currentStart = stepSize*(i-1);
        currentDigit = relevant_area(startX:endX,startY+currentStart:endY,1:z);
        currentDigit = imcrop(currentDigit,[5 7 30 30]);
        binaryDigit = im2bw(currentDigit,graythresh(currentDigit));
        binaryDigit = imcomplement(binaryDigit);
        %binaryDigit = imclearborder(binaryDigit);
        binaryDigit = im2double(binaryDigit);
        binaryDigit = imsharpen(binaryDigit);
        %account(:,:,i) = imresize(binaryDigit, [32 32]);
        K = binaryDigit;
        K = K*im_box([],1,1);

        m = cv.moments(K);
        skew = getfield(m,'mu11')/getfield(m,'mu02');
        M = [1 skew -0.5*16*skew; 0 1 0];
        K = cv.warpAffine(K, M, 'Interpolation', 'Linear', 'WarpInverse','1');      
        %K = imsharpen(K);
        K = K*im_gauss([])*im_center([])*im_resize([],[16 16]);
        
        index = i+(j-1)*10;
        account(index,:) = K(:);
        axis off;
        figure(1)
        subplot(14,10,index)
        subimage(K)
        figure(2)
        subplot(14,10,index)
        subimage(currentDigit)        
    end
end

% Original label for digits data
orig_labAmount = ['digit_0';'digit_1';'digit_2';'digit_3';'digit_4';'digit_5';'digit_6'];
orig_labAmount = repmat(orig_labAmount,14,1);
orig_labAccount = ['digit_0';'digit_1';'digit_2';'digit_3';'digit_4';'digit_5';'digit_6';'digit_7';'digit_8';'digit_9'];
orig_labAccount = repmat(orig_labAccount,14,1);

prAmount = prdataset(amount,orig_labAmount);
prAccount = prdataset(account,orig_labAccount);

% Evaluation using Scenario 1
we1_1 = pcam(dataset_pixel_basic,40)*knnc([],3);
we2_1 = pcam(dataset_pixel_basic,32)*parzenc([],1.20);  % h is from optimizing parzenc using built-in function in parzenc.m
we3_1 = pcam(dataset_pixel_basic,45)*qdc([]);
combined_we_1 = [we1_1 we2_1 we3_1];
W = dataset_pixel_basic*combined_we_1*medianc;
% Error rate
Eam_1 = prAmount*W*testc;
Eac_1 = prAccount*W*testc;
% Eam_1 = 0.3673
% Eac_1 = 0.4429

% Evaluation using Scenario 2
we1_2 = pcam(dataset_deskew_small,22)*parzenc([],0.78); % h is from optimizing parzenc using built-in function in parzenc.m
we2_2 = pcam(dataset_deskew_small,22)*ldc([]);
we3_2 = pcam(dataset_deskew_small,21)*fisherc([]);
combined_we_2 = [we1_2 we2_2 we3_2];
W = dataset_deskew_small*combined_we_2*prodc;
% Error rate
Eam_2 = prAmount*W*testc;
Eac_2 = prAccount*W*testc;
% Eam_2 = 0.7347
% Eac_2 = 0.6786
