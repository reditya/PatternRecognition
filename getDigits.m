
% However this process can be used for any check: it is template specific
% In case a check other than aceptgiro is used: the template can be updated
% accordingly
%

image_ = imread('scans/1.jpg'); %load the image file
[x,y,z] = size(image_); % get the size of the image
relevant_area = image_(round(x/6.5):round(x/2.7),round(y/4.96):round(y/1.96),1:z); % get the relevant area of the check
[x_,y_,z_] = size(relevant_area); % size of the relevant area

% array containing the handwritten amount digits
amount = zeros(7,256); 
account = zeros(10,256); 

% define some variables regarding the handwritten digits locantions
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
    binaryDigit = im2bw(currentDigit,graythresh(currentDigit));
    binaryDigit = imcomplement(binaryDigit);
    binaryDigit = imclearborder(binaryDigit);
    binaryDigit = im2double(binaryDigit);
    binaryDigit = imsharpen(binaryDigit);
    %account(:,:,i) = imresize(binaryDigit, [32 32]);
    K = binaryDigit*im_gauss([])*im_resize([],[16 16]);
    amount(i,:) = K(:);    
    %amount(:,:,i) = imresize(binaryDigit, [32 32]);    
    subplot(1,7,i)
    subimage(K)    
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
    binaryDigit = im2bw(currentDigit,graythresh(currentDigit));
    binaryDigit = imcomplement(binaryDigit);
    binaryDigit = imclearborder(binaryDigit);
    binaryDigit = im2double(binaryDigit);
    binaryDigit = imsharpen(binaryDigit);
    %account(:,:,i) = imresize(binaryDigit, [32 32]);
    K = binaryDigit*im_gauss([])*im_resize([],[16 16]);
    account(i,:) = K(:);
    %subplot(1,10,i)
    %subimage(K)
end

% evaluation
prAmount = prdataset(amount);
prAccount = prdataset(account);
% test using classifier with large training set
% load the deskew_data.mat first
W = knnc(dataset_deskew,3);
labAmount = labeld(prAmount,W);
labAccount = labeld(prAccount,W);
