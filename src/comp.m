clc;clear all;close all;
i=imread('temp/metro.JPG');
i=rgb2gray(i);
 i=imbinarize(i);
i = edge(i, 'sobel');%imshow(im)
i = imdilate(i, strel('diamond', 7));
i = imfill(i, 'holes');
i = imerode(i, strel('diamond', 10));
 i = imopen(i, strel('rectangle', [4 4]));
 i = bwareaopen(i, 200);
%  i=imcomplement(i);
imshow(i)
