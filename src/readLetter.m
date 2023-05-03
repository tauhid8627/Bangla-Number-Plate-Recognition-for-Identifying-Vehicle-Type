function letter=readLetter(snap)

load NewTemplates
snap=imresize(snap,[42 24]);
comp=[ ];
for n=1:length(NewTemplates)
    sem=corr2(NewTemplates{1,n},snap);
    comp=[comp sem];
    %display(sem);
    
end
% figure
% stem(comp),grid on
vd=find(comp==max(comp));
%display(max(comp));
%*-*-*-*-*-*-*-*-*-*-*-*-*-
% Accodrding to the index assign to 'letter'.
% Alphabets listings.
% if vd==1
%     letter='GA';
% elseif vd==2
%     letter='RA';
% elseif vd==3
%     letter='A';
% elseif vd==4
%     letter='SA';
% elseif vd==5
%     letter='BA';
% elseif vd==6
%     letter='BHA';
% elseif vd==7
%     letter='SHA';
% elseif vd==8
%     letter='E';
% elseif vd==9
%     letter='CHA';
% elseif vd==10
%     letter='AU';
% elseif vd==11
%     letter='GHA';
% elseif vd==12
%     letter='FA';
% elseif vd==13
%     letter='JA';
% elseif vd==14
%     letter='DA';
% elseif vd==15
%      letter='DHA';
% elseif vd==16
%     letter='DO';
% elseif vd==17
%      letter='NA';
% elseif vd==18
%     letter='JHA';
% elseif vd==26
%     letter='S';
% elseif vd==27
%     letter='T';
% elseif vd==28
%     letter='U';
% elseif vd==29
%     letter='V';
% elseif vd==30
%     letter='W';
% elseif vd==31
%     letter='X';
% elseif vd==32
%     letter='Y';
% elseif vd==33
%     letter='Z';

%*-*-*-*-*
% Numerals listings.
if vd==33
    letter='1';
elseif vd==34
    letter='2';
elseif vd==35
    letter='3';
elseif vd==36
    letter='4';
elseif vd==37
    letter='5';
%  elseif vd==38
%     letter='5';
elseif vd==39 %|| vd==41 || vd==42
    letter='6';
elseif vd==41
    letter='7';
elseif vd==42
    letter='7';
elseif vd==43 %|| vd==45
    letter='8';
elseif vd==45 %|| vd==47 || vd==48
    letter='9';
% elseif vd==46 %|| vd==47 || vd==48
%     letter='9';
elseif vd==48
    letter='0';
%     elseif vd==49
%     letter='0';
else
    letter='-';
end
end