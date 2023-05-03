%% Number Plate Detection
clc;
close all;
clear all;

%% Read Image
im = imread('img/259.jpg');

% figure
% subplot(4,2,1); imshow(im); title('Original Image');

%% 
im = imresize(im, [480 NaN]);%subplot(4,2,2); imshow(im);
imor=im;
imgray = rgb2gray(im);%subplot(4,2,3); imshow(imgray);
imbin = imbinarize(imgray);%subplot(4,2,4); imshow(imbin);
im = edge(imgray, 'sobel');subplot(2,2,1); imshow(im);title('Edge Detection');
im = imdilate(im, strel('diamond', 2));subplot(2,2,2); imshow(im);title('Dialated Image');
im = imfill(im, 'holes');subplot(2,2,3); imshow(im);title('Holes Filled');
im = imerode(im, strel('diamond', 10));subplot(2,2,4); imshow(im);title('Deteriorated Image');

%% Finding the maximum sized rectangle

Iprops=regionprops(im,'BoundingBox','Area', 'Image','Circularity');
area = Iprops.Area;
count = numel(Iprops);
maxa= area;
boundingBox = Iprops.BoundingBox;
figure
for i=1:count
    i
    Iprops(i).Circularity
    
    subplot(4,4,i),imshow(Iprops(i).Image)
[HR,WR]=size(Iprops(i).Image);
if (WR/HR)>3 
    continue;
end
    
   if maxa<Iprops(i).Area
       maxa=Iprops(i).Area;
       boundingBox=Iprops(i).BoundingBox;
   end
end    

% All the above steps are to find the location of number plate
%'Boundingbox' is the position where the number plate is located

%% Extract Number plate 

%crop the numberplate region using boundingbox
im = imcrop(imbin, boundingBox);

%resize number plate to 240 NaN
im = imresize(im, [240 NaN]);

%clear dust
% im = imopen(im, strel('rectangle', [4 4]));

%remove some object if it width is too long or too small than 500
% im = bwareaopen(~im, 400);
%  subplot(312), imshow(im)
[h, w] = size(im);
% im=imcrop(im, [1 h/2+10 w h]);
% subplot(3,1,3); 
figure(3),imshow(im); title('Detected Number Plate')
