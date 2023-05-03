%CREATE TEMPLATES
%Letter
AU=imread('Letters/AU.bmp');AU=rgb2gray(AU);AU=imbinarize(AU);
A=imread('Letters/A.bmp');A=rgb2gray(A);A=imbinarize(A);
BA=imread('Letters/BA.bmp');BA=rgb2gray(BA);BA=imbinarize(BA);
BHA=imread('Letters/BHA.bmp');BHA=rgb2gray(BHA);BHA=imbinarize(BHA);
E=imread('Letters/E.bmp');E=rgb2gray(E);E=imbinarize(E);
CHA=imread('Letters/CHA.bmp');CHA=rgb2gray(CHA);CHA=imbinarize(CHA);
GA=imread('Letters/ga.bmp');GA=rgb2gray(GA);GA=imbinarize(GA);
GHA=imread('Letters/GHA.png');GHA=rgb2gray(GHA);GHA=imbinarize(GHA);
FA=imread('Letters/FA.bmp');FA=rgb2gray(FA);FA=imbinarize(FA);
JA=imread('Letters/JA.jpg');JA=rgb2gray(JA);JA=imbinarize(JA);
DA=imread('Letters/DA.bmp');DA=rgb2gray(DA);DA=imbinarize(DA);
DHA=imread('Letters/DHA.bmp');DHA=rgb2gray(DHA);DHA=imbinarize(DHA);
DO=imread('Letters/DO.bmp');DO=rgb2gray(DO);DO=imbinarize(DO);
NA=imread('Letters/NA.jpg');NA=rgb2gray(NA);NA=imbinarize(NA);
JHA=imread('Letters/JHA.png');JHA=rgb2gray(JHA);JHA=imbinarize(JHA);
KA=imread('Letters/KA.jpg');KA=rgb2gray(KA);KA=imbinarize(KA);
KHA=imread('Letters/KHA.jpg');KHA=rgb2gray(KHA);KHA=imbinarize(KHA);
HA=imread('Letters/HA.jpg');HA=rgb2gray(HA);HA=imbinarize(HA);
HA2=imread('Letters/ha.bmp');HA2=rgb2gray(HA2);HA2=imbinarize(HA2);
S=imread('char/S.bmp');
TA=imread('Letters/TA.jpg');TA=rgb2gray(TA);TA=imbinarize(TA);
THA=imread('Letters/THA.jpg');THA=rgb2gray(THA);THA=imbinarize(THA);
U=imread('Letters/U.jpg');U=rgb2gray(U);U=imbinarize(U);
THO=imread('Letters/THO.jpg');THO=rgb2gray(THO);THO=imbinarize(THO);
UMA=imread('Letters/uma.jpg');UMA=rgb2gray(UMA);UMA=imbinarize(UMA);
LA=imread('Letters/LA.jpg');LA=rgb2gray(LA);LA=imbinarize(LA);
MA=imread('Letters/MA.jpg');MA=rgb2gray(MA);MA=imbinarize(MA);
RA=imread('Letters/RA.jpg');RA=rgb2gray(RA);RA=imbinarize(RA);
SA=imread('Letters/SA.jpg');SA=rgb2gray(SA);SA=imbinarize(SA);
SHA=imread('Letters/SHA.jpg');SHA=rgb2gray(SHA);SHA=imbinarize(SHA);
GHAFILL=imread('Letters/gha2.bmp');GHAFILL=rgb2gray(GHAFILL);GHAFILL=imbinarize(GHAFILL);
SHA=imread('Letters/SHA.jpg');SHA=rgb2gray(SHA);SHA=imbinarize(SHA);
Qfill=imread('char/fillR.bmp');




%Number
one=imread('Numbers/1(1).jpg');one=rgb2gray(one);one=imbinarize(one);
two=imread('Numbers/2(1).jpg');two=rgb2gray(two);two=imbinarize(two);
three=imread('Numbers/3(1).jpg');three=rgb2gray(three);three=imbinarize(three);
four=imread('Numbers/4.jpg');four=rgb2gray(four);four=imbinarize(four);
five=imread('Numbers/5(1).jpg');five=rgb2gray(five);five=imbinarize(five);
six=imread('Numbers/6(1).jpg');six=rgb2gray(six);six=imbinarize(six);
seven=imread('Numbers/7(1).jpg');seven=rgb2gray(seven);seven=imbinarize(seven);
eight=imread('Numbers/8(1).jpg');eight=rgb2gray(eight);eight=imbinarize(eight);
nine=imread('Numbers/9.jpg'); nine=rgb2gray(nine);nine=imbinarize(nine);
zero=imread('Numbers/0(1).jpg');zero=rgb2gray(zero);zero=imbinarize(zero);
zerofill=imread('Numbers/0.bmp');zerofill=rgb2gray(zerofill);zerofill=imbinarize(zerofill);
fivefill=imread('Numbers/5.png');fivefill=rgb2gray(fivefill);fivefill=imbinarize(fivefill);
sixfill=imread('char/fill6.bmp');
sevenfill=imread('Numbers/7.bmp');sevenfill=rgb2gray(sevenfill);sevenfill=imbinarize(sevenfill);
eightfill=imread('char/fill8.bmp');
ninefill=imread('Numbers/9.bmp');ninefill=rgb2gray(ninefill);ninefill=imbinarize(ninefill);
ninefill2=imread('char/fill9_2.bmp');

%district
dhaka=imread('District/dhaka.bmp');dhaka=rgb2gray(dhaka);dhaka=imbinarize(dhaka);
raj=imread('District/raj.bmp');raj=rgb2gray(raj);raj=imbinarize(raj);
metro=imread('District/metro.bmp');metro=rgb2gray(metro);metro=imbinarize(metro);
dha=imread('District/dha.png');dha=rgb2gray(dha);dha=imbinarize(dha);
chatto=imread('District/Chattogram.png');chatto=rgb2gray(chatto);chatto=imbinarize(chatto);
chatto2=imread('District/chatt.png');chatto2=rgb2gray(chatto2);chatto2=imbinarize(chatto2);
metro2=imread('District/mwtr.png');metro2=rgb2gray(metro2);metro2=imbinarize(metro2);
district=[dhaka raj metro dha chatto chatto2 metro2];
%*-*-*-*-*-*-*-*-*-*-*-
letter=[GA RA A SA BA BHA SHA E CHA AU GHA HA JA DA DHA DO NA JHA KA HA2 KHA Qfill FA S TA THA U THO UMA LA MA GHAFILL];

number=[one two three four five fivefill six sixfill seven sevenfill eight eightfill nine ninefill ninefill2 zero zerofill];



character=[letter number district];

NewTemplates=mat2cell(character,42,[24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 24 24 24 24 24]);





save ('NewTemplates','NewTemplates')
clear all