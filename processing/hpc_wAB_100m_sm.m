clear
close all
clc
tic()

hFacC = rdmds('../MITgcm/verification/wAB3_01_init/run/hFacC');
hFacW = rdmds('../MITgcm/verification/wAB3_01_init/run/hFacW');
hFacS = rdmds('../MITgcm/verification/wAB3_01_init/run/hFacS');
DXG = rdmds('../MITgcm/verification/wAB3_01_init/run/DXG');
DYG = rdmds('../MITgcm/verification/wAB3_01_init/run/DYG');
XC = rdmds('../MITgcm/verification/wAB3_01_init/run/XC');
YC = rdmds('../MITgcm/verification/wAB3_01_init/run/YC');
RAC = squeeze(rdmds('../MITgcm/verification/wAB3_01_init/run/RAC'));
RC = squeeze(rdmds('../MITgcm/verification/wAB3_01_init/run/RC'));
RF3 = squeeze(rdmds('../MITgcm/verification/wAB3_01_init/run/RF'));
DRF = rdmds('../MITgcm/verification/wAB3_01_init/run/DRF');

%% prelim

% select area
x = 6:187;
y = 6:127;
z = 1:12; % top 100m
hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);

volume = zeros(nx,ny,nz);

for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
end

vol100m = squeeze(sum(volume,3));
vol100m(vol100m==0) = 1;

str3c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB3_02_ctrl/';
str3p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB3_05_pert/';
str3n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB3_06_npert/';

sst3c = zeros(182,122,488);
sst3p = zeros(182,122,488);
sst3n = zeros(182,122,488);
sss3c = zeros(182,122,488);
sss3p = zeros(182,122,488);
sss3n = zeros(182,122,488);
ssh3c = zeros(182,122,488);
ssh3p = zeros(182,122,488);
ssh3n = zeros(182,122,488);
dic3c = zeros(182,122,488);
dic3p = zeros(182,122,488);
dic3n = zeros(182,122,488);
do3c = zeros(182,122,488);
do3p = zeros(182,122,488);
do3n = zeros(182,122,488);
no3c = zeros(182,122,488);
no3p = zeros(182,122,488);
no3n = zeros(182,122,488);

for ii=1:488
    fprintf('1/3 iteration %g \n',ii)
    charstate = [str3c,'diag_state/diag_state.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst3c(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',2);
    sss3c(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    charstate = [str3p,'diag_state/diag_state.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst3p(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',2);
    sss3p(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    charstate = [str3n,'diag_state/diag_state.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst3n(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',2);
    sss3n(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    
    charstate = [str3c,'diag_bgc/diag_bgc.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    dic3c(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',3);
    do3c(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',4);
    no3c(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    charstate = [str3p,'diag_bgc/diag_bgc.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    dic3p(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',3);
    do3p(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',4);
    no3p(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    charstate = [str3n,'diag_bgc/diag_bgc.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    dic3n(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',3);
    do3n(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',4);
    no3n(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
end

save wsSST3_100m sst3*
save wsSSS3_100m sss3*
save wsDIC3_100m dic3*
save wsDO3_100m do3*
save wsNO3_100m no3*

str3c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB3_02_ctrl/';
str3p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB3_05_pert/';
str3n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB3_06_npert/';

chl3c = zeros(182,122,122);
chl3p = zeros(182,122,122);
chl3n = zeros(182,122,122);
poc3c = zeros(182,122,122);
poc3p = zeros(182,122,122);
poc3n = zeros(182,122,122);
ncp3c = zeros(182,122,122);
ncp3p = zeros(182,122,122);
ncp3n = zeros(182,122,122);
npp3c = zeros(182,122,122);
npp3p = zeros(182,122,122);
npp3n = zeros(182,122,122);


for ii=1:122
    fprintf('1/3 bio iteration %g \n',ii)
    charstate = [str3c,'diag_bio/diag_bio.',num2str(48*ii+1440,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ncp3c(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',2);
    npp3c(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',3);
    chl3c(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',4);
    poc3c(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    charstate = [str3p,'diag_bio/diag_bio.',num2str(48*ii+1440,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ncp3p(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',2);
    npp3p(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',3);
    chl3p(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',4);
    poc3p(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    charstate = [str3n,'diag_bio/diag_bio.',num2str(48*ii+1440,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ncp3n(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',2);
    npp3n(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',3);
    chl3n(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
    temp = rdmds(charstate,'rec',4);
    poc3n(:,:,ii) = squeeze(sum((temp(x,y,z).*volume)./vol100m,3));
    clear temp
end

save wsCHL3_100m chl3*
save wsNCP3_100m ncp3*
save wsNPP3_100m npp3*
save wsPOC3_100m poc3*

clear

fprintf('finished 1/3 outputs \n')

%% SST

hFacC = rdmds('../MITgcm/verification/wAB12_01_init/run/hFacC');
RAC = squeeze(rdmds('../MITgcm/verification/wAB12_01_init/run/RAC'));
DRF = rdmds('../MITgcm/verification/wAB12_01_init/run/DRF');

% select area
x = 16:741;
y = 16:497;
z = 1:23; % top 100m

hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);
volume = zeros(nx,ny,nz);

for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
end

vol100m = squeeze(sum(volume,3));
vol100m(vol100m==0) = 1;

str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_state/';

sst12c = single(zeros(726,482,488));

parfor ii=1:488
    fprintf('1/12 control SST iteration %g \n',ii) 
    charstate = [str12c,'diag_state.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst12c(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_state/';

sst12p = single(zeros(726,482,488));

parfor ii=1:488
    fprintf('1/12 pert SST iteration %g \n',ii) 
    charstate = [str12p,'diag_state.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst12p(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_state/';

sst12n = single(zeros(726,482,488));

parfor ii=1:488
    fprintf('1/12 negative pert SST iteration %g \n',ii)
    charstate = [str12n,'diag_state.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst12n(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

save wsSST12_100m sst12*

clear

%% END SST

%% DIC

hFacC = rdmds('../MITgcm/verification/wAB12_01_init/run/hFacC');
RAC = squeeze(rdmds('../MITgcm/verification/wAB12_01_init/run/RAC'));
DRF = rdmds('../MITgcm/verification/wAB12_01_init/run/DRF');

% select area
x = 16:741;
y = 16:497;
z = 1:23; % top 100m

hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);
volume = zeros(nx,ny,nz);

for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
end

vol100m = squeeze(sum(volume,3));
vol100m(vol100m==0) = 1;


str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_bgc/';

dic12c = single(zeros(726,482,488));

parfor ii=1:488
    fprintf('1/12 control DIC iteration %g \n',ii) 
    charbgc = [str12c,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic12c(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_bgc/';

dic12p = single(zeros(726,482,488));

parfor ii=1:488
    fprintf('1/12 pert DIC iteration %g \n',ii) 
    charbgc = [str12p,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic12p(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_bgc/';

dic12n = single(zeros(726,482,488));

parfor ii=1:488
    fprintf('1/12 negative pert DIC iteration %g \n',ii)
    charbgc = [str12n,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic12n(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

save wsDIC12_100m dic12*

clear

%% END DIC

%% SSS

hFacC = rdmds('../MITgcm/verification/wAB12_01_init/run/hFacC');
RAC = squeeze(rdmds('../MITgcm/verification/wAB12_01_init/run/RAC'));
DRF = rdmds('../MITgcm/verification/wAB12_01_init/run/DRF');

% select area
x = 16:741;
y = 16:497;
z = 1:23; % top 100m

hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);
volume = zeros(nx,ny,nz);

for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
end

vol100m = squeeze(sum(volume,3));
vol100m(vol100m==0) = 1;


str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_state/';

sss12c = single(zeros(726,482,488));

parfor ii=1:488
    fprintf('1/12 control SSS iteration %g \n',ii) 
    charstate = [str12c,'diag_state.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charstate,'rec',2);
    sss12c(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_state/';

sss12p = single(zeros(726,482,488));

parfor ii=1:488
    fprintf('1/12 pert SSS iteration %g \n',ii) 
    charstate = [str12p,'diag_state.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charstate,'rec',2);
    sss12p(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_state/';

sss12n = single(zeros(726,482,488));

parfor ii=1:488
    fprintf('1/12 negative pert SSS iteration %g \n',ii)
    charstate = [str12n,'diag_state.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charstate,'rec',2);
    sss12n(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

save wsSSS12_100m sss12*

clear

%% END SSS

%% DO

hFacC = rdmds('../MITgcm/verification/wAB12_01_init/run/hFacC');
RAC = squeeze(rdmds('../MITgcm/verification/wAB12_01_init/run/RAC'));
DRF = rdmds('../MITgcm/verification/wAB12_01_init/run/DRF');

% select area
x = 16:741;
y = 16:497;
z = 1:23; % top 100m

hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);
volume = zeros(nx,ny,nz);

for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
end

vol100m = squeeze(sum(volume,3));
vol100m(vol100m==0) = 1;


str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_bgc/';

do12c = single(zeros(726,482,488));

parfor ii=1:488
    fprintf('1/12 control DO iteration %g \n',ii) 
    charbgc = [str12c,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',3);
    do12c(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_bgc/';

do12p = single(zeros(726,482,488));

parfor ii=1:488
    fprintf('1/12 pert DO iteration %g \n',ii) 
    charbgc = [str12p,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',3);
    do12p(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_bgc/';

do12n = single(zeros(726,482,488));

parfor ii=1:488
    fprintf('1/12 negative pert DO iteration %g \n',ii)
    charbgc = [str12n,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',3);
    do12n(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

save wsDO12_100m do12*

clear

%% END DO

%% NITRATE

hFacC = rdmds('../MITgcm/verification/wAB12_01_init/run/hFacC');
RAC = squeeze(rdmds('../MITgcm/verification/wAB12_01_init/run/RAC'));
DRF = rdmds('../MITgcm/verification/wAB12_01_init/run/DRF');

% select area
x = 16:741;
y = 16:497;
z = 1:23; % top 100m

hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);
volume = zeros(nx,ny,nz);

for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
end

vol100m = squeeze(sum(volume,3));
vol100m(vol100m==0) = 1;


str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_bgc/';

no12c = single(zeros(726,482,488));

parfor ii=1:488
    fprintf('1/12 control NO iteration %g \n',ii) 
    charbgc = [str12c,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',4);
    no12c(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_bgc/';

no12p = single(zeros(726,482,488));

parfor ii=1:488
    fprintf('1/12 pert NO iteration %g \n',ii) 
    charbgc = [str12p,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',4);
    no12p(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_bgc/';

no12n = single(zeros(726,482,488));

parfor ii=1:488
    fprintf('1/12 negative pert NO iteration %g \n',ii)
    charbgc = [str12n,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',4);
    no12n(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

save wsNO12_100m no12*

clear

%% END NITRATE


%% POC

hFacC = rdmds('../MITgcm/verification/wAB12_01_init/run/hFacC');
RAC = squeeze(rdmds('../MITgcm/verification/wAB12_01_init/run/RAC'));
DRF = rdmds('../MITgcm/verification/wAB12_01_init/run/DRF');

% select area
x = 16:741;
y = 16:497;
z = 1:23; % top 100m

hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);
volume = zeros(nx,ny,nz);

for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
end

vol100m = squeeze(sum(volume,3));
vol100m(vol100m==0) = 1;


str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_bio/';
poc12c = single(zeros(726,482,122));

parfor ii=1:122
    fprintf('1/12 control POC iteration %g \n',ii)
    charbio = [str12c,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',4);
    poc12c(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_bio/';

poc12p = single(zeros(726,482,122));

parfor ii=1:122
    fprintf('1/12 pert POC iteration %g \n',ii)
    charbio = [str12p,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',4);
    poc12p(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_bio/';

poc12n = single(zeros(726,482,122));

parfor ii=1:122
    fprintf('1/12 negative pert POC iteration %g \n',ii)
    charbio = [str12n,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',4);
    poc12n(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

save wsPOC12_100m poc12*

clear

%% END POC

%% CHL

hFacC = rdmds('../MITgcm/verification/wAB12_01_init/run/hFacC');
RAC = squeeze(rdmds('../MITgcm/verification/wAB12_01_init/run/RAC'));
DRF = rdmds('../MITgcm/verification/wAB12_01_init/run/DRF');

% select area
x = 16:741;
y = 16:497;
z = 1:23; % top 100m

hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);
volume = zeros(nx,ny,nz);

for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
end

vol100m = squeeze(sum(volume,3));
vol100m(vol100m==0) = 1;


str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_bio/';
chl12c = single(zeros(726,482,122));

parfor ii=1:122
    fprintf('1/12 control CHL iteration %g \n',ii)
    charbio = [str12c,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',3);
    chl12c(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_bio/';

chl12p = single(zeros(726,482,122));

parfor ii=1:122
    fprintf('1/12 pert CHL iteration %g \n',ii)
    charbio = [str12p,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',3);
    chl12p(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_bio/';

chl12n = single(zeros(726,482,122));

parfor ii=1:122
    fprintf('1/12 negative pert CHL iteration %g \n',ii)
    charbio = [str12n,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',3);
    chl12n(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

save wsCHL12_100m chl12*

clear

%% END CHL

%% NPP

hFacC = rdmds('../MITgcm/verification/wAB12_01_init/run/hFacC');
RAC = squeeze(rdmds('../MITgcm/verification/wAB12_01_init/run/RAC'));
DRF = rdmds('../MITgcm/verification/wAB12_01_init/run/DRF');

% select area
x = 16:741;
y = 16:497;
z = 1:23; % top 100m

hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);
volume = zeros(nx,ny,nz);

for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
end

vol100m = squeeze(sum(volume,3));
vol100m(vol100m==0) = 1;


str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_bio/';
npp12c = single(zeros(726,482,122));

parfor ii=1:122
    fprintf('1/12 control NPP iteration %g \n',ii)
    charbio = [str12c,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',2);
    npp12c(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_bio/';

npp12p = single(zeros(726,482,122));

parfor ii=1:122
    fprintf('1/12 pert NPP iteration %g \n',ii)
    charbio = [str12p,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',2);
    npp12p(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_bio/';

npp12n = single(zeros(726,482,122));

parfor ii=1:122
    fprintf('1/12 negative pert NPP iteration %g \n',ii)
    charbio = [str12n,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',2);
    npp12n(:,:,ii) = single(squeeze(sum((temp(x,y,z).*volume)./vol100m,3)));
end

save wsNPP12_100m npp12*

clear

%% END NPP


toc()
