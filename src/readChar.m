function letter=readChar(snap)

load NewTemplates
snap=imresize(snap,[42 24]);
comp=[ ];
for n=1:length(NewTemplates)
    sem=corr2(NewTemplates{1,n},snap);
    comp=[comp sem];
%     display(sem);
% figure
% plot(sem)
%     
end

vd=find(comp==max(comp));

if vd==1
    letter='GA';
elseif vd==2
    letter='RA';
elseif vd==3
    letter='A';
elseif vd==4
    letter='SA';
elseif vd==5
    letter='BA';
elseif vd==6
    letter='BHA';
elseif vd==7
    letter='SHA';
elseif vd==8
    letter='E';
elseif vd==9
    letter='CHA';
elseif vd==10
    letter='AU';
elseif vd==11 
    letter='GHA';
elseif vd==12
    letter='HA';
elseif vd==13
    letter='JA';
elseif vd==14
    letter='DA';
elseif vd==15
    letter='DHA';
elseif vd==16
    letter='DO';
elseif vd==17
    letter='NA';
elseif vd==18
    letter='JHA';
elseif vd==19
    letter='GHA';
elseif vd==20
    letter='HA';
elseif vd==23
    letter='FA';
elseif vd==50
    letter='DHAKA';
elseif vd==51
    letter='RAJSHAHI';
elseif vd==52
    letter='METRO';
elseif vd==53
    letter='Dhaka';
elseif vd==54
    letter='Chattogram';
    elseif vd==55
    letter='Chattogram';
elseif vd==56
    letter='METRO';
else letter='-';
end

end