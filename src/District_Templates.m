%district
dhaka=imread('District/dhaka.bmp');dhaka=rgb2gray(dhaka);dhaka=imbinarize(dhaka);
raj=imread('District/raj.bmp');raj=rgb2gray(raj);raj=imbinarize(raj);
metro=imread('District/metro.bmp');metro=rgb2gray(metro);metro=imbinarize(metro);

district=[dhaka raj metro];
DisTemplates=mat2cell(district,42,[24 24 24]);

save ('DisTemplates','DisTemplates')
clear all
    