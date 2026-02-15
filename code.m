

% Read and display the image
img = imread('real_img.jpeg');
imshow(img);

% Convert the image to grayscale and display it
gray_img = rgb2gray(img);
imshow(gray_img);
imwrite(gray_img,'gray_img.png')

% Converting image to double
double_img = im2double(gray_img);
imshow(double_img)
imwrite(double_img,'double_img.png')

% Adding Gaussian noise to image
sigma = 20;
sigma_normalised = sigma/255;
variance = sigma_normalised^2;
gauss_img = imnoise(double_img,"gaussian",0,variance);
imshow(gauss_img)
imwrite(gauss_img,"gauss_img.png")

% Adding salt and pepper noise to the image
sns_img = imnoise(gauss_img,"salt & pepper",0.05);
imshow(sns_img)
imwrite(sns_img,'salt&pepper_img.png')

% % Using a 3x3 mean filter in the noisy image
% kernel3 = ones(3,3)/9;
% mean_3 = imfilter(sns_img, kernel3);
% imshow(mean_3);
% imwrite(mean_3,"mean_3.png")

% % Using a 5x5 mean filter in the image
% kernel5 = ones(5,5)/25;
% mean_5 = imfilter(sns_img, kernel5);

% imshow(mean_5);
% imwrite(mean_5,"mean_5.png")

% % Using a 7x7 mean filter in the image
% kernel7 = ones(7,7)/49;
% mean_7 = imfilter(sns_img, kernel7);

% imshow(mean_7);
% imwrite(mean_7,"mean_7.png")

% % Using a 3x3 median filter in the image
% median_3 = medfilt2(sns_img,[3,3]);
% imshow(median_3);
% imwrite(median_3,"median_3.png")

% % Using a 5x5 median filter in the image
% median_5 = medfilt2(sns_img,[5,5]);
% imshow(median_5);
% imwrite(median_5,"median_5.png")

% % Using a 7x7 median filter in the image
% median_7 = medfilt2(sns_img,[7,7]);
% imshow(median_7);
% imwrite(median_7,"median_7.png")

% Using a 3x3 Gaussian filter in the image
gauss_kernel3 = fspecial('gaussian', [3 3], 1);
gauss_3 = imfilter(sns_img, gauss_kernel3, 'replicate');
figure; imshow(gauss_3);
title('Gaussian Filter 3x3');
imwrite(gauss_3,"gauss_3.png")

% Using a 5x5 Gaussian filter in the image
gauss_kernel5 = fspecial('gaussian', [5 5], 1);
gauss_5 = imfilter(sns_img, gauss_kernel5, 'replicate');
figure; imshow(gauss_5);
title('Gaussian Filter 5x5');
imwrite(gauss_5,"gauss_5.png")

% Using a 7x7 Gaussian filter in the image
gauss_kernel7 = fspecial('gaussian', [7 7], 1);
gauss_7 = imfilter(sns_img, gauss_kernel7, 'replicate');
figure; imshow(gauss_7);
title('Gaussian Filter 7x7');
imwrite(gauss_7,"gauss_7.png")