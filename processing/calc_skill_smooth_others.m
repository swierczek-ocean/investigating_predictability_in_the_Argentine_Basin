clear
close all
clc
tic()

load wSSS3 sss3c sss3p

fprintf('wSSS3 has %g NaNs \n',sum(sum(isnan(sss3c))))

sss3plustemp = sss3p - sss3c;

clear sss3p sss3c

sss3plus = zeros(192,132,122);

parfor ii=1:122
    sss3plus(:,:,ii) = mean(sss3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end


fprintf('sss3plus has %g NaNs \n',sum(sum(isnan(sss3plus))))

clear sss3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
sss3plus12 = zeros(726,482,122);

sss3plus(sss3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sss3plus(:,:,ii),'linear');
    sss3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SSS interp iteration %g \n',ii)
end

clear sss3plus

load wSSS12 sss12c sss12p

fprintf('The size of sss12c is \n')
size(sss12c)

sss12plustemp = sss12p - sss12c;
sss12plustemp = sss12plustemp(16:741,16:497,:);

sss12plus = zeros(726,482,122);

parfor ii=1:122
    sss12plus(:,:,ii) = mean(sss12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% sss12plus(sss12plus==0) = NaN;

sss3plus12(isnan(sss3plus12)==1) = 0;

clear sss12p sss12c

sssdiff312 = zeros(122,1);
sss12rms = zeros(122,1);
sss12corr = zeros(122,1);

parfor ii=1:122
    sssplus12temp = Smooth2Dfnc(726,482,squeeze(sss12plus(:,:,ii)),0,[25 25],6,1);
    temp = sss12plus(:,:,ii);
    sssplus12temp(isnan(temp)==1) = NaN;
    sss3plus12temp = Smooth2Dfnc(726,482,squeeze(sss3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sss3plus12(:,:,ii);
    sss3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sssplus12temp - sss3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sssdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = sssplus12temp;
    diff = diff(isnan(diff)==0);
    sss12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('SSS diff iteration %g \n',ii)
end

save extras/wsssdiff312d sssdiff312 sss12rms

clear
close all
clc

load wDO3 do3c do3p

do3plustemp = do3p - do3c;

clear do3p do3c

do3plus = zeros(192,132,122);

parfor ii=1:122
    do3plus(:,:,ii) = mean(do3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear do3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

do3plus12 = zeros(726,482,122);

do3plus(do3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,do3plus(:,:,ii),'linear');
    do3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DO interp iteration %g \n',ii)
end

clear do3plus

load wDO12 do12c do12p

do12plustemp = do12p - do12c;
do12plustemp = do12plustemp(16:741,16:497,:);

do12plus = zeros(726,482,122);

parfor ii=1:122
    do12plus(:,:,ii) = mean(do12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% do12plus(do12plus==0) = NaN;

do3plus12(isnan(do3plus12)==1) = 0;

clear do12p do12c

dodiff312 = zeros(122,1);
do12rms = zeros(122,1);

parfor ii=1:122
    doplus12temp = Smooth2Dfnc(726,482,squeeze(do12plus(:,:,ii)),0,[25 25],6,1);
    temp = do12plus(:,:,ii);
    doplus12temp(isnan(temp)==1) = NaN;
    do3plus12temp = Smooth2Dfnc(726,482,squeeze(do3plus12(:,:,ii)),0,[25 25],6,1);
    temp = do3plus12(:,:,ii);
    do3plus12temp(isnan(temp)==1) = NaN;
    
    diff = doplus12temp - do3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dodiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = doplus12temp;
    diff = diff(isnan(diff)==0);
    do12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DO diff iteration %g \n',ii)
end

save extras/wdodiff312d dodiff312 do12rms

clear
close all
clc

load wsSSS3 sss3c sss3p

sss3plustemp = sss3p - sss3c;

clear sss3p sss3c

sss3plus = zeros(192,132,122);

parfor ii=1:122
    sss3plus(:,:,ii) = mean(sss3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sss3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

sss3plus12 = zeros(726,482,122);

sss3plus(sss3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sss3plus(:,:,ii),'linear');
    sss3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SSSsm interp iteration %g \n',ii)
end

clear sss3plus

load wsSSS12 sss12c sss12p

sss12plustemp = sss12p - sss12c;
sss12plustemp = sss12plustemp(16:741,16:497,:);

sss12plus = zeros(726,482,122);

parfor ii=1:122
    sss12plus(:,:,ii) = mean(sss12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sss12plustemp

% sss12plus(sss12plus==0) = NaN;

sss3plus12(isnan(sss3plus12)==1) = 0;

clear sss12p sss12c

sssdiff312s = zeros(122,1);
sss12rmssm = zeros(122,1);

parfor ii=1:122
    sssplus12temp = Smooth2Dfnc(726,482,squeeze(sss12plus(:,:,ii)),0,[25 25],6,1);
    temp = sss12plus(:,:,ii);
    sssplus12temp(isnan(temp)==1) = NaN;
    sss3plus12temp = Smooth2Dfnc(726,482,squeeze(sss3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sss3plus12(:,:,ii);
    sss3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sssplus12temp - sss3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sssdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = sssplus12temp;
    diff = diff(isnan(diff)==0);
    sss12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('SSS small diff iteration %g \n',ii)
end

save extras/wsssdiff312sd sssdiff312s sss12rmssm

clear
close all
clc

load wsDO3 do3c do3p

do3plustemp = do3p - do3c;

clear do3p do3c

do3plus = zeros(192,132,122);

parfor ii=1:122
    do3plus(:,:,ii) = mean(do3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear do3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

do3plus12 = zeros(726,482,122);

do3plus(do3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,do3plus(:,:,ii),'linear');
    do3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DOsm interp iteration %g \n',ii)
end

clear do3plus

load wsDO12 do12c do12p

do12plustemp = do12p - do12c;
do12plustemp = do12plustemp(16:741,16:497,:);

do12plus = zeros(726,482,122);

parfor ii=1:122
    do12plus(:,:,ii) = mean(do12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% do12plus(do12plus==0) = NaN;

do3plus12(isnan(do3plus12)==1) = 0;

clear do12p do12c

dodiff312s = zeros(122,1);
do12rmssm = zeros(122,1);

parfor ii=1:122
    doplus12temp = Smooth2Dfnc(726,482,squeeze(do12plus(:,:,ii)),0,[25 25],6,1);
    temp = do12plus(:,:,ii);
    doplus12temp(isnan(temp)==1) = NaN;
    do3plus12temp = Smooth2Dfnc(726,482,squeeze(do3plus12(:,:,ii)),0,[25 25],6,1);
    temp = do3plus12(:,:,ii);
    do3plus12temp(isnan(temp)==1) = NaN;
    
    diff = doplus12temp - do3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dodiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = doplus12temp;
    diff = diff(isnan(diff)==0);
    do12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DO small diff iteration %g \n',ii)
end

save extras/wdodiff312sd dodiff312s do12rmssm

clear


load wSSS3_100m sss3c sss3p

fprintf('The size of wsss3c100m is \n')
size(sss3c)

sss3plustemp = sss3p - sss3c;

clear sss3p sss3c

sss3plus = zeros(182,122,122);

parfor ii=1:122
    sss3plus(:,:,ii) = mean(sss3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end


fprintf('The size of wsss3plus100m is \n')
size(sss3plus)

clear sss3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

sss3plus12 = zeros(726,482,122);

sss3plus(sss3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sss3plus(:,:,ii),'linear');
    sss3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SSS interp iteration %g \n',ii)
end

clear sss3plus

load wSSS12_100m sss12c sss12p

sss12plustemp = sss12p - sss12c;

sss12plus = zeros(726,482,122);

parfor ii=1:122
    sss12plus(:,:,ii) = mean(sss12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% sss12plus(sss12plus==0) = NaN;

sss3plus12(isnan(sss3plus12)==1) = 0;

clear sss12p sss12c

sssdiff312 = zeros(122,1);
sss12rms = zeros(122,1);
sss12corr = zeros(122,1);

parfor ii=1:122
    sssplus12temp = Smooth2Dfnc(726,482,squeeze(sss12plus(:,:,ii)),0,[25 25],6,1);
    temp = sss12plus(:,:,ii);
    sssplus12temp(isnan(temp)==1) = NaN;
    sss3plus12temp = Smooth2Dfnc(726,482,squeeze(sss3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sss3plus12(:,:,ii);
    sss3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sssplus12temp - sss3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sssdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    
    diff = sssplus12temp;
    diff = diff(isnan(diff)==0);
    sss12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    fprintf('SSS diff iteration %g \n',ii)
end

save extras/w100sssdiff312d sssdiff312 sss12rms

clear
close all
clc

load wDO3_100m do3c do3p

do3plustemp = do3p - do3c;

clear do3p do3c

do3plus = zeros(182,122,122);

parfor ii=1:122
    do3plus(:,:,ii) = mean(do3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear do3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

do3plus12 = zeros(726,482,122);

do3plus(do3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,do3plus(:,:,ii),'linear');
    do3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DO interp iteration %g \n',ii)
end

clear do3plus

load wDO12_100m do12c do12p

do12plustemp = do12p - do12c;

do12plus = zeros(726,482,122);

parfor ii=1:122
    do12plus(:,:,ii) = mean(do12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% do12plus(do12plus==0) = NaN;

do3plus12(isnan(do3plus12)==1) = 0;

clear do12p do12c

dodiff312 = zeros(122,1);
do12rms = zeros(122,1);

parfor ii=1:122
    doplus12temp = Smooth2Dfnc(726,482,squeeze(do12plus(:,:,ii)),0,[25 25],6,1);
    temp = do12plus(:,:,ii);
    doplus12temp(isnan(temp)==1) = NaN;
    do3plus12temp = Smooth2Dfnc(726,482,squeeze(do3plus12(:,:,ii)),0,[25 25],6,1);
    temp = do3plus12(:,:,ii);
    do3plus12temp(isnan(temp)==1) = NaN;
    
    diff = doplus12temp - do3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dodiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = doplus12temp;
    diff = diff(isnan(diff)==0);
    do12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DO diff iteration %g \n',ii)
end

save extras/w100dodiff312d dodiff312 do12rms

clear
close all
clc

load wsSSS3_100m sss3c sss3p

sss3plustemp = sss3p - sss3c;

clear sss3p sss3c

sss3plus = zeros(182,122,122);

parfor ii=1:122
    sss3plus(:,:,ii) = mean(sss3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sss3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

sss3plus12 = zeros(726,482,122);

sss3plus(sss3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sss3plus(:,:,ii),'linear');
    sss3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SSSsm interp iteration %g \n',ii)
end

clear sss3plus

load wsSSS12_100m sss12c sss12p

sss12plustemp = sss12p - sss12c;

sss12plus = zeros(726,482,122);

parfor ii=1:122
    sss12plus(:,:,ii) = mean(sss12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sss12plustemp

% sss12plus(sss12plus==0) = NaN;

sss3plus12(isnan(sss3plus12)==1) = 0;

clear sss12p sss12c

sssdiff312s = zeros(122,1);
sss12rmssm = zeros(122,1);

parfor ii=1:122
    sssplus12temp = Smooth2Dfnc(726,482,squeeze(sss12plus(:,:,ii)),0,[25 25],6,1);
    temp = sss12plus(:,:,ii);
    sssplus12temp(isnan(temp)==1) = NaN;
    sss3plus12temp = Smooth2Dfnc(726,482,squeeze(sss3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sss3plus12(:,:,ii);
    sss3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sssplus12temp - sss3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sssdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = sssplus12temp;
    diff = diff(isnan(diff)==0);
    sss12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('SSS small diff iteration %g \n',ii)
end

save extras/w100sssdiff312sd sssdiff312s sss12rmssm

clear
close all
clc

load wsDO3_100m do3c do3p

do3plustemp = do3p - do3c;

clear do3p do3c

do3plus = zeros(182,122,122);

parfor ii=1:122
    do3plus(:,:,ii) = mean(do3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear do3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

do3plus12 = zeros(726,482,122);

do3plus(do3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,do3plus(:,:,ii),'linear');
    do3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DOsm interp iteration %g \n',ii)
end

clear do3plus

load wsDO12_100m do12c do12p

do12plustemp = do12p - do12c;

do12plus = zeros(726,482,122);

parfor ii=1:122
    do12plus(:,:,ii) = mean(do12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% do12plus(do12plus==0) = NaN;

do3plus12(isnan(do3plus12)==1) = 0;

clear do12p do12c

dodiff312s = zeros(122,1);
do12rmssm = zeros(122,1);

parfor ii=1:122
    doplus12temp = Smooth2Dfnc(726,482,squeeze(do12plus(:,:,ii)),0,[25 25],6,1);
    temp = do12plus(:,:,ii);
    doplus12temp(isnan(temp)==1) = NaN;
    do3plus12temp = Smooth2Dfnc(726,482,squeeze(do3plus12(:,:,ii)),0,[25 25],6,1);
    temp = do3plus12(:,:,ii);
    do3plus12temp(isnan(temp)==1) = NaN;
    
    diff = doplus12temp - do3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dodiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = doplus12temp;
    diff = diff(isnan(diff)==0);
    do12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DO small diff iteration %g \n',ii)
end

save extras/w100dodiff312sd dodiff312s do12rmssm

clear


load SSS3_100m sss3c sss3p

sss3plustemp = sss3p - sss3c;

clear sss3p sss3c

sss3plus = zeros(182,122,122);

parfor ii=1:122
    sss3plus(:,:,ii) = mean(sss3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sss3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

sss3plus12 = zeros(726,482,122);

sss3plus(sss3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sss3plus(:,:,ii),'linear');
    sss3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SSS interp iteration %g \n',ii)
end

clear sss3plus

load SSS12_100m sss12c sss12p

sss12plustemp = sss12p - sss12c;

sss12plus = zeros(726,482,122);

parfor ii=1:122
    sss12plus(:,:,ii) = mean(sss12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% sss12plus(sss12plus==0) = NaN;

sss3plus12(isnan(sss3plus12)==1) = 0;

clear sss12p sss12c

sssdiff312 = zeros(122,1);
sss12rms = zeros(122,1);
sss12corr = zeros(122,1);

parfor ii=1:122
    sssplus12temp = Smooth2Dfnc(726,482,squeeze(sss12plus(:,:,ii)),0,[25 25],6,1);
    temp = sss12plus(:,:,ii);
    sssplus12temp(isnan(temp)==1) = NaN;
    sss3plus12temp = Smooth2Dfnc(726,482,squeeze(sss3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sss3plus12(:,:,ii);
    sss3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sssplus12temp - sss3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sssdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    
    diff = sssplus12temp;
    diff = diff(isnan(diff)==0);
    sss12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    fprintf('SSS diff iteration %g \n',ii)
end

save extras/sss100diff312d sssdiff312 sss12rms

clear
close all
clc

load DO3_100m do3c do3p

do3plustemp = do3p - do3c;

clear do3p do3c

do3plus = zeros(182,122,122);

parfor ii=1:122
    do3plus(:,:,ii) = mean(do3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear do3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

do3plus12 = zeros(726,482,122);

do3plus(do3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,do3plus(:,:,ii),'linear');
    do3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DO interp iteration %g \n',ii)
end

clear do3plus

load DO12_100m do12c do12p

do12plustemp = do12p - do12c;

do12plus = zeros(726,482,122);

parfor ii=1:122
    do12plus(:,:,ii) = mean(do12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% do12plus(do12plus==0) = NaN;

do3plus12(isnan(do3plus12)==1) = 0;

clear do12p do12c

dodiff312 = zeros(122,1);
do12rms = zeros(122,1);

parfor ii=1:122
    doplus12temp = Smooth2Dfnc(726,482,squeeze(do12plus(:,:,ii)),0,[25 25],6,1);
    temp = do12plus(:,:,ii);
    doplus12temp(isnan(temp)==1) = NaN;
    do3plus12temp = Smooth2Dfnc(726,482,squeeze(do3plus12(:,:,ii)),0,[25 25],6,1);
    temp = do3plus12(:,:,ii);
    do3plus12temp(isnan(temp)==1) = NaN;
    
    diff = doplus12temp - do3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dodiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = doplus12temp;
    diff = diff(isnan(diff)==0);
    do12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DO diff iteration %g \n',ii)
end

save extras/do100diff312d dodiff312 do12rms

clear
close all
clc

load sSSS3_100m sss3c sss3p

sss3plustemp = sss3p - sss3c;

clear sss3p sss3c

sss3plus = zeros(182,122,122);

parfor ii=1:122
    sss3plus(:,:,ii) = mean(sss3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sss3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

sss3plus12 = zeros(726,482,122);

sss3plus(sss3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sss3plus(:,:,ii),'linear');
    sss3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SSSsm interp iteration %g \n',ii)
end

clear sss3plus

load sSSS12_100m sss12c sss12p

sss12plustemp = sss12p - sss12c;

sss12plus = zeros(726,482,122);

parfor ii=1:122
    sss12plus(:,:,ii) = mean(sss12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sss12plustemp

% sss12plus(sss12plus==0) = NaN;

sss3plus12(isnan(sss3plus12)==1) = 0;

clear sss12p sss12c

sssdiff312s = zeros(122,1);
sss12rmssm = zeros(122,1);

parfor ii=1:122
    sssplus12temp = Smooth2Dfnc(726,482,squeeze(sss12plus(:,:,ii)),0,[25 25],6,1);
    temp = sss12plus(:,:,ii);
    sssplus12temp(isnan(temp)==1) = NaN;
    sss3plus12temp = Smooth2Dfnc(726,482,squeeze(sss3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sss3plus12(:,:,ii);
    sss3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sssplus12temp - sss3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sssdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = sssplus12temp;
    diff = diff(isnan(diff)==0);
    sss12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('SSS small diff iteration %g \n',ii)
end

save extras/sss100diff312sd sssdiff312s sss12rmssm

clear
close all
clc

load sDO3_100m do3c do3p

do3plustemp = do3p - do3c;

clear do3p do3c

do3plus = zeros(182,122,122);

parfor ii=1:122
    do3plus(:,:,ii) = mean(do3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear do3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

do3plus12 = zeros(726,482,122);

do3plus(do3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,do3plus(:,:,ii),'linear');
    do3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DOsm interp iteration %g \n',ii)
end

clear do3plus

load sDO12_100m do12c do12p

do12plustemp = do12p - do12c;

do12plus = zeros(726,482,122);

parfor ii=1:122
    do12plus(:,:,ii) = mean(do12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% do12plus(do12plus==0) = NaN;

do3plus12(isnan(do3plus12)==1) = 0;

clear do12p do12c

dodiff312s = zeros(122,1);
do12rmssm = zeros(122,1);

parfor ii=1:122
    doplus12temp = Smooth2Dfnc(726,482,squeeze(do12plus(:,:,ii)),0,[25 25],6,1);
    temp = do12plus(:,:,ii);
    doplus12temp(isnan(temp)==1) = NaN;
    do3plus12temp = Smooth2Dfnc(726,482,squeeze(do3plus12(:,:,ii)),0,[25 25],6,1);
    temp = do3plus12(:,:,ii);
    do3plus12temp(isnan(temp)==1) = NaN;
    
    diff = doplus12temp - do3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dodiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = doplus12temp;
    diff = diff(isnan(diff)==0);
    do12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DO small diff iteration %g \n',ii)
end

save extras/do100diff312sd dodiff312s do12rmssm

clear

load ../2020_11_November_analysis/SSS3 sss3c sss3p

fprintf('wSSS3 has %g NaNs \n',sum(sum(isnan(sss3c))))

sss3plustemp = sss3p - sss3c;

clear sss3p sss3c

sss3plus = zeros(192,132,122);

parfor ii=1:122
    sss3plus(:,:,ii) = mean(sss3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end


fprintf('sss3plus has %g NaNs \n',sum(sum(isnan(sss3plus))))

clear sss3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
sss3plus12 = zeros(726,482,122);

sss3plus(sss3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sss3plus(:,:,ii),'linear');
    sss3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SSS interp iteration %g \n',ii)
end

clear sss3plus

load ../2020_11_November_analysis/SSS12 sss12c sss12p

fprintf('The size of sss12c is \n')
size(sss12c)

sss12plustemp = sss12p - sss12c;
sss12plustemp = sss12plustemp(16:741,16:497,:);

sss12plus = zeros(726,482,122);

parfor ii=1:122
    sss12plus(:,:,ii) = mean(sss12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% sss12plus(sss12plus==0) = NaN;

sss3plus12(isnan(sss3plus12)==1) = 0;

clear sss12p sss12c

sssdiff312 = zeros(122,1);
sss12rms = zeros(122,1);
sss12corr = zeros(122,1);

parfor ii=1:122
    sssplus12temp = Smooth2Dfnc(726,482,squeeze(sss12plus(:,:,ii)),0,[25 25],6,1);
    temp = sss12plus(:,:,ii);
    sssplus12temp(isnan(temp)==1) = NaN;
    sss3plus12temp = Smooth2Dfnc(726,482,squeeze(sss3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sss3plus12(:,:,ii);
    sss3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sssplus12temp - sss3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sssdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = sssplus12temp;
    diff = diff(isnan(diff)==0);
    sss12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('SSS diff iteration %g \n',ii)
end

save extras/sssdiff312d sssdiff312 sss12rms

clear
close all
clc

load ../2020_11_November_analysis/DO3 do3c do3p

do3plustemp = do3p - do3c;

clear do3p do3c

do3plus = zeros(192,132,122);

parfor ii=1:122
    do3plus(:,:,ii) = mean(do3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear do3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

do3plus12 = zeros(726,482,122);

do3plus(do3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,do3plus(:,:,ii),'linear');
    do3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DO interp iteration %g \n',ii)
end

clear do3plus

load ../2020_11_November_analysis/DO12 do12c do12p

do12plustemp = do12p - do12c;
do12plustemp = do12plustemp(16:741,16:497,:);

do12plus = zeros(726,482,122);

parfor ii=1:122
    do12plus(:,:,ii) = mean(do12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% do12plus(do12plus==0) = NaN;

do3plus12(isnan(do3plus12)==1) = 0;

clear do12p do12c

dodiff312 = zeros(122,1);
do12rms = zeros(122,1);

parfor ii=1:122
    doplus12temp = Smooth2Dfnc(726,482,squeeze(do12plus(:,:,ii)),0,[25 25],6,1);
    temp = do12plus(:,:,ii);
    doplus12temp(isnan(temp)==1) = NaN;
    do3plus12temp = Smooth2Dfnc(726,482,squeeze(do3plus12(:,:,ii)),0,[25 25],6,1);
    temp = do3plus12(:,:,ii);
    do3plus12temp(isnan(temp)==1) = NaN;
    
    diff = doplus12temp - do3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dodiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = doplus12temp;
    diff = diff(isnan(diff)==0);
    do12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DO diff iteration %g \n',ii)
end

save extras/dodiff312d dodiff312 do12rms

clear
close all
clc

load ../2020_11_November_analysis/sSSS3 sss3c sss3p

sss3plustemp = sss3p - sss3c;

clear sss3p sss3c

sss3plus = zeros(192,132,122);

parfor ii=1:122
    sss3plus(:,:,ii) = mean(sss3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sss3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

sss3plus12 = zeros(726,482,122);

sss3plus(sss3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,sss3plus(:,:,ii),'linear');
    sss3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('SSSsm interp iteration %g \n',ii)
end

clear sss3plus

load sSSS12 sss12c sss12p

sss12plustemp = sss12p - sss12c;
sss12plustemp = sss12plustemp(16:741,16:497,:);

sss12plus = zeros(726,482,122);

parfor ii=1:122
    sss12plus(:,:,ii) = mean(sss12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sss12plustemp

% sss12plus(sss12plus==0) = NaN;

sss3plus12(isnan(sss3plus12)==1) = 0;

clear sss12p sss12c

sssdiff312s = zeros(122,1);
sss12rmssm = zeros(122,1);

parfor ii=1:122
    sssplus12temp = Smooth2Dfnc(726,482,squeeze(sss12plus(:,:,ii)),0,[25 25],6,1);
    temp = sss12plus(:,:,ii);
    sssplus12temp(isnan(temp)==1) = NaN;
    sss3plus12temp = Smooth2Dfnc(726,482,squeeze(sss3plus12(:,:,ii)),0,[25 25],6,1);
    temp = sss3plus12(:,:,ii);
    sss3plus12temp(isnan(temp)==1) = NaN;
    
    diff = sssplus12temp - sss3plus12temp;
    
    diff = diff(isnan(diff)==0);
    sssdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = sssplus12temp;
    diff = diff(isnan(diff)==0);
    sss12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('SSS small diff iteration %g \n',ii)
end

save extras/sssdiff312sd sssdiff312s sss12rmssm

clear
close all
clc

load ../2020_11_November_analysis/sDO3 do3c do3p

do3plustemp = do3p - do3c;

clear do3p do3c

do3plus = zeros(192,132,122);

parfor ii=1:122
    do3plus(:,:,ii) = mean(do3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear do3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

do3plus12 = zeros(726,482,122);

do3plus(do3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,do3plus(:,:,ii),'linear');
    do3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('DOsm interp iteration %g \n',ii)
end

clear do3plus

load ../2020_11_November_analysis/sDO12 do12c do12p

do12plustemp = do12p - do12c;
do12plustemp = do12plustemp(16:741,16:497,:);

do12plus = zeros(726,482,122);

parfor ii=1:122
    do12plus(:,:,ii) = mean(do12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% do12plus(do12plus==0) = NaN;

do3plus12(isnan(do3plus12)==1) = 0;

clear do12p do12c

dodiff312s = zeros(122,1);
do12rmssm = zeros(122,1);

parfor ii=1:122
    doplus12temp = Smooth2Dfnc(726,482,squeeze(do12plus(:,:,ii)),0,[25 25],6,1);
    temp = do12plus(:,:,ii);
    doplus12temp(isnan(temp)==1) = NaN;
    do3plus12temp = Smooth2Dfnc(726,482,squeeze(do3plus12(:,:,ii)),0,[25 25],6,1);
    temp = do3plus12(:,:,ii);
    do3plus12temp(isnan(temp)==1) = NaN;
    
    diff = doplus12temp - do3plus12temp;
    
    diff = diff(isnan(diff)==0);
    dodiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = doplus12temp;
    diff = diff(isnan(diff)==0);
    do12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('DO small diff iteration %g \n',ii)
end

save extras/dodiff312sd dodiff312s do12rmssm

clear

load wTF3 tf3c tf3p

fprintf('wTF3 has %g NaNs \n',sum(sum(isnan(tf3c))))

tf3plustemp = tf3p - tf3c;

clear tf3p tf3c

tf3plus = zeros(192,132,122);

parfor ii=1:122
    tf3plus(:,:,ii) = mean(tf3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end


fprintf('tf3plus has %g NaNs \n',sum(sum(isnan(tf3plus))))

clear tf3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
tf3plus12 = zeros(726,482,122);

tf3plus(tf3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,tf3plus(:,:,ii),'linear');
    tf3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('TF interp iteration %g \n',ii)
end

clear tf3plus

load wTF12 tf12c tf12p

fprintf('The size of tf12c is \n')
size(tf12c)

tf12plustemp = tf12p - tf12c;
tf12plustemp = tf12plustemp(16:741,16:497,:);

tf12plus = zeros(726,482,122);

parfor ii=1:122
    tf12plus(:,:,ii) = mean(tf12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% tf12plus(tf12plus==0) = NaN;

tf3plus12(isnan(tf3plus12)==1) = 0;

clear tf12p tf12c

tfdiff312 = zeros(122,1);
tf12rms = zeros(122,1);
tf12corr = zeros(122,1);

parfor ii=1:122
    tfplus12temp = Smooth2Dfnc(726,482,squeeze(tf12plus(:,:,ii)),0,[25 25],6,1);
    temp = tf12plus(:,:,ii);
    tfplus12temp(isnan(temp)==1) = NaN;
    tf3plus12temp = Smooth2Dfnc(726,482,squeeze(tf3plus12(:,:,ii)),0,[25 25],6,1);
    temp = tf3plus12(:,:,ii);
    tf3plus12temp(isnan(temp)==1) = NaN;
    
    diff = tfplus12temp - tf3plus12temp;
    
    diff = diff(isnan(diff)==0);
    tfdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = tfplus12temp;
    diff = diff(isnan(diff)==0);
    tf12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('TF diff iteration %g \n',ii)
end

save extras/wtfdiff312d tfdiff312 tf12rms

clear
close all
clc

load wCF3 cf3c cf3p

cf3plustemp = cf3p - cf3c;

clear cf3p cf3c

cf3plus = zeros(192,132,122);

parfor ii=1:122
    cf3plus(:,:,ii) = mean(cf3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear cf3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

cf3plus12 = zeros(726,482,122);

cf3plus(cf3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,cf3plus(:,:,ii),'linear');
    cf3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('CF interp iteration %g \n',ii)
end

clear cf3plus

load wCF12 cf12c cf12p

cf12plustemp = cf12p - cf12c;
cf12plustemp = cf12plustemp(16:741,16:497,:);

cf12plus = zeros(726,482,122);

parfor ii=1:122
    cf12plus(:,:,ii) = mean(cf12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% cf12plus(cf12plus==0) = NaN;

cf3plus12(isnan(cf3plus12)==1) = 0;

clear cf12p cf12c

cfdiff312 = zeros(122,1);
cf12rms = zeros(122,1);

parfor ii=1:122
    cfplus12temp = Smooth2Dfnc(726,482,squeeze(cf12plus(:,:,ii)),0,[25 25],6,1);
    temp = cf12plus(:,:,ii);
    cfplus12temp(isnan(temp)==1) = NaN;
    cf3plus12temp = Smooth2Dfnc(726,482,squeeze(cf3plus12(:,:,ii)),0,[25 25],6,1);
    temp = cf3plus12(:,:,ii);
    cf3plus12temp(isnan(temp)==1) = NaN;
    
    diff = cfplus12temp - cf3plus12temp;
    
    diff = diff(isnan(diff)==0);
    cfdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = cfplus12temp;
    diff = diff(isnan(diff)==0);
    cf12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('CF diff iteration %g \n',ii)
end

save extras/wcfdiff312d cfdiff312 cf12rms

clear
close all
clc

load wsTF3 tf3c tf3p

tf3plustemp = tf3p - tf3c;

clear tf3p tf3c

tf3plus = zeros(192,132,122);

parfor ii=1:122
    tf3plus(:,:,ii) = mean(tf3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear tf3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

tf3plus12 = zeros(726,482,122);

tf3plus(tf3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,tf3plus(:,:,ii),'linear');
    tf3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('TFsm interp iteration %g \n',ii)
end

clear tf3plus

load wsTF12 tf12c tf12p

tf12plustemp = tf12p - tf12c;
tf12plustemp = tf12plustemp(16:741,16:497,:);

tf12plus = zeros(726,482,122);

parfor ii=1:122
    tf12plus(:,:,ii) = mean(tf12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear tf12plustemp

% tf12plus(tf12plus==0) = NaN;

tf3plus12(isnan(tf3plus12)==1) = 0;

clear tf12p tf12c

tfdiff312s = zeros(122,1);
tf12rmssm = zeros(122,1);

parfor ii=1:122
    tfplus12temp = Smooth2Dfnc(726,482,squeeze(tf12plus(:,:,ii)),0,[25 25],6,1);
    temp = tf12plus(:,:,ii);
    tfplus12temp(isnan(temp)==1) = NaN;
    tf3plus12temp = Smooth2Dfnc(726,482,squeeze(tf3plus12(:,:,ii)),0,[25 25],6,1);
    temp = tf3plus12(:,:,ii);
    tf3plus12temp(isnan(temp)==1) = NaN;
    
    diff = tfplus12temp - tf3plus12temp;
    
    diff = diff(isnan(diff)==0);
    tfdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = tfplus12temp;
    diff = diff(isnan(diff)==0);
    tf12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('TF small diff iteration %g \n',ii)
end

save extras/wtfdiff312sd tfdiff312s tf12rmssm

clear
close all
clc

load wsCF3 cf3c cf3p

cf3plustemp = cf3p - cf3c;

clear cf3p cf3c

cf3plus = zeros(192,132,122);

parfor ii=1:122
    cf3plus(:,:,ii) = mean(cf3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear cf3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

cf3plus12 = zeros(726,482,122);

cf3plus(cf3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,cf3plus(:,:,ii),'linear');
    cf3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('CFsm interp iteration %g \n',ii)
end

clear cf3plus

load wsCF12 cf12c cf12p

cf12plustemp = cf12p - cf12c;
cf12plustemp = cf12plustemp(16:741,16:497,:);

cf12plus = zeros(726,482,122);

parfor ii=1:122
    cf12plus(:,:,ii) = mean(cf12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% cf12plus(cf12plus==0) = NaN;

cf3plus12(isnan(cf3plus12)==1) = 0;

clear cf12p cf12c

cfdiff312s = zeros(122,1);
cf12rmssm = zeros(122,1);

parfor ii=1:122
    cfplus12temp = Smooth2Dfnc(726,482,squeeze(cf12plus(:,:,ii)),0,[25 25],6,1);
    temp = cf12plus(:,:,ii);
    cfplus12temp(isnan(temp)==1) = NaN;
    cf3plus12temp = Smooth2Dfnc(726,482,squeeze(cf3plus12(:,:,ii)),0,[25 25],6,1);
    temp = cf3plus12(:,:,ii);
    cf3plus12temp(isnan(temp)==1) = NaN;
    
    diff = cfplus12temp - cf3plus12temp;
    
    diff = diff(isnan(diff)==0);
    cfdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = cfplus12temp;
    diff = diff(isnan(diff)==0);
    cf12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('CF small diff iteration %g \n',ii)
end

save extras/wcfdiff312sd cfdiff312s cf12rmssm

clear

load ../2020_11_November_analysis/TF3 tf3c tf3p

fprintf('wTF3 has %g NaNs \n',sum(sum(isnan(tf3c))))

tf3plustemp = tf3p - tf3c;

clear tf3p tf3c

tf3plus = zeros(192,132,122);

parfor ii=1:122
    tf3plus(:,:,ii) = mean(tf3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end


fprintf('tf3plus has %g NaNs \n',sum(sum(isnan(tf3plus))))

clear tf3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
tf3plus12 = zeros(726,482,122);

tf3plus(tf3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,tf3plus(:,:,ii),'linear');
    tf3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('TF interp iteration %g \n',ii)
end

clear tf3plus

load ../2020_11_November_analysis/TF12 tf12c tf12p

fprintf('The size of tf12c is \n')
size(tf12c)

tf12plustemp = tf12p - tf12c;
tf12plustemp = tf12plustemp(16:741,16:497,:);

tf12plus = zeros(726,482,122);

parfor ii=1:122
    tf12plus(:,:,ii) = mean(tf12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% tf12plus(tf12plus==0) = NaN;

tf3plus12(isnan(tf3plus12)==1) = 0;

clear tf12p tf12c

tfdiff312 = zeros(122,1);
tf12rms = zeros(122,1);
tf12corr = zeros(122,1);

parfor ii=1:122
    tfplus12temp = Smooth2Dfnc(726,482,squeeze(tf12plus(:,:,ii)),0,[25 25],6,1);
    temp = tf12plus(:,:,ii);
    tfplus12temp(isnan(temp)==1) = NaN;
    tf3plus12temp = Smooth2Dfnc(726,482,squeeze(tf3plus12(:,:,ii)),0,[25 25],6,1);
    temp = tf3plus12(:,:,ii);
    tf3plus12temp(isnan(temp)==1) = NaN;
    
    diff = tfplus12temp - tf3plus12temp;
    
    diff = diff(isnan(diff)==0);
    tfdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = tfplus12temp;
    diff = diff(isnan(diff)==0);
    tf12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('TF diff iteration %g \n',ii)
end

save extras/tfdiff312d tfdiff312 tf12rms

clear
close all
clc

load ../2020_11_November_analysis/CF3 cf3c cf3p

cf3plustemp = cf3p - cf3c;

clear cf3p cf3c

cf3plus = zeros(192,132,122);

parfor ii=1:122
    cf3plus(:,:,ii) = mean(cf3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear cf3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

cf3plus12 = zeros(726,482,122);

cf3plus(cf3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,cf3plus(:,:,ii),'linear');
    cf3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('CF interp iteration %g \n',ii)
end

clear cf3plus

load ../2020_11_November_analysis/CF12 cf12c cf12p

cf12plustemp = cf12p - cf12c;
cf12plustemp = cf12plustemp(16:741,16:497,:);

cf12plus = zeros(726,482,122);

parfor ii=1:122
    cf12plus(:,:,ii) = mean(cf12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% cf12plus(cf12plus==0) = NaN;

cf3plus12(isnan(cf3plus12)==1) = 0;

clear cf12p cf12c

cfdiff312 = zeros(122,1);
cf12rms = zeros(122,1);

parfor ii=1:122
    cfplus12temp = Smooth2Dfnc(726,482,squeeze(cf12plus(:,:,ii)),0,[25 25],6,1);
    temp = cf12plus(:,:,ii);
    cfplus12temp(isnan(temp)==1) = NaN;
    cf3plus12temp = Smooth2Dfnc(726,482,squeeze(cf3plus12(:,:,ii)),0,[25 25],6,1);
    temp = cf3plus12(:,:,ii);
    cf3plus12temp(isnan(temp)==1) = NaN;
    
    diff = cfplus12temp - cf3plus12temp;
    
    diff = diff(isnan(diff)==0);
    cfdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = cfplus12temp;
    diff = diff(isnan(diff)==0);
    cf12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('CF diff iteration %g \n',ii)
end

save extras/cfdiff312d cfdiff312 cf12rms

clear
close all
clc

load ../2020_11_November_analysis/sTF3 tf3c tf3p

tf3plustemp = tf3p - tf3c;

clear tf3p tf3c

tf3plus = zeros(192,132,122);

parfor ii=1:122
    tf3plus(:,:,ii) = mean(tf3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear tf3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

tf3plus12 = zeros(726,482,122);

tf3plus(tf3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,tf3plus(:,:,ii),'linear');
    tf3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('TFsm interp iteration %g \n',ii)
end

clear tf3plus

load sTF12 tf12c tf12p

tf12plustemp = tf12p - tf12c;
tf12plustemp = tf12plustemp(16:741,16:497,:);

tf12plus = zeros(726,482,122);

parfor ii=1:122
    tf12plus(:,:,ii) = mean(tf12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear tf12plustemp

% tf12plus(tf12plus==0) = NaN;

tf3plus12(isnan(tf3plus12)==1) = 0;

clear tf12p tf12c

tfdiff312s = zeros(122,1);
tf12rmssm = zeros(122,1);

parfor ii=1:122
    tfplus12temp = Smooth2Dfnc(726,482,squeeze(tf12plus(:,:,ii)),0,[25 25],6,1);
    temp = tf12plus(:,:,ii);
    tfplus12temp(isnan(temp)==1) = NaN;
    tf3plus12temp = Smooth2Dfnc(726,482,squeeze(tf3plus12(:,:,ii)),0,[25 25],6,1);
    temp = tf3plus12(:,:,ii);
    tf3plus12temp(isnan(temp)==1) = NaN;
    
    diff = tfplus12temp - tf3plus12temp;
    
    diff = diff(isnan(diff)==0);
    tfdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = tfplus12temp;
    diff = diff(isnan(diff)==0);
    tf12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('TF small diff iteration %g \n',ii)
end

save extras/tfdiff312sd tfdiff312s tf12rmssm

clear
close all
clc

load ../2020_11_November_analysis/sCF3 cf3c cf3p

cf3plustemp = cf3p - cf3c;

clear cf3p cf3c

cf3plus = zeros(192,132,122);

parfor ii=1:122
    cf3plus(:,:,ii) = mean(cf3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear cf3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

cf3plus12 = zeros(726,482,122);

cf3plus(cf3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,cf3plus(:,:,ii),'linear');
    cf3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('CFsm interp iteration %g \n',ii)
end

clear cf3plus

load ../2020_11_November_analysis/sCF12 cf12c cf12p

cf12plustemp = cf12p - cf12c;
cf12plustemp = cf12plustemp(16:741,16:497,:);

cf12plus = zeros(726,482,122);

parfor ii=1:122
    cf12plus(:,:,ii) = mean(cf12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% cf12plus(cf12plus==0) = NaN;

cf3plus12(isnan(cf3plus12)==1) = 0;

clear cf12p cf12c

cfdiff312s = zeros(122,1);
cf12rmssm = zeros(122,1);

parfor ii=1:122
    cfplus12temp = Smooth2Dfnc(726,482,squeeze(cf12plus(:,:,ii)),0,[25 25],6,1);
    temp = cf12plus(:,:,ii);
    cfplus12temp(isnan(temp)==1) = NaN;
    cf3plus12temp = Smooth2Dfnc(726,482,squeeze(cf3plus12(:,:,ii)),0,[25 25],6,1);
    temp = cf3plus12(:,:,ii);
    cf3plus12temp(isnan(temp)==1) = NaN;
    
    diff = cfplus12temp - cf3plus12temp;
    
    diff = diff(isnan(diff)==0);
    cfdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = cfplus12temp;
    diff = diff(isnan(diff)==0);
    cf12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('CF small diff iteration %g \n',ii)
end

save extras/cfdiff312sd cfdiff312s cf12rmssm

clear

load wNO3 no3c no3p

fprintf('wNO3 has %g NaNs \n',sum(sum(isnan(no3c))))

no3plustemp = no3p - no3c;

clear no3p no3c

no3plus = zeros(192,132,122);

parfor ii=1:122
    no3plus(:,:,ii) = mean(no3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end


fprintf('no3plus has %g NaNs \n',sum(sum(isnan(no3plus))))

clear no3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
no3plus12 = zeros(726,482,122);

no3plus(no3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,no3plus(:,:,ii),'linear');
    no3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NO interp iteration %g \n',ii)
end

clear no3plus

load wNO12 no12c no12p

fprintf('The size of no12c is \n')
size(no12c)

no12plustemp = no12p - no12c;
no12plustemp = no12plustemp(16:741,16:497,:);

no12plus = zeros(726,482,122);

parfor ii=1:122
    no12plus(:,:,ii) = mean(no12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% no12plus(no12plus==0) = NaN;

no3plus12(isnan(no3plus12)==1) = 0;

clear no12p no12c

nodiff312 = zeros(122,1);
no12rms = zeros(122,1);
no12corr = zeros(122,1);

parfor ii=1:122
    noplus12temp = Smooth2Dfnc(726,482,squeeze(no12plus(:,:,ii)),0,[25 25],6,1);
    temp = no12plus(:,:,ii);
    noplus12temp(isnan(temp)==1) = NaN;
    no3plus12temp = Smooth2Dfnc(726,482,squeeze(no3plus12(:,:,ii)),0,[25 25],6,1);
    temp = no3plus12(:,:,ii);
    no3plus12temp(isnan(temp)==1) = NaN;
    
    diff = noplus12temp - no3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nodiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = noplus12temp;
    diff = diff(isnan(diff)==0);
    no12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('NO diff iteration %g \n',ii)
end

save extras/wnodiff312d nodiff312 no12rms

clear
close all
clc

load wsNO3 no3c no3p

no3plustemp = no3p - no3c;

clear no3p no3c

no3plus = zeros(192,132,122);

parfor ii=1:122
    no3plus(:,:,ii) = mean(no3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear no3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

no3plus12 = zeros(726,482,122);

no3plus(no3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,no3plus(:,:,ii),'linear');
    no3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NOsm interp iteration %g \n',ii)
end

clear no3plus

load wsNO12 no12c no12p

no12plustemp = no12p - no12c;
no12plustemp = no12plustemp(16:741,16:497,:);

no12plus = zeros(726,482,122);

parfor ii=1:122
    no12plus(:,:,ii) = mean(no12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear no12plustemp

% no12plus(no12plus==0) = NaN;

no3plus12(isnan(no3plus12)==1) = 0;

clear no12p no12c

nodiff312s = zeros(122,1);
no12rmssm = zeros(122,1);

parfor ii=1:122
    noplus12temp = Smooth2Dfnc(726,482,squeeze(no12plus(:,:,ii)),0,[25 25],6,1);
    temp = no12plus(:,:,ii);
    noplus12temp(isnan(temp)==1) = NaN;
    no3plus12temp = Smooth2Dfnc(726,482,squeeze(no3plus12(:,:,ii)),0,[25 25],6,1);
    temp = no3plus12(:,:,ii);
    no3plus12temp(isnan(temp)==1) = NaN;
    
    diff = noplus12temp - no3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nodiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = noplus12temp;
    diff = diff(isnan(diff)==0);
    no12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('NO small diff iteration %g \n',ii)
end

save extras/wnodiff312sd nodiff312s no12rmssm

clear
close all
clc

load wNO3_100m no3c no3p

fprintf('The size of wno3c100m is \n')
size(no3c)

no3plustemp = no3p - no3c;

clear no3p no3c

no3plus = zeros(182,122,122);

parfor ii=1:122
    no3plus(:,:,ii) = mean(no3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end


fprintf('The size of wno3plus100m is \n')
size(no3plus)

clear no3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

no3plus12 = zeros(726,482,122);

no3plus(no3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,no3plus(:,:,ii),'linear');
    no3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NO interp iteration %g \n',ii)
end

clear no3plus

load wNO12_100m no12c no12p

no12plustemp = no12p - no12c;

no12plus = zeros(726,482,122);

parfor ii=1:122
    no12plus(:,:,ii) = mean(no12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% no12plus(no12plus==0) = NaN;

no3plus12(isnan(no3plus12)==1) = 0;

clear no12p no12c

nodiff312 = zeros(122,1);
no12rms = zeros(122,1);
no12corr = zeros(122,1);

parfor ii=1:122
    noplus12temp = Smooth2Dfnc(726,482,squeeze(no12plus(:,:,ii)),0,[25 25],6,1);
    temp = no12plus(:,:,ii);
    noplus12temp(isnan(temp)==1) = NaN;
    no3plus12temp = Smooth2Dfnc(726,482,squeeze(no3plus12(:,:,ii)),0,[25 25],6,1);
    temp = no3plus12(:,:,ii);
    no3plus12temp(isnan(temp)==1) = NaN;
    
    diff = noplus12temp - no3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nodiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    
    diff = noplus12temp;
    diff = diff(isnan(diff)==0);
    no12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    fprintf('NO diff iteration %g \n',ii)
end

save extras/w100nodiff312d nodiff312 no12rms

clear
close all
clc

load wsNO3_100m no3c no3p

no3plustemp = no3p - no3c;

clear no3p no3c

no3plus = zeros(182,122,122);

parfor ii=1:122
    no3plus(:,:,ii) = mean(no3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear no3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

no3plus12 = zeros(726,482,122);

no3plus(no3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,no3plus(:,:,ii),'linear');
    no3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NOsm interp iteration %g \n',ii)
end

clear no3plus

load wsNO12_100m no12c no12p

no12plustemp = no12p - no12c;

no12plus = zeros(726,482,122);

parfor ii=1:122
    no12plus(:,:,ii) = mean(no12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear no12plustemp

% no12plus(no12plus==0) = NaN;

no3plus12(isnan(no3plus12)==1) = 0;

clear no12p no12c

nodiff312s = zeros(122,1);
no12rmssm = zeros(122,1);

parfor ii=1:122
    noplus12temp = Smooth2Dfnc(726,482,squeeze(no12plus(:,:,ii)),0,[25 25],6,1);
    temp = no12plus(:,:,ii);
    noplus12temp(isnan(temp)==1) = NaN;
    no3plus12temp = Smooth2Dfnc(726,482,squeeze(no3plus12(:,:,ii)),0,[25 25],6,1);
    temp = no3plus12(:,:,ii);
    no3plus12temp(isnan(temp)==1) = NaN;
    
    diff = noplus12temp - no3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nodiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = noplus12temp;
    diff = diff(isnan(diff)==0);
    no12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('NO small diff iteration %g \n',ii)
end

save extras/w100nodiff312sd nodiff312s no12rmssm

clear
close all
clc

load NO3_100m no3c no3p

no3plustemp = no3p - no3c;

clear no3p no3c

no3plus = zeros(182,122,122);

parfor ii=1:122
    no3plus(:,:,ii) = mean(no3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear no3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

no3plus12 = zeros(726,482,122);

no3plus(no3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,no3plus(:,:,ii),'linear');
    no3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NO interp iteration %g \n',ii)
end

clear no3plus

load NO12_100m no12c no12p

no12plustemp = no12p - no12c;

no12plus = zeros(726,482,122);

parfor ii=1:122
    no12plus(:,:,ii) = mean(no12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% no12plus(no12plus==0) = NaN;

no3plus12(isnan(no3plus12)==1) = 0;

clear no12p no12c

nodiff312 = zeros(122,1);
no12rms = zeros(122,1);
no12corr = zeros(122,1);

parfor ii=1:122
    noplus12temp = Smooth2Dfnc(726,482,squeeze(no12plus(:,:,ii)),0,[25 25],6,1);
    temp = no12plus(:,:,ii);
    noplus12temp(isnan(temp)==1) = NaN;
    no3plus12temp = Smooth2Dfnc(726,482,squeeze(no3plus12(:,:,ii)),0,[25 25],6,1);
    temp = no3plus12(:,:,ii);
    no3plus12temp(isnan(temp)==1) = NaN;
    
    diff = noplus12temp - no3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nodiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    
    diff = noplus12temp;
    diff = diff(isnan(diff)==0);
    no12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    fprintf('NO diff iteration %g \n',ii)
end

save extras/no100diff312d nodiff312 no12rms

clear
close all
clc

load sNO3_100m no3c no3p

no3plustemp = no3p - no3c;

clear no3p no3c

no3plus = zeros(182,122,122);

parfor ii=1:122
    no3plus(:,:,ii) = mean(no3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear no3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

no3plus12 = zeros(726,482,122);

no3plus(no3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,no3plus(:,:,ii),'linear');
    no3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NOsm interp iteration %g \n',ii)
end

clear no3plus

load sNO12_100m no12c no12p

no12plustemp = no12p - no12c;

no12plus = zeros(726,482,122);

parfor ii=1:122
    no12plus(:,:,ii) = mean(no12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear no12plustemp

% no12plus(no12plus==0) = NaN;

no3plus12(isnan(no3plus12)==1) = 0;

clear no12p no12c

nodiff312s = zeros(122,1);
no12rmssm = zeros(122,1);

parfor ii=1:122
    noplus12temp = Smooth2Dfnc(726,482,squeeze(no12plus(:,:,ii)),0,[25 25],6,1);
    temp = no12plus(:,:,ii);
    noplus12temp(isnan(temp)==1) = NaN;
    no3plus12temp = Smooth2Dfnc(726,482,squeeze(no3plus12(:,:,ii)),0,[25 25],6,1);
    temp = no3plus12(:,:,ii);
    no3plus12temp(isnan(temp)==1) = NaN;
    
    diff = noplus12temp - no3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nodiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = noplus12temp;
    diff = diff(isnan(diff)==0);
    no12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('NO small diff iteration %g \n',ii)
end

save extras/no100diff312sd nodiff312s no12rmssm

clear
close all
clc

load ../2020_11_November_analysis/NO3 no3c no3p

fprintf('wNO3 has %g NaNs \n',sum(sum(isnan(no3c))))

no3plustemp = no3p - no3c;

clear no3p no3c

no3plus = zeros(192,132,122);

parfor ii=1:122
    no3plus(:,:,ii) = mean(no3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end


fprintf('no3plus has %g NaNs \n',sum(sum(isnan(no3plus))))

clear no3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
no3plus12 = zeros(726,482,122);

no3plus(no3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,no3plus(:,:,ii),'linear');
    no3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NO interp iteration %g \n',ii)
end

clear no3plus

load ../2020_11_November_analysis/NO12 no12c no12p

fprintf('The size of no12c is \n')
size(no12c)

no12plustemp = no12p - no12c;
no12plustemp = no12plustemp(16:741,16:497,:);

no12plus = zeros(726,482,122);

parfor ii=1:122
    no12plus(:,:,ii) = mean(no12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

% no12plus(no12plus==0) = NaN;

no3plus12(isnan(no3plus12)==1) = 0;

clear no12p no12c

nodiff312 = zeros(122,1);
no12rms = zeros(122,1);
no12corr = zeros(122,1);

parfor ii=1:122
    noplus12temp = Smooth2Dfnc(726,482,squeeze(no12plus(:,:,ii)),0,[25 25],6,1);
    temp = no12plus(:,:,ii);
    noplus12temp(isnan(temp)==1) = NaN;
    no3plus12temp = Smooth2Dfnc(726,482,squeeze(no3plus12(:,:,ii)),0,[25 25],6,1);
    temp = no3plus12(:,:,ii);
    no3plus12temp(isnan(temp)==1) = NaN;
    
    diff = noplus12temp - no3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nodiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = noplus12temp;
    diff = diff(isnan(diff)==0);
    no12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('NO diff iteration %g \n',ii)
end

save extras/nodiff312d nodiff312 no12rms

clear
close all
clc

load ../2020_11_November_analysis/sNO3 no3c no3p

no3plustemp = no3p - no3c;

clear no3p no3c

no3plus = zeros(192,132,122);

parfor ii=1:122
    no3plus(:,:,ii) = mean(no3plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear no3plustemp

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

no3plus12 = zeros(726,482,122);

no3plus(no3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,no3plus(:,:,ii),'linear');
    no3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NOsm interp iteration %g \n',ii)
end

clear no3plus

load sNO12 no12c no12p

no12plustemp = no12p - no12c;
no12plustemp = no12plustemp(16:741,16:497,:);

no12plus = zeros(726,482,122);

parfor ii=1:122
    no12plus(:,:,ii) = mean(no12plustemp(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear no12plustemp

% no12plus(no12plus==0) = NaN;

no3plus12(isnan(no3plus12)==1) = 0;

clear no12p no12c

nodiff312s = zeros(122,1);
no12rmssm = zeros(122,1);

parfor ii=1:122
    noplus12temp = Smooth2Dfnc(726,482,squeeze(no12plus(:,:,ii)),0,[25 25],6,1);
    temp = no12plus(:,:,ii);
    noplus12temp(isnan(temp)==1) = NaN;
    no3plus12temp = Smooth2Dfnc(726,482,squeeze(no3plus12(:,:,ii)),0,[25 25],6,1);
    temp = no3plus12(:,:,ii);
    no3plus12temp(isnan(temp)==1) = NaN;
    
    diff = noplus12temp - no3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nodiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = noplus12temp;
    diff = diff(isnan(diff)==0);
    no12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('NO small diff iteration %g \n',ii)
end

save extras/nodiff312sd nodiff312s no12rmssm

clear
close all
clc


load wNCP3 ncp3c ncp3p

fprintf('wNCP3 has %g NaNs \n',sum(sum(isnan(ncp3c))))

ncp3plus = ncp3p - ncp3c;

clear ncp3p ncp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
ncp3plus12 = zeros(726,482,122);

ncp3plus(ncp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,ncp3plus(:,:,ii),'linear');
    ncp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NCP interp iteration %g \n',ii)
end

clear ncp3plus

load wNCP12 ncp12c ncp12p

fprintf('The size of ncp12c is \n')
size(ncp12c)

ncp12plus = ncp12p - ncp12c;
ncp12plus = ncp12plus(16:741,16:497,:);

% ncp12plus(ncp12plus==0) = NaN;

ncp3plus12(isnan(ncp3plus12)==1) = 0;

clear ncp12p ncp12c

ncpdiff312 = zeros(122,1);
ncp12rms = zeros(122,1);
ncp12corr = zeros(122,1);

parfor ii=1:122
    ncpplus12temp = Smooth2Dfnc(726,482,squeeze(ncp12plus(:,:,ii)),0,[25 25],6,1);
    temp = ncp12plus(:,:,ii);
    ncpplus12temp(isnan(temp)==1) = NaN;
    ncp3plus12temp = Smooth2Dfnc(726,482,squeeze(ncp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = ncp3plus12(:,:,ii);
    ncp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = ncpplus12temp - ncp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    ncpdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = ncpplus12temp;
    diff = diff(isnan(diff)==0);
    ncp12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('NCP diff iteration %g \n',ii)
end

save extras/wncpdiff312d ncpdiff312 ncp12rms

clear
close all
clc

load wsNCP3 ncp3c ncp3p

ncp3plus = ncp3p - ncp3c;

clear ncp3p ncp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

ncp3plus12 = zeros(726,482,122);

ncp3plus(ncp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,ncp3plus(:,:,ii),'linear');
    ncp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NCPsm interp iteration %g \n',ii)
end

clear ncp3plus

load wsNCP12 ncp12c ncp12p

ncp12plus = ncp12p - ncp12c;
ncp12plus = ncp12plus(16:741,16:497,:);

% ncp12plus(ncp12plus==0) = NaN;

ncp3plus12(isnan(ncp3plus12)==1) = 0;

clear ncp12p ncp12c

ncpdiff312s = zeros(122,1);
ncp12rmssm = zeros(122,1);

parfor ii=1:122
    ncpplus12temp = Smooth2Dfnc(726,482,squeeze(ncp12plus(:,:,ii)),0,[25 25],6,1);
    temp = ncp12plus(:,:,ii);
    ncpplus12temp(isnan(temp)==1) = NaN;
    ncp3plus12temp = Smooth2Dfnc(726,482,squeeze(ncp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = ncp3plus12(:,:,ii);
    ncp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = ncpplus12temp - ncp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    ncpdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = ncpplus12temp;
    diff = diff(isnan(diff)==0);
    ncp12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('NCP small diff iteration %g \n',ii)
end

save extras/wncpdiff312sd ncpdiff312s ncp12rmssm

clear
close all
clc

load wNCP3_100m ncp3c ncp3p

fprintf('The size of wncp3c100m is \n')
size(ncp3c)

ncp3plus = ncp3p - ncp3c;

clear ncp3p ncp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

ncp3plus12 = zeros(726,482,122);

ncp3plus(ncp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,ncp3plus(:,:,ii),'linear');
    ncp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NCP interp iteration %g \n',ii)
end

clear ncp3plus

load wNCP12_100m ncp12c ncp12p

ncp12plus = ncp12p - ncp12c;

% ncp12plus(ncp12plus==0) = NaN;

ncp3plus12(isnan(ncp3plus12)==1) = 0;

clear ncp12p ncp12c

ncpdiff312 = zeros(122,1);
ncp12rms = zeros(122,1);
ncp12corr = zeros(122,1);

parfor ii=1:122
    ncpplus12temp = Smooth2Dfnc(726,482,squeeze(ncp12plus(:,:,ii)),0,[25 25],6,1);
    temp = ncp12plus(:,:,ii);
    ncpplus12temp(isnan(temp)==1) = NaN;
    ncp3plus12temp = Smooth2Dfnc(726,482,squeeze(ncp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = ncp3plus12(:,:,ii);
    ncp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = ncpplus12temp - ncp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    ncpdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    
    diff = ncpplus12temp;
    diff = diff(isnan(diff)==0);
    ncp12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    fprintf('NCP diff iteration %g \n',ii)
end

save extras/w100ncpdiff312d ncpdiff312 ncp12rms

clear
close all
clc

load wsNCP3_100m ncp3c ncp3p

ncp3plus = ncp3p - ncp3c;

clear ncp3p ncp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

ncp3plus12 = zeros(726,482,122);

ncp3plus(ncp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,ncp3plus(:,:,ii),'linear');
    ncp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NCPsm interp iteration %g \n',ii)
end

clear ncp3plus

load wsNCP12_100m ncp12c ncp12p

ncp12plus = ncp12p - ncp12c;

% ncp12plus(ncp12plus==0) = NaN;

ncp3plus12(isnan(ncp3plus12)==1) = 0;

clear ncp12p ncp12c

ncpdiff312s = zeros(122,1);
ncp12rmssm = zeros(122,1);

parfor ii=1:122
    ncpplus12temp = Smooth2Dfnc(726,482,squeeze(ncp12plus(:,:,ii)),0,[25 25],6,1);
    temp = ncp12plus(:,:,ii);
    ncpplus12temp(isnan(temp)==1) = NaN;
    ncp3plus12temp = Smooth2Dfnc(726,482,squeeze(ncp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = ncp3plus12(:,:,ii);
    ncp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = ncpplus12temp - ncp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    ncpdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = ncpplus12temp;
    diff = diff(isnan(diff)==0);
    ncp12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('NCP small diff iteration %g \n',ii)
end

save extras/w100ncpdiff312sd ncpdiff312s ncp12rmssm

clear
close all
clc

load NCP3_100m ncp3c ncp3p

ncp3plus = ncp3p - ncp3c;

clear ncp3p ncp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

ncp3plus12 = zeros(726,482,122);

ncp3plus(ncp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,ncp3plus(:,:,ii),'linear');
    ncp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NCP interp iteration %g \n',ii)
end

clear ncp3plus

load NCP12_100m ncp12c ncp12p

ncp12plus = ncp12p - ncp12c;

% ncp12plus(ncp12plus==0) = NaN;

ncp3plus12(isnan(ncp3plus12)==1) = 0;

clear ncp12p ncp12c

ncpdiff312 = zeros(122,1);
ncp12rms = zeros(122,1);
ncp12corr = zeros(122,1);

parfor ii=1:122
    ncpplus12temp = Smooth2Dfnc(726,482,squeeze(ncp12plus(:,:,ii)),0,[25 25],6,1);
    temp = ncp12plus(:,:,ii);
    ncpplus12temp(isnan(temp)==1) = NaN;
    ncp3plus12temp = Smooth2Dfnc(726,482,squeeze(ncp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = ncp3plus12(:,:,ii);
    ncp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = ncpplus12temp - ncp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    ncpdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    
    diff = ncpplus12temp;
    diff = diff(isnan(diff)==0);
    ncp12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    fprintf('NCP diff iteration %g \n',ii)
end

save extras/ncp100diff312d ncpdiff312 ncp12rms

clear
close all
clc

load sNCP3_100m ncp3c ncp3p

ncp3plus = ncp3p - ncp3c;

clear ncp3p ncp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

ncp3plus12 = zeros(726,482,122);

ncp3plus(ncp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,ncp3plus(:,:,ii),'linear');
    ncp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NCPsm interp iteration %g \n',ii)
end

clear ncp3plus

load sNCP12_100m ncp12c ncp12p

ncp12plus = ncp12p - ncp12c;

% ncp12plus(ncp12plus==0) = NaN;

ncp3plus12(isnan(ncp3plus12)==1) = 0;

clear ncp12p ncp12c

ncpdiff312s = zeros(122,1);
ncp12rmssm = zeros(122,1);

parfor ii=1:122
    ncpplus12temp = Smooth2Dfnc(726,482,squeeze(ncp12plus(:,:,ii)),0,[25 25],6,1);
    temp = ncp12plus(:,:,ii);
    ncpplus12temp(isnan(temp)==1) = NaN;
    ncp3plus12temp = Smooth2Dfnc(726,482,squeeze(ncp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = ncp3plus12(:,:,ii);
    ncp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = ncpplus12temp - ncp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    ncpdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = ncpplus12temp;
    diff = diff(isnan(diff)==0);
    ncp12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('NCP small diff iteration %g \n',ii)
end

save extras/ncp100diff312sd ncpdiff312s ncp12rmssm

clear
close all
clc

load ../2020_11_November_analysis/NCP3 ncp3c ncp3p

fprintf('wNCP3 has %g NaNs \n',sum(sum(isnan(ncp3c))))

ncp3plus = ncp3p - ncp3c;

clear ncp3p ncp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
ncp3plus12 = zeros(726,482,122);

ncp3plus(ncp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,ncp3plus(:,:,ii),'linear');
    ncp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NCP interp iteration %g \n',ii)
end

clear ncp3plus

load ../2020_11_November_analysis/NCP12 ncp12c ncp12p

fprintf('The size of ncp12c is \n')
size(ncp12c)

ncp12plus = ncp12p - ncp12c;
ncp12plus = ncp12plus(16:741,16:497,:);

% ncp12plus(ncp12plus==0) = NaN;

ncp3plus12(isnan(ncp3plus12)==1) = 0;

clear ncp12p ncp12c

ncpdiff312 = zeros(122,1);
ncp12rms = zeros(122,1);
ncp12corr = zeros(122,1);

parfor ii=1:122
    ncpplus12temp = Smooth2Dfnc(726,482,squeeze(ncp12plus(:,:,ii)),0,[25 25],6,1);
    temp = ncp12plus(:,:,ii);
    ncpplus12temp(isnan(temp)==1) = NaN;
    ncp3plus12temp = Smooth2Dfnc(726,482,squeeze(ncp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = ncp3plus12(:,:,ii);
    ncp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = ncpplus12temp - ncp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    ncpdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = ncpplus12temp;
    diff = diff(isnan(diff)==0);
    ncp12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('NCP diff iteration %g \n',ii)
end

save extras/ncpdiff312d ncpdiff312 ncp12rms

clear
close all
clc

load ../2020_11_November_analysis/sNCP3 ncp3c ncp3p

ncp3plus = ncp3p - ncp3c;

clear ncp3p ncp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

ncp3plus12 = zeros(726,482,122);

ncp3plus(ncp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,ncp3plus(:,:,ii),'linear');
    ncp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NCPsm interp iteration %g \n',ii)
end

clear ncp3plus

load sNCP12 ncp12c ncp12p

ncp12plus = ncp12p - ncp12c;
ncp12plus = ncp12plus(16:741,16:497,:);

% ncp12plus(ncp12plus==0) = NaN;

ncp3plus12(isnan(ncp3plus12)==1) = 0;

clear ncp12p ncp12c

ncpdiff312s = zeros(122,1);
ncp12rmssm = zeros(122,1);

parfor ii=1:122
    ncpplus12temp = Smooth2Dfnc(726,482,squeeze(ncp12plus(:,:,ii)),0,[25 25],6,1);
    temp = ncp12plus(:,:,ii);
    ncpplus12temp(isnan(temp)==1) = NaN;
    ncp3plus12temp = Smooth2Dfnc(726,482,squeeze(ncp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = ncp3plus12(:,:,ii);
    ncp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = ncpplus12temp - ncp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    ncpdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = ncpplus12temp;
    diff = diff(isnan(diff)==0);
    ncp12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('NCP small diff iteration %g \n',ii)
end

save extras/ncpdiff312sd ncpdiff312s ncp12rmssm

clear
close all
clc


load wNPP3 npp3c npp3p

fprintf('wNPP3 has %g NaNs \n',sum(sum(isnan(npp3c))))

npp3plus = npp3p - npp3c;

clear npp3p npp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
npp3plus12 = zeros(726,482,122);

npp3plus(npp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,npp3plus(:,:,ii),'linear');
    npp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NPP interp iteration %g \n',ii)
end

clear npp3plus

load wNPP12 npp12c npp12p

fprintf('The size of npp12c is \n')
size(npp12c)

npp12plus = npp12p - npp12c;
npp12plus = npp12plus(16:741,16:497,:);

% npp12plus(npp12plus==0) = NaN;

npp3plus12(isnan(npp3plus12)==1) = 0;

clear npp12p npp12c

nppdiff312 = zeros(122,1);
npp12rms = zeros(122,1);
npp12corr = zeros(122,1);

parfor ii=1:122
    nppplus12temp = Smooth2Dfnc(726,482,squeeze(npp12plus(:,:,ii)),0,[25 25],6,1);
    temp = npp12plus(:,:,ii);
    nppplus12temp(isnan(temp)==1) = NaN;
    npp3plus12temp = Smooth2Dfnc(726,482,squeeze(npp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = npp3plus12(:,:,ii);
    npp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = nppplus12temp - npp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nppdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = nppplus12temp;
    diff = diff(isnan(diff)==0);
    npp12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('NPP diff iteration %g \n',ii)
end

save extras/wnppdiff312d nppdiff312 npp12rms

clear
close all
clc

load wsNPP3 npp3c npp3p

npp3plus = npp3p - npp3c;

clear npp3p npp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

npp3plus12 = zeros(726,482,122);

npp3plus(npp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,npp3plus(:,:,ii),'linear');
    npp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NPPsm interp iteration %g \n',ii)
end

clear npp3plus

load wsNPP12 npp12c npp12p

npp12plus = npp12p - npp12c;
npp12plus = npp12plus(16:741,16:497,:);

% npp12plus(npp12plus==0) = NaN;

npp3plus12(isnan(npp3plus12)==1) = 0;

clear npp12p npp12c

nppdiff312s = zeros(122,1);
npp12rmssm = zeros(122,1);

parfor ii=1:122
    nppplus12temp = Smooth2Dfnc(726,482,squeeze(npp12plus(:,:,ii)),0,[25 25],6,1);
    temp = npp12plus(:,:,ii);
    nppplus12temp(isnan(temp)==1) = NaN;
    npp3plus12temp = Smooth2Dfnc(726,482,squeeze(npp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = npp3plus12(:,:,ii);
    npp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = nppplus12temp - npp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nppdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = nppplus12temp;
    diff = diff(isnan(diff)==0);
    npp12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('NPP small diff iteration %g \n',ii)
end

save extras/wnppdiff312sd nppdiff312s npp12rmssm

clear
close all
clc

load wNPP3_100m npp3c npp3p

fprintf('The size of wnpp3c100m is \n')
size(npp3c)

npp3plus = npp3p - npp3c;

clear npp3p npp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

npp3plus12 = zeros(726,482,122);

npp3plus(npp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,npp3plus(:,:,ii),'linear');
    npp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NPP interp iteration %g \n',ii)
end

clear npp3plus

load wNPP12_100m npp12c npp12p

npp12plus = npp12p - npp12c;

% npp12plus(npp12plus==0) = NaN;

npp3plus12(isnan(npp3plus12)==1) = 0;

clear npp12p npp12c

nppdiff312 = zeros(122,1);
npp12rms = zeros(122,1);
npp12corr = zeros(122,1);

parfor ii=1:122
    nppplus12temp = Smooth2Dfnc(726,482,squeeze(npp12plus(:,:,ii)),0,[25 25],6,1);
    temp = npp12plus(:,:,ii);
    nppplus12temp(isnan(temp)==1) = NaN;
    npp3plus12temp = Smooth2Dfnc(726,482,squeeze(npp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = npp3plus12(:,:,ii);
    npp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = nppplus12temp - npp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nppdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    
    diff = nppplus12temp;
    diff = diff(isnan(diff)==0);
    npp12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    fprintf('NPP diff iteration %g \n',ii)
end

save extras/w100nppdiff312d nppdiff312 npp12rms

clear
close all
clc

load wsNPP3_100m npp3c npp3p

npp3plus = npp3p - npp3c;

clear npp3p npp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

npp3plus12 = zeros(726,482,122);

npp3plus(npp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,npp3plus(:,:,ii),'linear');
    npp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NPPsm interp iteration %g \n',ii)
end

clear npp3plus

load wsNPP12_100m npp12c npp12p

npp12plus = npp12p - npp12c;

% npp12plus(npp12plus==0) = NaN;

npp3plus12(isnan(npp3plus12)==1) = 0;

clear npp12p npp12c

nppdiff312s = zeros(122,1);
npp12rmssm = zeros(122,1);

parfor ii=1:122
    nppplus12temp = Smooth2Dfnc(726,482,squeeze(npp12plus(:,:,ii)),0,[25 25],6,1);
    temp = npp12plus(:,:,ii);
    nppplus12temp(isnan(temp)==1) = NaN;
    npp3plus12temp = Smooth2Dfnc(726,482,squeeze(npp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = npp3plus12(:,:,ii);
    npp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = nppplus12temp - npp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nppdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = nppplus12temp;
    diff = diff(isnan(diff)==0);
    npp12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('NPP small diff iteration %g \n',ii)
end

save extras/w100nppdiff312sd nppdiff312s npp12rmssm

clear
close all
clc

load NPP3_100m npp3c npp3p

npp3plus = npp3p - npp3c;

clear npp3p npp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

npp3plus12 = zeros(726,482,122);

npp3plus(npp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,npp3plus(:,:,ii),'linear');
    npp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NPP interp iteration %g \n',ii)
end

clear npp3plus

load NPP12_100m npp12c npp12p

npp12plus = npp12p - npp12c;

% npp12plus(npp12plus==0) = NaN;

npp3plus12(isnan(npp3plus12)==1) = 0;

clear npp12p npp12c

nppdiff312 = zeros(122,1);
npp12rms = zeros(122,1);
npp12corr = zeros(122,1);

parfor ii=1:122
    nppplus12temp = Smooth2Dfnc(726,482,squeeze(npp12plus(:,:,ii)),0,[25 25],6,1);
    temp = npp12plus(:,:,ii);
    nppplus12temp(isnan(temp)==1) = NaN;
    npp3plus12temp = Smooth2Dfnc(726,482,squeeze(npp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = npp3plus12(:,:,ii);
    npp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = nppplus12temp - npp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nppdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    
    diff = nppplus12temp;
    diff = diff(isnan(diff)==0);
    npp12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    fprintf('NPP diff iteration %g \n',ii)
end

save extras/npp100diff312d nppdiff312 npp12rms

clear
close all
clc

load sNPP3_100m npp3c npp3p

npp3plus = npp3p - npp3c;

clear npp3p npp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

npp3plus12 = zeros(726,482,122);

npp3plus(npp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,npp3plus(:,:,ii),'linear');
    npp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NPPsm interp iteration %g \n',ii)
end

clear npp3plus

load sNPP12_100m npp12c npp12p

npp12plus = npp12p - npp12c;

% npp12plus(npp12plus==0) = NaN;

npp3plus12(isnan(npp3plus12)==1) = 0;

clear npp12p npp12c

nppdiff312s = zeros(122,1);
npp12rmssm = zeros(122,1);

parfor ii=1:122
    nppplus12temp = Smooth2Dfnc(726,482,squeeze(npp12plus(:,:,ii)),0,[25 25],6,1);
    temp = npp12plus(:,:,ii);
    nppplus12temp(isnan(temp)==1) = NaN;
    npp3plus12temp = Smooth2Dfnc(726,482,squeeze(npp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = npp3plus12(:,:,ii);
    npp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = nppplus12temp - npp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nppdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = nppplus12temp;
    diff = diff(isnan(diff)==0);
    npp12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('NPP small diff iteration %g \n',ii)
end

save extras/npp100diff312sd nppdiff312s npp12rmssm

clear
close all
clc

load ../2020_11_November_analysis/NPP3 npp3c npp3p

fprintf('wNPP3 has %g NaNs \n',sum(sum(isnan(npp3c))))

npp3plus = npp3p - npp3c;

clear npp3p npp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
npp3plus12 = zeros(726,482,122);

npp3plus(npp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,npp3plus(:,:,ii),'linear');
    npp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NPP interp iteration %g \n',ii)
end

clear npp3plus

load ../2020_11_November_analysis/NPP12 npp12c npp12p

fprintf('The size of npp12c is \n')
size(npp12c)

npp12plus = npp12p - npp12c;
npp12plus = npp12plus(16:741,16:497,:);

% npp12plus(npp12plus==0) = NaN;

npp3plus12(isnan(npp3plus12)==1) = 0;

clear npp12p npp12c

nppdiff312 = zeros(122,1);
npp12rms = zeros(122,1);
npp12corr = zeros(122,1);

parfor ii=1:122
    nppplus12temp = Smooth2Dfnc(726,482,squeeze(npp12plus(:,:,ii)),0,[25 25],6,1);
    temp = npp12plus(:,:,ii);
    nppplus12temp(isnan(temp)==1) = NaN;
    npp3plus12temp = Smooth2Dfnc(726,482,squeeze(npp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = npp3plus12(:,:,ii);
    npp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = nppplus12temp - npp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nppdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = nppplus12temp;
    diff = diff(isnan(diff)==0);
    npp12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('NPP diff iteration %g \n',ii)
end

save extras/nppdiff312d nppdiff312 npp12rms

clear
close all
clc

load ../2020_11_November_analysis/sNPP3 npp3c npp3p

npp3plus = npp3p - npp3c;

clear npp3p npp3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

npp3plus12 = zeros(726,482,122);

npp3plus(npp3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,npp3plus(:,:,ii),'linear');
    npp3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('NPPsm interp iteration %g \n',ii)
end

clear npp3plus

load sNPP12 npp12c npp12p

npp12plus = npp12p - npp12c;
npp12plus = npp12plus(16:741,16:497,:);

% npp12plus(npp12plus==0) = NaN;

npp3plus12(isnan(npp3plus12)==1) = 0;

clear npp12p npp12c

nppdiff312s = zeros(122,1);
npp12rmssm = zeros(122,1);

parfor ii=1:122
    nppplus12temp = Smooth2Dfnc(726,482,squeeze(npp12plus(:,:,ii)),0,[25 25],6,1);
    temp = npp12plus(:,:,ii);
    nppplus12temp(isnan(temp)==1) = NaN;
    npp3plus12temp = Smooth2Dfnc(726,482,squeeze(npp3plus12(:,:,ii)),0,[25 25],6,1);
    temp = npp3plus12(:,:,ii);
    npp3plus12temp(isnan(temp)==1) = NaN;
    
    diff = nppplus12temp - npp3plus12temp;
    
    diff = diff(isnan(diff)==0);
    nppdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = nppplus12temp;
    diff = diff(isnan(diff)==0);
    npp12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('NPP small diff iteration %g \n',ii)
end

save extras/nppdiff312sd nppdiff312s npp12rmssm

clear
close all
clc


load wCHL3 chl3c chl3p

fprintf('wCHL3 has %g NaNs \n',sum(sum(isnan(chl3c))))

chl3plus = chl3p - chl3c;

clear chl3p chl3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
chl3plus12 = zeros(726,482,122);

chl3plus(chl3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,chl3plus(:,:,ii),'linear');
    chl3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('CHL interp iteration %g \n',ii)
end

clear chl3plus

load wCHL12 chl12c chl12p

fprintf('The size of chl12c is \n')
size(chl12c)

chl12plus = chl12p - chl12c;
chl12plus = chl12plus(16:741,16:497,:);

% chl12plus(chl12plus==0) = NaN;

chl3plus12(isnan(chl3plus12)==1) = 0;

clear chl12p chl12c

chldiff312 = zeros(122,1);
chl12rms = zeros(122,1);
chl12corr = zeros(122,1);

parfor ii=1:122
    chlplus12temp = Smooth2Dfnc(726,482,squeeze(chl12plus(:,:,ii)),0,[25 25],6,1);
    temp = chl12plus(:,:,ii);
    chlplus12temp(isnan(temp)==1) = NaN;
    chl3plus12temp = Smooth2Dfnc(726,482,squeeze(chl3plus12(:,:,ii)),0,[25 25],6,1);
    temp = chl3plus12(:,:,ii);
    chl3plus12temp(isnan(temp)==1) = NaN;
    
    diff = chlplus12temp - chl3plus12temp;
    
    diff = diff(isnan(diff)==0);
    chldiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = chlplus12temp;
    diff = diff(isnan(diff)==0);
    chl12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('CHL diff iteration %g \n',ii)
end

save extras/wchldiff312d chldiff312 chl12rms

clear
close all
clc

load wsCHL3 chl3c chl3p

chl3plus = chl3p - chl3c;

clear chl3p chl3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

chl3plus12 = zeros(726,482,122);

chl3plus(chl3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,chl3plus(:,:,ii),'linear');
    chl3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('CHLsm interp iteration %g \n',ii)
end

clear chl3plus

load wsCHL12 chl12c chl12p

chl12plus = chl12p - chl12c;
chl12plus = chl12plus(16:741,16:497,:);

% chl12plus(chl12plus==0) = NaN;

chl3plus12(isnan(chl3plus12)==1) = 0;

clear chl12p chl12c

chldiff312s = zeros(122,1);
chl12rmssm = zeros(122,1);

parfor ii=1:122
    chlplus12temp = Smooth2Dfnc(726,482,squeeze(chl12plus(:,:,ii)),0,[25 25],6,1);
    temp = chl12plus(:,:,ii);
    chlplus12temp(isnan(temp)==1) = NaN;
    chl3plus12temp = Smooth2Dfnc(726,482,squeeze(chl3plus12(:,:,ii)),0,[25 25],6,1);
    temp = chl3plus12(:,:,ii);
    chl3plus12temp(isnan(temp)==1) = NaN;
    
    diff = chlplus12temp - chl3plus12temp;
    
    diff = diff(isnan(diff)==0);
    chldiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = chlplus12temp;
    diff = diff(isnan(diff)==0);
    chl12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('CHL small diff iteration %g \n',ii)
end

save extras/wchldiff312sd chldiff312s chl12rmssm

clear
close all
clc

load wCHL3_100m chl3c chl3p

fprintf('The size of wchl3c100m is \n')
size(chl3c)

chl3plus = chl3p - chl3c;

clear chl3p chl3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

chl3plus12 = zeros(726,482,122);

chl3plus(chl3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,chl3plus(:,:,ii),'linear');
    chl3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('CHL interp iteration %g \n',ii)
end

clear chl3plus

load wCHL12_100m chl12c chl12p

chl12plus = chl12p - chl12c;

% chl12plus(chl12plus==0) = NaN;

chl3plus12(isnan(chl3plus12)==1) = 0;

clear chl12p chl12c

chldiff312 = zeros(122,1);
chl12rms = zeros(122,1);
chl12corr = zeros(122,1);

parfor ii=1:122
    chlplus12temp = Smooth2Dfnc(726,482,squeeze(chl12plus(:,:,ii)),0,[25 25],6,1);
    temp = chl12plus(:,:,ii);
    chlplus12temp(isnan(temp)==1) = NaN;
    chl3plus12temp = Smooth2Dfnc(726,482,squeeze(chl3plus12(:,:,ii)),0,[25 25],6,1);
    temp = chl3plus12(:,:,ii);
    chl3plus12temp(isnan(temp)==1) = NaN;
    
    diff = chlplus12temp - chl3plus12temp;
    
    diff = diff(isnan(diff)==0);
    chldiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    
    diff = chlplus12temp;
    diff = diff(isnan(diff)==0);
    chl12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    fprintf('CHL diff iteration %g \n',ii)
end

save extras/w100chldiff312d chldiff312 chl12rms

clear
close all
clc

load wsCHL3_100m chl3c chl3p

chl3plus = chl3p - chl3c;

clear chl3p chl3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

chl3plus12 = zeros(726,482,122);

chl3plus(chl3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,chl3plus(:,:,ii),'linear');
    chl3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('CHLsm interp iteration %g \n',ii)
end

clear chl3plus

load wsCHL12_100m chl12c chl12p

chl12plus = chl12p - chl12c;

% chl12plus(chl12plus==0) = NaN;

chl3plus12(isnan(chl3plus12)==1) = 0;

clear chl12p chl12c

chldiff312s = zeros(122,1);
chl12rmssm = zeros(122,1);

parfor ii=1:122
    chlplus12temp = Smooth2Dfnc(726,482,squeeze(chl12plus(:,:,ii)),0,[25 25],6,1);
    temp = chl12plus(:,:,ii);
    chlplus12temp(isnan(temp)==1) = NaN;
    chl3plus12temp = Smooth2Dfnc(726,482,squeeze(chl3plus12(:,:,ii)),0,[25 25],6,1);
    temp = chl3plus12(:,:,ii);
    chl3plus12temp(isnan(temp)==1) = NaN;
    
    diff = chlplus12temp - chl3plus12temp;
    
    diff = diff(isnan(diff)==0);
    chldiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = chlplus12temp;
    diff = diff(isnan(diff)==0);
    chl12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('CHL small diff iteration %g \n',ii)
end

save extras/w100chldiff312sd chldiff312s chl12rmssm

clear
close all
clc

load CHL3_100m chl3c chl3p

chl3plus = chl3p - chl3c;

clear chl3p chl3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

chl3plus12 = zeros(726,482,122);

chl3plus(chl3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,chl3plus(:,:,ii),'linear');
    chl3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('CHL interp iteration %g \n',ii)
end

clear chl3plus

load CHL12_100m chl12c chl12p

chl12plus = chl12p - chl12c;

% chl12plus(chl12plus==0) = NaN;

chl3plus12(isnan(chl3plus12)==1) = 0;

clear chl12p chl12c

chldiff312 = zeros(122,1);
chl12rms = zeros(122,1);
chl12corr = zeros(122,1);

parfor ii=1:122
    chlplus12temp = Smooth2Dfnc(726,482,squeeze(chl12plus(:,:,ii)),0,[25 25],6,1);
    temp = chl12plus(:,:,ii);
    chlplus12temp(isnan(temp)==1) = NaN;
    chl3plus12temp = Smooth2Dfnc(726,482,squeeze(chl3plus12(:,:,ii)),0,[25 25],6,1);
    temp = chl3plus12(:,:,ii);
    chl3plus12temp(isnan(temp)==1) = NaN;
    
    diff = chlplus12temp - chl3plus12temp;
    
    diff = diff(isnan(diff)==0);
    chldiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    
    diff = chlplus12temp;
    diff = diff(isnan(diff)==0);
    chl12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    fprintf('CHL diff iteration %g \n',ii)
end

save extras/chl100diff312d chldiff312 chl12rms

clear
close all
clc

load sCHL3_100m chl3c chl3p

chl3plus = chl3p - chl3c;

clear chl3p chl3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

chl3plus12 = zeros(726,482,122);

chl3plus(chl3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,chl3plus(:,:,ii),'linear');
    chl3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('CHLsm interp iteration %g \n',ii)
end

clear chl3plus

load sCHL12_100m chl12c chl12p

chl12plus = chl12p - chl12c;

% chl12plus(chl12plus==0) = NaN;

chl3plus12(isnan(chl3plus12)==1) = 0;

clear chl12p chl12c

chldiff312s = zeros(122,1);
chl12rmssm = zeros(122,1);

parfor ii=1:122
    chlplus12temp = Smooth2Dfnc(726,482,squeeze(chl12plus(:,:,ii)),0,[25 25],6,1);
    temp = chl12plus(:,:,ii);
    chlplus12temp(isnan(temp)==1) = NaN;
    chl3plus12temp = Smooth2Dfnc(726,482,squeeze(chl3plus12(:,:,ii)),0,[25 25],6,1);
    temp = chl3plus12(:,:,ii);
    chl3plus12temp(isnan(temp)==1) = NaN;
    
    diff = chlplus12temp - chl3plus12temp;
    
    diff = diff(isnan(diff)==0);
    chldiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = chlplus12temp;
    diff = diff(isnan(diff)==0);
    chl12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('CHL small diff iteration %g \n',ii)
end

save extras/chl100diff312sd chldiff312s chl12rmssm

clear
close all
clc

load ../2020_11_November_analysis/CHL3 chl3c chl3p

fprintf('wCHL3 has %g NaNs \n',sum(sum(isnan(chl3c))))

chl3plus = chl3p - chl3c;

clear chl3p chl3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
chl3plus12 = zeros(726,482,122);

chl3plus(chl3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,chl3plus(:,:,ii),'linear');
    chl3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('CHL interp iteration %g \n',ii)
end

clear chl3plus

load ../2020_11_November_analysis/CHL12 chl12c chl12p

fprintf('The size of chl12c is \n')
size(chl12c)

chl12plus = chl12p - chl12c;
chl12plus = chl12plus(16:741,16:497,:);

% chl12plus(chl12plus==0) = NaN;

chl3plus12(isnan(chl3plus12)==1) = 0;

clear chl12p chl12c

chldiff312 = zeros(122,1);
chl12rms = zeros(122,1);
chl12corr = zeros(122,1);

parfor ii=1:122
    chlplus12temp = Smooth2Dfnc(726,482,squeeze(chl12plus(:,:,ii)),0,[25 25],6,1);
    temp = chl12plus(:,:,ii);
    chlplus12temp(isnan(temp)==1) = NaN;
    chl3plus12temp = Smooth2Dfnc(726,482,squeeze(chl3plus12(:,:,ii)),0,[25 25],6,1);
    temp = chl3plus12(:,:,ii);
    chl3plus12temp(isnan(temp)==1) = NaN;
    
    diff = chlplus12temp - chl3plus12temp;
    
    diff = diff(isnan(diff)==0);
    chldiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = chlplus12temp;
    diff = diff(isnan(diff)==0);
    chl12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('CHL diff iteration %g \n',ii)
end

save extras/chldiff312d chldiff312 chl12rms

clear
close all
clc

load ../2020_11_November_analysis/sCHL3 chl3c chl3p

chl3plus = chl3p - chl3c;

clear chl3p chl3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

chl3plus12 = zeros(726,482,122);

chl3plus(chl3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,chl3plus(:,:,ii),'linear');
    chl3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('CHLsm interp iteration %g \n',ii)
end

clear chl3plus

load sCHL12 chl12c chl12p

chl12plus = chl12p - chl12c;
chl12plus = chl12plus(16:741,16:497,:);

% chl12plus(chl12plus==0) = NaN;

chl3plus12(isnan(chl3plus12)==1) = 0;

clear chl12p chl12c

chldiff312s = zeros(122,1);
chl12rmssm = zeros(122,1);

parfor ii=1:122
    chlplus12temp = Smooth2Dfnc(726,482,squeeze(chl12plus(:,:,ii)),0,[25 25],6,1);
    temp = chl12plus(:,:,ii);
    chlplus12temp(isnan(temp)==1) = NaN;
    chl3plus12temp = Smooth2Dfnc(726,482,squeeze(chl3plus12(:,:,ii)),0,[25 25],6,1);
    temp = chl3plus12(:,:,ii);
    chl3plus12temp(isnan(temp)==1) = NaN;
    
    diff = chlplus12temp - chl3plus12temp;
    
    diff = diff(isnan(diff)==0);
    chldiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = chlplus12temp;
    diff = diff(isnan(diff)==0);
    chl12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('CHL small diff iteration %g \n',ii)
end

save extras/chldiff312sd chldiff312s chl12rmssm

clear
close all
clc



load wPOC3 poc3c poc3p

fprintf('wPOC3 has %g NaNs \n',sum(sum(isnan(poc3c))))

poc3plus = poc3p - poc3c;

clear poc3p poc3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
poc3plus12 = zeros(726,482,122);

poc3plus(poc3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,poc3plus(:,:,ii),'linear');
    poc3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('POC interp iteration %g \n',ii)
end

clear poc3plus

load wPOC12 poc12c poc12p

fprintf('The size of poc12c is \n')
size(poc12c)

poc12plus = poc12p - poc12c;
poc12plus = poc12plus(16:741,16:497,:);

% poc12plus(poc12plus==0) = NaN;

poc3plus12(isnan(poc3plus12)==1) = 0;

clear poc12p poc12c

pocdiff312 = zeros(122,1);
poc12rms = zeros(122,1);
poc12corr = zeros(122,1);

parfor ii=1:122
    pocplus12temp = Smooth2Dfnc(726,482,squeeze(poc12plus(:,:,ii)),0,[25 25],6,1);
    temp = poc12plus(:,:,ii);
    pocplus12temp(isnan(temp)==1) = NaN;
    poc3plus12temp = Smooth2Dfnc(726,482,squeeze(poc3plus12(:,:,ii)),0,[25 25],6,1);
    temp = poc3plus12(:,:,ii);
    poc3plus12temp(isnan(temp)==1) = NaN;
    
    diff = pocplus12temp - poc3plus12temp;
    
    diff = diff(isnan(diff)==0);
    pocdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = pocplus12temp;
    diff = diff(isnan(diff)==0);
    poc12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('POC diff iteration %g \n',ii)
end

save extras/wpocdiff312d pocdiff312 poc12rms

clear
close all
clc

load wsPOC3 poc3c poc3p

poc3plus = poc3p - poc3c;

clear poc3p poc3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

poc3plus12 = zeros(726,482,122);

poc3plus(poc3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,poc3plus(:,:,ii),'linear');
    poc3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('POCsm interp iteration %g \n',ii)
end

clear poc3plus

load wsPOC12 poc12c poc12p

poc12plus = poc12p - poc12c;
poc12plus = poc12plus(16:741,16:497,:);

% poc12plus(poc12plus==0) = NaN;

poc3plus12(isnan(poc3plus12)==1) = 0;

clear poc12p poc12c

pocdiff312s = zeros(122,1);
poc12rmssm = zeros(122,1);

parfor ii=1:122
    pocplus12temp = Smooth2Dfnc(726,482,squeeze(poc12plus(:,:,ii)),0,[25 25],6,1);
    temp = poc12plus(:,:,ii);
    pocplus12temp(isnan(temp)==1) = NaN;
    poc3plus12temp = Smooth2Dfnc(726,482,squeeze(poc3plus12(:,:,ii)),0,[25 25],6,1);
    temp = poc3plus12(:,:,ii);
    poc3plus12temp(isnan(temp)==1) = NaN;
    
    diff = pocplus12temp - poc3plus12temp;
    
    diff = diff(isnan(diff)==0);
    pocdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = pocplus12temp;
    diff = diff(isnan(diff)==0);
    poc12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('POC small diff iteration %g \n',ii)
end

save extras/wpocdiff312sd pocdiff312s poc12rmssm

clear
close all
clc

load wPOC3_100m poc3c poc3p

fprintf('The size of wpoc3c100m is \n')
size(poc3c)

poc3plus = poc3p - poc3c;

clear poc3p poc3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

poc3plus12 = zeros(726,482,122);

poc3plus(poc3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,poc3plus(:,:,ii),'linear');
    poc3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('POC interp iteration %g \n',ii)
end

clear poc3plus

load wPOC12_100m poc12c poc12p

poc12plus = poc12p - poc12c;

% poc12plus(poc12plus==0) = NaN;

poc3plus12(isnan(poc3plus12)==1) = 0;

clear poc12p poc12c

pocdiff312 = zeros(122,1);
poc12rms = zeros(122,1);
poc12corr = zeros(122,1);

parfor ii=1:122
    pocplus12temp = Smooth2Dfnc(726,482,squeeze(poc12plus(:,:,ii)),0,[25 25],6,1);
    temp = poc12plus(:,:,ii);
    pocplus12temp(isnan(temp)==1) = NaN;
    poc3plus12temp = Smooth2Dfnc(726,482,squeeze(poc3plus12(:,:,ii)),0,[25 25],6,1);
    temp = poc3plus12(:,:,ii);
    poc3plus12temp(isnan(temp)==1) = NaN;
    
    diff = pocplus12temp - poc3plus12temp;
    
    diff = diff(isnan(diff)==0);
    pocdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    
    diff = pocplus12temp;
    diff = diff(isnan(diff)==0);
    poc12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    fprintf('POC diff iteration %g \n',ii)
end

save extras/w100pocdiff312d pocdiff312 poc12rms

clear
close all
clc

load wsPOC3_100m poc3c poc3p

poc3plus = poc3p - poc3c;

clear poc3p poc3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

poc3plus12 = zeros(726,482,122);

poc3plus(poc3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,poc3plus(:,:,ii),'linear');
    poc3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('POCsm interp iteration %g \n',ii)
end

clear poc3plus

load wsPOC12_100m poc12c poc12p

poc12plus = poc12p - poc12c;

% poc12plus(poc12plus==0) = NaN;

poc3plus12(isnan(poc3plus12)==1) = 0;

clear poc12p poc12c

pocdiff312s = zeros(122,1);
poc12rmssm = zeros(122,1);

parfor ii=1:122
    pocplus12temp = Smooth2Dfnc(726,482,squeeze(poc12plus(:,:,ii)),0,[25 25],6,1);
    temp = poc12plus(:,:,ii);
    pocplus12temp(isnan(temp)==1) = NaN;
    poc3plus12temp = Smooth2Dfnc(726,482,squeeze(poc3plus12(:,:,ii)),0,[25 25],6,1);
    temp = poc3plus12(:,:,ii);
    poc3plus12temp(isnan(temp)==1) = NaN;
    
    diff = pocplus12temp - poc3plus12temp;
    
    diff = diff(isnan(diff)==0);
    pocdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = pocplus12temp;
    diff = diff(isnan(diff)==0);
    poc12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('POC small diff iteration %g \n',ii)
end

save extras/w100pocdiff312sd pocdiff312s poc12rmssm

clear
close all
clc

load POC3_100m poc3c poc3p

poc3plus = poc3p - poc3c;

clear poc3p poc3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

poc3plus12 = zeros(726,482,122);

poc3plus(poc3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,poc3plus(:,:,ii),'linear');
    poc3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('POC interp iteration %g \n',ii)
end

clear poc3plus

load POC12_100m poc12c poc12p

poc12plus = poc12p - poc12c;

% poc12plus(poc12plus==0) = NaN;

poc3plus12(isnan(poc3plus12)==1) = 0;

clear poc12p poc12c

pocdiff312 = zeros(122,1);
poc12rms = zeros(122,1);
poc12corr = zeros(122,1);

parfor ii=1:122
    pocplus12temp = Smooth2Dfnc(726,482,squeeze(poc12plus(:,:,ii)),0,[25 25],6,1);
    temp = poc12plus(:,:,ii);
    pocplus12temp(isnan(temp)==1) = NaN;
    poc3plus12temp = Smooth2Dfnc(726,482,squeeze(poc3plus12(:,:,ii)),0,[25 25],6,1);
    temp = poc3plus12(:,:,ii);
    poc3plus12temp(isnan(temp)==1) = NaN;
    
    diff = pocplus12temp - poc3plus12temp;
    
    diff = diff(isnan(diff)==0);
    pocdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    
    diff = pocplus12temp;
    diff = diff(isnan(diff)==0);
    poc12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length = %g \n',length(diff))
    fprintf('POC diff iteration %g \n',ii)
end

save extras/poc100diff312d pocdiff312 poc12rms

clear
close all
clc

load sPOC3_100m poc3c poc3p

poc3plus = poc3p - poc3c;

clear poc3p poc3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

XC3 = XC3(6:187);
YC3 = YC3(6:127);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

poc3plus12 = zeros(726,482,122);

poc3plus(poc3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,poc3plus(:,:,ii),'linear');
    poc3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('POCsm interp iteration %g \n',ii)
end

clear poc3plus

load sPOC12_100m poc12c poc12p

poc12plus = poc12p - poc12c;

% poc12plus(poc12plus==0) = NaN;

poc3plus12(isnan(poc3plus12)==1) = 0;

clear poc12p poc12c

pocdiff312s = zeros(122,1);
poc12rmssm = zeros(122,1);

parfor ii=1:122
    pocplus12temp = Smooth2Dfnc(726,482,squeeze(poc12plus(:,:,ii)),0,[25 25],6,1);
    temp = poc12plus(:,:,ii);
    pocplus12temp(isnan(temp)==1) = NaN;
    poc3plus12temp = Smooth2Dfnc(726,482,squeeze(poc3plus12(:,:,ii)),0,[25 25],6,1);
    temp = poc3plus12(:,:,ii);
    poc3plus12temp(isnan(temp)==1) = NaN;
    
    diff = pocplus12temp - poc3plus12temp;
    
    diff = diff(isnan(diff)==0);
    pocdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = pocplus12temp;
    diff = diff(isnan(diff)==0);
    poc12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('POC small diff iteration %g \n',ii)
end

save extras/poc100diff312sd pocdiff312s poc12rmssm

clear
close all
clc

load ../2020_11_November_analysis/POC3 poc3c poc3p

fprintf('wPOC3 has %g NaNs \n',sum(sum(isnan(poc3c))))

poc3plus = poc3p - poc3c;

clear poc3p poc3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
poc3plus12 = zeros(726,482,122);

poc3plus(poc3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,poc3plus(:,:,ii),'linear');
    poc3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('POC interp iteration %g \n',ii)
end

clear poc3plus

load ../2020_11_November_analysis/POC12 poc12c poc12p

fprintf('The size of poc12c is \n')
size(poc12c)

poc12plus = poc12p - poc12c;
poc12plus = poc12plus(16:741,16:497,:);

% poc12plus(poc12plus==0) = NaN;

poc3plus12(isnan(poc3plus12)==1) = 0;

clear poc12p poc12c

pocdiff312 = zeros(122,1);
poc12rms = zeros(122,1);
poc12corr = zeros(122,1);

parfor ii=1:122
    pocplus12temp = Smooth2Dfnc(726,482,squeeze(poc12plus(:,:,ii)),0,[25 25],6,1);
    temp = poc12plus(:,:,ii);
    pocplus12temp(isnan(temp)==1) = NaN;
    poc3plus12temp = Smooth2Dfnc(726,482,squeeze(poc3plus12(:,:,ii)),0,[25 25],6,1);
    temp = poc3plus12(:,:,ii);
    poc3plus12temp(isnan(temp)==1) = NaN;
    
    diff = pocplus12temp - poc3plus12temp;
    
    diff = diff(isnan(diff)==0);
    pocdiff312(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 1 = %g \n',length(diff))
    
    diff = pocplus12temp;
    diff = diff(isnan(diff)==0);
    poc12rms(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('length 2 = %g \n',length(diff))
    fprintf('POC diff iteration %g \n',ii)
end

save extras/pocdiff312d pocdiff312 poc12rms

clear
close all
clc

load ../2020_11_November_analysis/sPOC3 poc3c poc3p

poc3plus = poc3p - poc3c;

clear poc3p poc3c

load XY3 XC3 YC3
load XY12 XC12 YC12

XC12 = XC12(16:741);
YC12 = YC12(16:497);

[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);

poc3plus12 = zeros(726,482,122);

poc3plus(poc3plus==0) = NaN;

parfor ii=1:122
    F = griddedInterpolant(XC3,YC3,poc3plus(:,:,ii),'linear');
    poc3plus12(:,:,ii) = F(XC12,YC12);
    fprintf('POCsm interp iteration %g \n',ii)
end

clear poc3plus

load sPOC12 poc12c poc12p

poc12plus = poc12p - poc12c;
poc12plus = poc12plus(16:741,16:497,:);

% poc12plus(poc12plus==0) = NaN;

poc3plus12(isnan(poc3plus12)==1) = 0;

clear poc12p poc12c

pocdiff312s = zeros(122,1);
poc12rmssm = zeros(122,1);

parfor ii=1:122
    pocplus12temp = Smooth2Dfnc(726,482,squeeze(poc12plus(:,:,ii)),0,[25 25],6,1);
    temp = poc12plus(:,:,ii);
    pocplus12temp(isnan(temp)==1) = NaN;
    poc3plus12temp = Smooth2Dfnc(726,482,squeeze(poc3plus12(:,:,ii)),0,[25 25],6,1);
    temp = poc3plus12(:,:,ii);
    poc3plus12temp(isnan(temp)==1) = NaN;
    
    diff = pocplus12temp - poc3plus12temp;
    
    diff = diff(isnan(diff)==0);
    pocdiff312s(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    
    diff = pocplus12temp;
    diff = diff(isnan(diff)==0);
    poc12rmssm(ii) = sqrt(sum(diff.^2))/sqrt(length(diff));
    fprintf('POC small diff iteration %g \n',ii)
end

save extras/pocdiff312sd pocdiff312s poc12rmssm

clear
close all



toc()