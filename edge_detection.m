clc;
clear;
close all;

% Read Image
img = imread('peppers.png');  % You can change image
gray_img = rgb2gray(img);

% Display Original Image
figure;
subplot(2,3,1);
imshow(img);
title('Original Image');

% Grayscale Image
subplot(2,3,2);
imshow(gray_img);
title('Grayscale Image');

% Edge Detection - Sobel
sobel_edge = edge(gray_img, 'sobel');
subplot(2,3,3);
imshow(sobel_edge);
title('Sobel Edge Detection');

% Edge Detection - Prewitt
prewitt_edge = edge(gray_img, 'prewitt');
subplot(2,3,4);
imshow(prewitt_edge);
title('Prewitt Edge Detection');

% Edge Detection - Canny
canny_edge = edge(gray_img, 'canny');
subplot(2,3,5);
imshow(canny_edge);
title('Canny Edge Detection');

% Laplacian Filter
laplacian_filter = fspecial('laplacian');
laplacian_edge = imfilter(gray_img, laplacian_filter);

subplot(2,3,6);
imshow(laplacian_edge, []);
title('Laplacian Edge Detection');

% Histogram Analysis
figure;
imhist(gray_img);
title('Histogram of Grayscale Image');

% Add Noise
noisy_img = imnoise(gray_img, 'gaussian', 0, 0.01);

figure;
subplot(1,2,1);
imshow(noisy_img);
title('Noisy Image');

% Noise Removal using Median Filter
filtered_img = medfilt2(noisy_img);

subplot(1,2,2);
imshow(filtered_img);
title('Filtered Image');