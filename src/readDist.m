function letter=readDist(snap)
load NewTemplates
snap=imresize(snap,[42 24]);
comp=[ ];
for n=1:length(NewTemplates)
    sem=corr2(NewTemplates{1,n},snap);
    comp=[comp sem];
    %display(sem);
    
end

vd=find(comp==max(comp));
if vd==50
    letter='DHAKA';
elseif vd==51
    letter='RAJSHAHI';
elseif vd==52
    letter='METRO';
    elseif vd==53
    letter='Dhaka';
else letter='-';
end