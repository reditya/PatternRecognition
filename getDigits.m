
% However this process can be used for any check: it is template specific
% In case a check other than aceptgiro is used: the template can be updated
% accordingly
%

image_ = imread('tstcheck.jpg'); %load the image file
[x,y,z] = size(image_); % get the size of the image
relevant_area = image_(round(x/6.5):round(x/2.7),round(y/5):round(y/1.96),1:z); % get the relevant area of the check
[x_,y_,z_] = size(relevant_area); % size of the relevant area

% array containing the handwritten amount digits
amount = zeros(32,32,5); 
account = zeros(32,32,10); 

% define some variables regarding the handwritten digits locantions
startX = round(x_/15);
endX = round(x_/2.5);
startY = round(y_/57);
stepSize = round(y_/10);

%get the handwritten digits for the amount
for i = 1:5
    endY = stepSize*i;
    currentStart = stepSize*(i-1);
    currentDigit = relevant_area(startX:endX,startY+currentStart:endY,1:z);
    binaryDigit = im2bw(currentDigit,graythresh(currentDigit));
    amount(:,:,i) = imresize(binaryDigit, [32 32]);
    
end

%define some variables for the digit locations
startX = round(x_/1.7);
endX = x_ - round(x_/57);
startY = round(y_/57);
stepSize = round(y_/10);

% get the handwritten digits for the account info
for i = 1:10
    endY = stepSize*i;
    currentStart = stepSize*(i-1);
    currentDigit = relevant_area(startX:endX,startY+currentStart:endY,1:z);
    binaryDigit = im2bw(currentDigit,graythresh(currentDigit));
    account(:,:,i) = imresize(binaryDigit, [32 32]);
end