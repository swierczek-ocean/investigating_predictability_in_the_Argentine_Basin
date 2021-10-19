clear
close all
clc
tic()

load wSST3 sst3c sst3p

fprintf('wSST3 has %g NaNs \n',sum(sum(isnan(sst3c))))

sst3plustemp = sst3p - sst3c;

clear sst3p sst3c

sst3plus = zeros(192,132,122);

parfor ii=1:122
    sst3plus(:,:,ii) = mean(sst3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end


fprintf('sst3plus has %g NaNs \n',sum(sum(isnan(sst3plus))))

clear sst3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
sst3plus12 = zeros(726,482,122);

sst3plus(sst3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sst3plus(:,:,ii),'linear');
    sst3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SST interp iteration %g \n',ii)
end

clear sst3plus

load wSST12 sst12c sst12p

fprintf('The size of sst12c is \n')
size(sst12c)

sst12plustemp = sst12p - sst12c;
sst12plustemp = sst12plustemp(16:741,16:497,:);

sst12plus = zeros(726,482,122);

parfor ii=1:122
    sst12plus(:,:,ii) = mean(sst12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% sst12plus(sst12plus==0) = NaN;

sst3plus12(isnan(sst3plus12)==1) = 0;

clear sst12p sst12c

sstdiff312 = zeros(122,1);
sst12rms = zeros(122,1);
sst12corr = zeros(122,1);

parfor ii=1:122
    sstplus12temp = Smooth2Dfnc(726,482,squeeze(sst12plus(:,:,ii)),0,[25 25],6,1);
    temp = sst12plus(:,:,ii);
    sstplus12temp(isnan(temp)==1) = NaN;
    sst3plus12temp = Smooth2Dfnc(726,482,squeeze(sst3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sst3plus12(:,:,ii);
    sst3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sstplus12temp - sst3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sstdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = sstplus12temp;
    diff = diff(isnan(diff)==0);
    sst12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('SST diff iteration %g \n',ii)
end

save wsstdiff312d sstdiff312 sst12rms

clear
close all
clc

load wDIC3 dic3c dic3p

dic3plustemp = dic3p - dic3c;

clear dic3p dic3c

dic3plus = zeros(192,132,122);

parfor ii=1:122
    dic3plus(:,:,ii) = mean(dic3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear dic3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

dic3plus12 = zeros(726,482,122);

dic3plus(dic3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,dic3plus(:,:,ii),'linear');
    dic3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DIC interp iteration %g \n',ii)
end

clear dic3plus

load wDIC12 dic12c dic12p

dic12plustemp = dic12p - dic12c;
dic12plustemp = dic12plustemp(16:741,16:497,:);

dic12plus = zeros(726,482,122);

parfor ii=1:122
    dic12plus(:,:,ii) = mean(dic12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% dic12plus(dic12plus==0) = NaN;

dic3plus12(isnan(dic3plus12)==1) = 0;

clear dic12p dic12c

dicdiff312 = zeros(122,1);
dic12rms = zeros(122,1);

parfor ii=1:122
    dicplus12temp = Smooth2Dfnc(726,482,squeeze(dic12plus(:,:,ii)),0,[25 25],6,1);
    temp = dic12plus(:,:,ii);
    dicplus12temp(isnan(temp)==1) = NaN;
    dic3plus12temp = Smooth2Dfnc(726,482,squeeze(dic3plus12(:,:,ii)),0,[25 25],6,1);
    temp = dic3plus12(:,:,ii);
    dic3plus12temp(isnan(temp)==1) = NaN;
    
    diff = dicplus12temp - dic3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dicdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = dicplus12temp;
    diff = diff(isnan(diff)==0);
    dic12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DIC diff iteration %g \n',ii)
end

save wdicdiff312d dicdiff312 dic12rms

clear
close all
clc

load wsSST3 sst3c sst3p

sst3plustemp = sst3p - sst3c;

clear sst3p sst3c

sst3plus = zeros(192,132,122);

parfor ii=1:122
    sst3plus(:,:,ii) = mean(sst3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sst3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

sst3plus12 = zeros(726,482,122);

sst3plus(sst3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sst3plus(:,:,ii),'linear');
    sst3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SSTsm interp iteration %g \n',ii)
end

clear sst3plus

load wsSST12 sst12c sst12p

sst12plustemp = sst12p - sst12c;
sst12plustemp = sst12plustemp(16:741,16:497,:);

sst12plus = zeros(726,482,122);

parfor ii=1:122
    sst12plus(:,:,ii) = mean(sst12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sst12plustemp

% sst12plus(sst12plus==0) = NaN;

sst3plus12(isnan(sst3plus12)==1) = 0;

clear sst12p sst12c

sstdiff312s = zeros(122,1);
sst12rmssm = zeros(122,1);

parfor ii=1:122
    sstplus12temp = Smooth2Dfnc(726,482,squeeze(sst12plus(:,:,ii)),0,[25 25],6,1);
    temp = sst12plus(:,:,ii);
    sstplus12temp(isnan(temp)==1) = NaN;
    sst3plus12temp = Smooth2Dfnc(726,482,squeeze(sst3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sst3plus12(:,:,ii);
    sst3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sstplus12temp - sst3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sstdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = sstplus12temp;
    diff = diff(isnan(diff)==0);
    sst12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('SST small diff iteration %g \n',ii)
end

save wsstdiff312sd sstdiff312s sst12rmssm

clear
close all
clc

load wsDIC3 dic3c dic3p

dic3plustemp = dic3p - dic3c;

clear dic3p dic3c

dic3plus = zeros(192,132,122);

parfor ii=1:122
    dic3plus(:,:,ii) = mean(dic3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear dic3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

dic3plus12 = zeros(726,482,122);

dic3plus(dic3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,dic3plus(:,:,ii),'linear');
    dic3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DICsm interp iteration %g \n',ii)
end

clear dic3plus

load wsDIC12 dic12c dic12p

dic12plustemp = dic12p - dic12c;
dic12plustemp = dic12plustemp(16:741,16:497,:);

dic12plus = zeros(726,482,122);

parfor ii=1:122
    dic12plus(:,:,ii) = mean(dic12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% dic12plus(dic12plus==0) = NaN;

dic3plus12(isnan(dic3plus12)==1) = 0;

clear dic12p dic12c

dicdiff312s = zeros(122,1);
dic12rmssm = zeros(122,1);

parfor ii=1:122
    dicplus12temp = Smooth2Dfnc(726,482,squeeze(dic12plus(:,:,ii)),0,[25 25],6,1);
    temp = dic12plus(:,:,ii);
    dicplus12temp(isnan(temp)==1) = NaN;
    dic3plus12temp = Smooth2Dfnc(726,482,squeeze(dic3plus12(:,:,ii)),0,[25 25],6,1);
    temp = dic3plus12(:,:,ii);
    dic3plus12temp(isnan(temp)==1) = NaN;
    
    diff = dicplus12temp - dic3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dicdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = dicplus12temp;
    diff = diff(isnan(diff)==0);
    dic12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DIC small diff iteration %g \n',ii)
end

save wdicdiff312sd dicdiff312s dic12rmssm

clear


load wSST3_100m sst3c sst3p

fprintf('The size of wsst3c100m is \n')
size(sst3c)

sst3plustemp = sst3p - sst3c;

clear sst3p sst3c

sst3plus = zeros(182,122,122);

parfor ii=1:122
    sst3plus(:,:,ii) = mean(sst3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end


fprintf('The size of wsst3plus100m is \n')
size(sst3plus)

clear sst3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

sst3plus12 = zeros(726,482,122);

sst3plus(sst3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sst3plus(:,:,ii),'linear');
    sst3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SST interp iteration %g \n',ii)
end

clear sst3plus

load wSST12_100m sst12c sst12p

sst12plustemp = sst12p - sst12c;

sst12plus = zeros(726,482,122);

parfor ii=1:122
    sst12plus(:,:,ii) = mean(sst12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% sst12plus(sst12plus==0) = NaN;

sst3plus12(isnan(sst3plus12)==1) = 0;

clear sst12p sst12c

sstdiff312 = zeros(122,1);
sst12rms = zeros(122,1);
sst12corr = zeros(122,1);

parfor ii=1:122
    sstplus12temp = Smooth2Dfnc(726,482,squeeze(sst12plus(:,:,ii)),0,[25 25],6,1);
    temp = sst12plus(:,:,ii);
    sstplus12temp(isnan(temp)==1) = NaN;
    sst3plus12temp = Smooth2Dfnc(726,482,squeeze(sst3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sst3plus12(:,:,ii);
    sst3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sstplus12temp - sst3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sstdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    
    diff = sstplus12temp;
    diff = diff(isnan(diff)==0);
    sst12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    fprintf('SST diff iteration %g \n',ii)
end

save w100sstdiff312d sstdiff312 sst12rms

clear
close all
clc

load wDIC3_100m dic3c dic3p

dic3plustemp = dic3p - dic3c;

clear dic3p dic3c

dic3plus = zeros(182,122,122);

parfor ii=1:122
    dic3plus(:,:,ii) = mean(dic3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear dic3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

dic3plus12 = zeros(726,482,122);

dic3plus(dic3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,dic3plus(:,:,ii),'linear');
    dic3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DIC interp iteration %g \n',ii)
end

clear dic3plus

load wDIC12_100m dic12c dic12p

dic12plustemp = dic12p - dic12c;

dic12plus = zeros(726,482,122);

parfor ii=1:122
    dic12plus(:,:,ii) = mean(dic12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% dic12plus(dic12plus==0) = NaN;

dic3plus12(isnan(dic3plus12)==1) = 0;

clear dic12p dic12c

dicdiff312 = zeros(122,1);
dic12rms = zeros(122,1);

parfor ii=1:122
    dicplus12temp = Smooth2Dfnc(726,482,squeeze(dic12plus(:,:,ii)),0,[25 25],6,1);
    temp = dic12plus(:,:,ii);
    dicplus12temp(isnan(temp)==1) = NaN;
    dic3plus12temp = Smooth2Dfnc(726,482,squeeze(dic3plus12(:,:,ii)),0,[25 25],6,1);
    temp = dic3plus12(:,:,ii);
    dic3plus12temp(isnan(temp)==1) = NaN;
    
    diff = dicplus12temp - dic3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dicdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = dicplus12temp;
    diff = diff(isnan(diff)==0);
    dic12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DIC diff iteration %g \n',ii)
end

save w100dicdiff312d dicdiff312 dic12rms

clear
close all
clc

load wsSST3_100m sst3c sst3p

sst3plustemp = sst3p - sst3c;

clear sst3p sst3c

sst3plus = zeros(182,122,122);

parfor ii=1:122
    sst3plus(:,:,ii) = mean(sst3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sst3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

sst3plus12 = zeros(726,482,122);

sst3plus(sst3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sst3plus(:,:,ii),'linear');
    sst3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SSTsm interp iteration %g \n',ii)
end

clear sst3plus

load wsSST12_100m sst12c sst12p

sst12plustemp = sst12p - sst12c;

sst12plus = zeros(726,482,122);

parfor ii=1:122
    sst12plus(:,:,ii) = mean(sst12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sst12plustemp

% sst12plus(sst12plus==0) = NaN;

sst3plus12(isnan(sst3plus12)==1) = 0;

clear sst12p sst12c

sstdiff312s = zeros(122,1);
sst12rmssm = zeros(122,1);

parfor ii=1:122
    sstplus12temp = Smooth2Dfnc(726,482,squeeze(sst12plus(:,:,ii)),0,[25 25],6,1);
    temp = sst12plus(:,:,ii);
    sstplus12temp(isnan(temp)==1) = NaN;
    sst3plus12temp = Smooth2Dfnc(726,482,squeeze(sst3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sst3plus12(:,:,ii);
    sst3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sstplus12temp - sst3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sstdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = sstplus12temp;
    diff = diff(isnan(diff)==0);
    sst12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('SST small diff iteration %g \n',ii)
end

save w100sstdiff312sd sstdiff312s sst12rmssm

clear
close all
clc

load wsDIC3_100m dic3c dic3p

dic3plustemp = dic3p - dic3c;

clear dic3p dic3c

dic3plus = zeros(182,122,122);

parfor ii=1:122
    dic3plus(:,:,ii) = mean(dic3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear dic3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

dic3plus12 = zeros(726,482,122);

dic3plus(dic3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,dic3plus(:,:,ii),'linear');
    dic3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DICsm interp iteration %g \n',ii)
end

clear dic3plus

load wsDIC12_100m dic12c dic12p

dic12plustemp = dic12p - dic12c;

dic12plus = zeros(726,482,122);

parfor ii=1:122
    dic12plus(:,:,ii) = mean(dic12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% dic12plus(dic12plus==0) = NaN;

dic3plus12(isnan(dic3plus12)==1) = 0;

clear dic12p dic12c

dicdiff312s = zeros(122,1);
dic12rmssm = zeros(122,1);

parfor ii=1:122
    dicplus12temp = Smooth2Dfnc(726,482,squeeze(dic12plus(:,:,ii)),0,[25 25],6,1);
    temp = dic12plus(:,:,ii);
    dicplus12temp(isnan(temp)==1) = NaN;
    dic3plus12temp = Smooth2Dfnc(726,482,squeeze(dic3plus12(:,:,ii)),0,[25 25],6,1);
    temp = dic3plus12(:,:,ii);
    dic3plus12temp(isnan(temp)==1) = NaN;
    
    diff = dicplus12temp - dic3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dicdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = dicplus12temp;
    diff = diff(isnan(diff)==0);
    dic12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DIC small diff iteration %g \n',ii)
end

save w100dicdiff312sd dicdiff312s dic12rmssm

clear


load SST3_100m sst3c sst3p

sst3plustemp = sst3p - sst3c;

clear sst3p sst3c

sst3plus = zeros(182,122,122);

parfor ii=1:122
    sst3plus(:,:,ii) = mean(sst3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sst3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

sst3plus12 = zeros(726,482,122);

sst3plus(sst3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sst3plus(:,:,ii),'linear');
    sst3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SST interp iteration %g \n',ii)
end

clear sst3plus

load SST12_100m sst12c sst12p

sst12plustemp = sst12p - sst12c;

sst12plus = zeros(726,482,122);

parfor ii=1:122
    sst12plus(:,:,ii) = mean(sst12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% sst12plus(sst12plus==0) = NaN;

sst3plus12(isnan(sst3plus12)==1) = 0;

clear sst12p sst12c

sstdiff312 = zeros(122,1);
sst12rms = zeros(122,1);
sst12corr = zeros(122,1);

parfor ii=1:122
    sstplus12temp = Smooth2Dfnc(726,482,squeeze(sst12plus(:,:,ii)),0,[25 25],6,1);
    temp = sst12plus(:,:,ii);
    sstplus12temp(isnan(temp)==1) = NaN;
    sst3plus12temp = Smooth2Dfnc(726,482,squeeze(sst3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sst3plus12(:,:,ii);
    sst3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sstplus12temp - sst3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sstdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    
    diff = sstplus12temp;
    diff = diff(isnan(diff)==0);
    sst12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    fprintf('SST diff iteration %g \n',ii)
end

save sst100diff312d sstdiff312 sst12rms

clear
close all
clc

load DIC3_100m dic3c dic3p

dic3plustemp = dic3p - dic3c;

clear dic3p dic3c

dic3plus = zeros(182,122,122);

parfor ii=1:122
    dic3plus(:,:,ii) = mean(dic3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear dic3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

dic3plus12 = zeros(726,482,122);

dic3plus(dic3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,dic3plus(:,:,ii),'linear');
    dic3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DIC interp iteration %g \n',ii)
end

clear dic3plus

load DIC12_100m dic12c dic12p

dic12plustemp = dic12p - dic12c;

dic12plus = zeros(726,482,122);

parfor ii=1:122
    dic12plus(:,:,ii) = mean(dic12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% dic12plus(dic12plus==0) = NaN;

dic3plus12(isnan(dic3plus12)==1) = 0;

clear dic12p dic12c

dicdiff312 = zeros(122,1);
dic12rms = zeros(122,1);

parfor ii=1:122
    dicplus12temp = Smooth2Dfnc(726,482,squeeze(dic12plus(:,:,ii)),0,[25 25],6,1);
    temp = dic12plus(:,:,ii);
    dicplus12temp(isnan(temp)==1) = NaN;
    dic3plus12temp = Smooth2Dfnc(726,482,squeeze(dic3plus12(:,:,ii)),0,[25 25],6,1);
    temp = dic3plus12(:,:,ii);
    dic3plus12temp(isnan(temp)==1) = NaN;
    
    diff = dicplus12temp - dic3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dicdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = dicplus12temp;
    diff = diff(isnan(diff)==0);
    dic12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DIC diff iteration %g \n',ii)
end

save dic100diff312d dicdiff312 dic12rms

clear
close all
clc

load sSST3_100m sst3c sst3p

sst3plustemp = sst3p - sst3c;

clear sst3p sst3c

sst3plus = zeros(182,122,122);

parfor ii=1:122
    sst3plus(:,:,ii) = mean(sst3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sst3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

sst3plus12 = zeros(726,482,122);

sst3plus(sst3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sst3plus(:,:,ii),'linear');
    sst3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SSTsm interp iteration %g \n',ii)
end

clear sst3plus

load sSST12_100m sst12c sst12p

sst12plustemp = sst12p - sst12c;

sst12plus = zeros(726,482,122);

parfor ii=1:122
    sst12plus(:,:,ii) = mean(sst12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sst12plustemp

% sst12plus(sst12plus==0) = NaN;

sst3plus12(isnan(sst3plus12)==1) = 0;

clear sst12p sst12c

sstdiff312s = zeros(122,1);
sst12rmssm = zeros(122,1);

parfor ii=1:122
    sstplus12temp = Smooth2Dfnc(726,482,squeeze(sst12plus(:,:,ii)),0,[25 25],6,1);
    temp = sst12plus(:,:,ii);
    sstplus12temp(isnan(temp)==1) = NaN;
    sst3plus12temp = Smooth2Dfnc(726,482,squeeze(sst3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sst3plus12(:,:,ii);
    sst3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sstplus12temp - sst3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sstdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = sstplus12temp;
    diff = diff(isnan(diff)==0);
    sst12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('SST small diff iteration %g \n',ii)
end

save sst100diff312sd sstdiff312s sst12rmssm

clear
close all
clc

load sDIC3_100m dic3c dic3p

dic3plustemp = dic3p - dic3c;

clear dic3p dic3c

dic3plus = zeros(182,122,122);

parfor ii=1:122
    dic3plus(:,:,ii) = mean(dic3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear dic3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

dic3plus12 = zeros(726,482,122);

dic3plus(dic3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,dic3plus(:,:,ii),'linear');
    dic3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DICsm interp iteration %g \n',ii)
end

clear dic3plus

load sDIC12_100m dic12c dic12p

dic12plustemp = dic12p - dic12c;

dic12plus = zeros(726,482,122);

parfor ii=1:122
    dic12plus(:,:,ii) = mean(dic12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% dic12plus(dic12plus==0) = NaN;

dic3plus12(isnan(dic3plus12)==1) = 0;

clear dic12p dic12c

dicdiff312s = zeros(122,1);
dic12rmssm = zeros(122,1);

parfor ii=1:122
    dicplus12temp = Smooth2Dfnc(726,482,squeeze(dic12plus(:,:,ii)),0,[25 25],6,1);
    temp = dic12plus(:,:,ii);
    dicplus12temp(isnan(temp)==1) = NaN;
    dic3plus12temp = Smooth2Dfnc(726,482,squeeze(dic3plus12(:,:,ii)),0,[25 25],6,1);
    temp = dic3plus12(:,:,ii);
    dic3plus12temp(isnan(temp)==1) = NaN;
    
    diff = dicplus12temp - dic3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dicdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = dicplus12temp;
    diff = diff(isnan(diff)==0);
    dic12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DIC small diff iteration %g \n',ii)
end

save dic100diff312sd dicdiff312s dic12rmssm

clear

load ../2020_11_November_analysis/SST3 sst3c sst3p

fprintf('wSST3 has %g NaNs \n',sum(sum(isnan(sst3c))))

sst3plustemp = sst3p - sst3c;

clear sst3p sst3c

sst3plus = zeros(192,132,122);

parfor ii=1:122
    sst3plus(:,:,ii) = mean(sst3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end


fprintf('sst3plus has %g NaNs \n',sum(sum(isnan(sst3plus))))

clear sst3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
sst3plus12 = zeros(726,482,122);

sst3plus(sst3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sst3plus(:,:,ii),'linear');
    sst3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SST interp iteration %g \n',ii)
end

clear sst3plus

load ../2020_11_November_analysis/SST12 sst12c sst12p

fprintf('The size of sst12c is \n')
size(sst12c)

sst12plustemp = sst12p - sst12c;
sst12plustemp = sst12plustemp(16:741,16:497,:);

sst12plus = zeros(726,482,122);

parfor ii=1:122
    sst12plus(:,:,ii) = mean(sst12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% sst12plus(sst12plus==0) = NaN;

sst3plus12(isnan(sst3plus12)==1) = 0;

clear sst12p sst12c

sstdiff312 = zeros(122,1);
sst12rms = zeros(122,1);
sst12corr = zeros(122,1);

parfor ii=1:122
    sstplus12temp = Smooth2Dfnc(726,482,squeeze(sst12plus(:,:,ii)),0,[25 25],6,1);
    temp = sst12plus(:,:,ii);
    sstplus12temp(isnan(temp)==1) = NaN;
    sst3plus12temp = Smooth2Dfnc(726,482,squeeze(sst3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sst3plus12(:,:,ii);
    sst3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sstplus12temp - sst3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sstdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = sstplus12temp;
    diff = diff(isnan(diff)==0);
    sst12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('SST diff iteration %g \n',ii)
end

save sstdiff312d sstdiff312 sst12rms

clear
close all
clc

load ../2020_11_November_analysis/DIC3 dic3c dic3p

dic3plustemp = dic3p - dic3c;

clear dic3p dic3c

dic3plus = zeros(192,132,122);

parfor ii=1:122
    dic3plus(:,:,ii) = mean(dic3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear dic3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

dic3plus12 = zeros(726,482,122);

dic3plus(dic3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,dic3plus(:,:,ii),'linear');
    dic3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DIC interp iteration %g \n',ii)
end

clear dic3plus

load ../2020_11_November_analysis/DIC12 dic12c dic12p

dic12plustemp = dic12p - dic12c;
dic12plustemp = dic12plustemp(16:741,16:497,:);

dic12plus = zeros(726,482,122);

parfor ii=1:122
    dic12plus(:,:,ii) = mean(dic12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% dic12plus(dic12plus==0) = NaN;

dic3plus12(isnan(dic3plus12)==1) = 0;

clear dic12p dic12c

dicdiff312 = zeros(122,1);
dic12rms = zeros(122,1);

parfor ii=1:122
    dicplus12temp = Smooth2Dfnc(726,482,squeeze(dic12plus(:,:,ii)),0,[25 25],6,1);
    temp = dic12plus(:,:,ii);
    dicplus12temp(isnan(temp)==1) = NaN;
    dic3plus12temp = Smooth2Dfnc(726,482,squeeze(dic3plus12(:,:,ii)),0,[25 25],6,1);
    temp = dic3plus12(:,:,ii);
    dic3plus12temp(isnan(temp)==1) = NaN;
    
    diff = dicplus12temp - dic3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dicdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = dicplus12temp;
    diff = diff(isnan(diff)==0);
    dic12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DIC diff iteration %g \n',ii)
end

save dicdiff312d dicdiff312 dic12rms

clear
close all
clc

load ../2020_11_November_analysis/sSST3 sst3c sst3p

sst3plustemp = sst3p - sst3c;

clear sst3p sst3c

sst3plus = zeros(192,132,122);

parfor ii=1:122
    sst3plus(:,:,ii) = mean(sst3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sst3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

sst3plus12 = zeros(726,482,122);

sst3plus(sst3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sst3plus(:,:,ii),'linear');
    sst3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SSTsm interp iteration %g \n',ii)
end

clear sst3plus

load sSST12 sst12c sst12p

sst12plustemp = sst12p - sst12c;
sst12plustemp = sst12plustemp(16:741,16:497,:);

sst12plus = zeros(726,482,122);

parfor ii=1:122
    sst12plus(:,:,ii) = mean(sst12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sst12plustemp

% sst12plus(sst12plus==0) = NaN;

sst3plus12(isnan(sst3plus12)==1) = 0;

clear sst12p sst12c

sstdiff312s = zeros(122,1);
sst12rmssm = zeros(122,1);

parfor ii=1:122
    sstplus12temp = Smooth2Dfnc(726,482,squeeze(sst12plus(:,:,ii)),0,[25 25],6,1);
    temp = sst12plus(:,:,ii);
    sstplus12temp(isnan(temp)==1) = NaN;
    sst3plus12temp = Smooth2Dfnc(726,482,squeeze(sst3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sst3plus12(:,:,ii);
    sst3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sstplus12temp - sst3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sstdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = sstplus12temp;
    diff = diff(isnan(diff)==0);
    sst12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('SST small diff iteration %g \n',ii)
end

save sstdiff312sd sstdiff312s sst12rmssm

clear
close all
clc

load ../2020_11_November_analysis/sDIC3 dic3c dic3p

dic3plustemp = dic3p - dic3c;

clear dic3p dic3c

dic3plus = zeros(192,132,122);

parfor ii=1:122
    dic3plus(:,:,ii) = mean(dic3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear dic3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

dic3plus12 = zeros(726,482,122);

dic3plus(dic3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,dic3plus(:,:,ii),'linear');
    dic3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DICsm interp iteration %g \n',ii)
end

clear dic3plus

load ../2020_11_November_analysis/sDIC12 dic12c dic12p

dic12plustemp = dic12p - dic12c;
dic12plustemp = dic12plustemp(16:741,16:497,:);

dic12plus = zeros(726,482,122);

parfor ii=1:122
    dic12plus(:,:,ii) = mean(dic12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% dic12plus(dic12plus==0) = NaN;

dic3plus12(isnan(dic3plus12)==1) = 0;

clear dic12p dic12c

dicdiff312s = zeros(122,1);
dic12rmssm = zeros(122,1);

parfor ii=1:122
    dicplus12temp = Smooth2Dfnc(726,482,squeeze(dic12plus(:,:,ii)),0,[25 25],6,1);
    temp = dic12plus(:,:,ii);
    dicplus12temp(isnan(temp)==1) = NaN;
    dic3plus12temp = Smooth2Dfnc(726,482,squeeze(dic3plus12(:,:,ii)),0,[25 25],6,1);
    temp = dic3plus12(:,:,ii);
    dic3plus12temp(isnan(temp)==1) = NaN;
    
    diff = dicplus12temp - dic3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dicdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = dicplus12temp;
    diff = diff(isnan(diff)==0);
    dic12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DIC small diff iteration %g \n',ii)
end

save dicdiff312sd dicdiff312s dic12rmssm

clear

toc()