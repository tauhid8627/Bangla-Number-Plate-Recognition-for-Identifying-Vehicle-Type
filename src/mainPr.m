function [car,type,district,noPlate,OrIm]=mainPr()
%% Number Plate Detection
clc;
% close all;
clear all;

%% Read Image
% im = imread('img/167.jpg');
% figure(1)
% subplot(2,2,1); imshow(im); title('Original Image');
[filename, pathname] = uigetfile({'*.jpg';'*.slx';'*.mat'},...
'File Selector');
full=[ pathname filename];
im=imread(full);
OrIm=im;
%% 

im = imresize(im, [480 NaN]);
imgray = rgb2gray(im);
imbin = imbinarize(imgray);
im = edge(imgray, 'sobel');%imshow(im)
im = imdilate(im, strel('diamond', 2));
im = imfill(im, 'holes');
im = imerode(im, strel('diamond', 10));


%% Finding the maximum sized rectangle

Iprops=regionprops(im,'BoundingBox','Area', 'Image');
area = Iprops.Area;
count = numel(Iprops);
maxa= area;
boundingBox = Iprops.BoundingBox;
for i=1:count
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
[h, w] = size(im);
% subplot(222), imshow(im);title('Detected Number Plate');
imdis=imcrop(im,[1 1 0.8*w h/2]);
imtype=imcrop(im,[0.75*w 0.25*h/2 w h/2-0.1*h/2]);
im=imcrop(im, [1 h/2+8 w h]);
[hn,wn]=size(im);

%resize number plate to 240 NaN
im = imresize(im, [240 NaN]);
imdis=imresize(imdis, [240 NaN]);
%clear dust
 im = imopen(im, strel('rectangle', [4 4]));

%remove some object if it width is too long or too small than 500
 im = bwareaopen(~im, 500);
 
 imdis = imopen(imdis, strel('rectangle', [4 4]));
 imdis=bwareaopen(imdis,700);
 imdis=imcomplement(imdis);
 
 imtype = imopen(imtype, strel('rectangle', [2 2]));
 imtype=bwareaopen(imtype,700);
 imtype=imcomplement(imtype);
 
 




%% read Number
Iprops=regionprops(im,'BoundingBox','Area', 'Image');
count = numel(Iprops);

noPlate=[]; % Initializing the variable of number plate string.
% figure(2)
plot=1;
numH=[];
numW=[];

% % for i=2:count-1
% %     ow = length(Iprops(i).Image(1,:));  
% %     oh = length(Iprops(i).Image(:,1)); 
% %     numH=[numH oh];
% %     numW=[numW ow];
% % end
% % meanH=mean(numH);
% % meanW=mean(numW);
% % if count>7
% % for i=1:count
% %     
% %    ow = length(Iprops(i).Image(1,:));  %width of the region
% %    oh = length(Iprops(i).Image(:,1));  %height of the region
% %     if ow>=meanW-6 & ow<=meanW+6 & oh>=meanH-7 &oh<=meanH+7
% %        letter=readLetter(Iprops(i).Image); % Reading the letter corresponding the binary image 'N'.
% %        subplot(1,count,plot);imshow(Iprops(i).Image);plot=plot+1;
% %        title(Iprops(i).BoundingBox);
% %        noPlate=[noPlate letter]; % Appending every subsequent character in noPlate variable.
% %    end
% % 
% % end
% % if count==7 || count==6
for i=1:count
    
    ow = length(Iprops(i).Image(1,:));  %width of the region
    oh = length(Iprops(i).Image(:,1));  %height of the region
if  oh>=hn/1.4 & ow>=wn/4
    letter=readLetter(Iprops(i).Image); % Reading the letter corresponding the binary image 'N'.
%     subplot(1,count,plot);imshow(Iprops(i).Image);plot=plot+1;
%     title(letter);
    noPlate=[noPlate letter]; % Appending every subsequent character in noPlate variable.
    %    end
end
end

%% Read District

Iprops2=regionprops(imdis,'BoundingBox','Area', 'Image');
count2 = numel(Iprops2);
plot2=1;
district=[];
% figure(3)
for i=1:count2
    
    ow = length(Iprops2(i).Image(1,:));  %width of the region
    oh = length(Iprops2(i).Image(:,1));  %height of the region
     if oh>=h/5 
 letter2=readChar(Iprops2(i).Image); % Reading the letter corresponding the binary image 'N'.
%     subplot(1,count2,plot2);imshow(Iprops2(i).Image);plot2=plot2+1;
%     title(letter2);
    district=[district letter2]; % Appending every subsequent character in noPlate variable.
       end
    %     end
end
district=erase(district,'-');
district=erase(district,'METRO');
disSize=size(district);
if disSize==0
    district='DhaKa';
end
% figure(1)
%  subplot(223); imshow(im); title(noPlate);
%  subplot(224);imshow(imdis);title(district);
%  
 %% Read Character
 
Iprops3=regionprops(imtype,'BoundingBox','Area', 'Image');
count3 = numel(Iprops3);
type=[];
for i=1:count3
    letter3=readChar(Iprops3(i).Image);
    type=[letter3 type];
%     figure(4)
%     subplot(122),imshow(Iprops3(i).Image);
end
type=erase(type,'-');
% figure(4)
% subplot(121),imshow(imtype);title(type);
car=[];
[ff,ts]=size(type);
if ts==2
if type=='GA'
    car='Private Car';
elseif type=='HA'
    car='Bike';
end
end
if ts==3
if type=='GHA'
        car='SUV';
elseif type=='CHA'
        car='MicroBus';
end
end
 