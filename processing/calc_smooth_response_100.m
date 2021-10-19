clear
close all
clc
tic()

RAC12 = squeeze(rdmds('../MITgcm/verification/wAB12_01_init/run/RAC'));
hFacC12 = rdmds('../MITgcm/verification/wAB12_01_init/run/hFacC');

mask12 = hFacC12(16:741,16:497,1);
RAC12 = RAC12(16:741,16:497);
clear hFacC12

RAC3 = squeeze(rdmds('../MITgcm/verification/wAB3_01_init/run/RAC'));
hFacC3 = rdmds('../MITgcm/verification/wAB3_01_init/run/hFacC');

mask3 = hFacC3(6:187,6:127,1);
RAC3 = RAC3(6:187,6:127);
clear hFacC3

%% SST

load SST3_100m

sst3cs = zeros(182,122,122);
sst3ps = zeros(182,122,122);
sst3ns = zeros(182,122,122);

for ii=1:122
    sst3cs(:,:,ii) = mean(sst3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst3ps(:,:,ii) = mean(sst3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst3ns(:,:,ii) = mean(sst3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/3 SST iteration %g \n',ii)
end

clear sst3c sst3p sst3n

fprintf('1/3 SST \n')
[lin_sst3,nonlin_sst3] = pert_response(sst3cs,...
    sst3ps,sst3ns,mask3,RAC3);

clear sst3*

load SST12_100m

sst12cs = zeros(726,482,122);
sst12ps = zeros(726,482,122);
sst12ns = zeros(726,482,122);

for ii=1:122
    sst12cs(:,:,ii) = mean(sst12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst12ps(:,:,ii) = mean(sst12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst12ns(:,:,ii) = mean(sst12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/12 SST iteration %g \n',ii)
end

fprintf('1/12 SST \n')
[lin_sst12,nonlin_sst12] = pert_response(sst12cs,...
    sst12ps,sst12ns,mask12,RAC12);

clear sst12*

%% DIC

load DIC3_100m

dic3cs = zeros(182,122,122);
dic3ps = zeros(182,122,122);
dic3ns = zeros(182,122,122);

for ii=1:122
    dic3cs(:,:,ii) = mean(dic3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic3ps(:,:,ii) = mean(dic3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic3ns(:,:,ii) = mean(dic3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/3 DIC iteration %g \n',ii)
end

clear dic3c dic3p dic3n

fprintf('1/3 DIC \n')
[lin_dic3,nonlin_dic3] = pert_response(dic3cs,...
    dic3ps,dic3ns,mask3,RAC3);

clear dic3*

load DIC12_100m

dic12cs = zeros(726,482,122);
dic12ps = zeros(726,482,122);
dic12ns = zeros(726,482,122);

for ii=1:122
    dic12cs(:,:,ii) = mean(dic12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic12ps(:,:,ii) = mean(dic12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic12ns(:,:,ii) = mean(dic12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/12 DIC iteration %g \n',ii)
end

fprintf('1/12 DIC \n')
[lin_dic12,nonlin_dic12] = pert_response(dic12cs,...
    dic12ps,dic12ns,mask12,RAC12);

clear dic12*

%% DO

load DO3_100m

do3cs = zeros(182,122,122);
do3ps = zeros(182,122,122);
do3ns = zeros(182,122,122);

for ii=1:122
    do3cs(:,:,ii) = mean(do3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    do3ps(:,:,ii) = mean(do3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    do3ns(:,:,ii) = mean(do3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/3 DO iteration %g \n',ii)
end

clear do3c do3p do3n

fprintf('1/3 DO \n')
[lin_do3,nonlin_do3] = pert_response(do3cs,...
    do3ps,do3ns,mask3,RAC3);

clear do3*

load DO12_100m

do12cs = zeros(726,482,122);
do12ps = zeros(726,482,122);
do12ns = zeros(726,482,122);

for ii=1:122
    do12cs(:,:,ii) = mean(do12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    do12ps(:,:,ii) = mean(do12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    do12ns(:,:,ii) = mean(do12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/12 DO iteration %g \n',ii)
end

fprintf('1/12 DO \n')
[lin_do12,nonlin_do12] = pert_response(do12cs,...
    do12ps,do12ns,mask12,RAC12);

clear do12*

%% NO

load NO3_100m

no3cs = zeros(182,122,122);
no3ps = zeros(182,122,122);
no3ns = zeros(182,122,122);

for ii=1:122
    no3cs(:,:,ii) = mean(no3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    no3ps(:,:,ii) = mean(no3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    no3ns(:,:,ii) = mean(no3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/3 NO3 iteration %g \n',ii)
end

clear no3c no3p no3n

fprintf('1/3 NO \n')
[lin_no3,nonlin_no3] = pert_response(no3cs,...
    no3ps,no3ns,mask3,RAC3);

clear no3*

load NO12_100m

no12cs = zeros(726,482,122);
no12ps = zeros(726,482,122);
no12ns = zeros(726,482,122);

for ii=1:122
    no12cs(:,:,ii) = mean(no12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    no12ps(:,:,ii) = mean(no12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    no12ns(:,:,ii) = mean(no12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/12 NO3 iteration %g \n',ii)
end

fprintf('1/12 NO \n')
[lin_no12,nonlin_no12] = pert_response(no12cs,...
    no12ps,no12ns,mask12,RAC12);

clear no12*

%% SSS

load SSS3_100m

sss3cs = zeros(182,122,122);
sss3ps = zeros(182,122,122);
sss3ns = zeros(182,122,122);

for ii=1:122
    sss3cs(:,:,ii) = mean(sss3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sss3ps(:,:,ii) = mean(sss3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sss3ns(:,:,ii) = mean(sss3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/3 SSS iteration %g \n',ii)
end

clear sss3c sss3p sss3n

fprintf('1/3 SSS \n')
[lin_sss3,nonlin_sss3] = pert_response(sss3cs,...
    sss3ps,sss3ns,mask3,RAC3);

clear sss3*

load SSS12_100m

sss12cs = zeros(726,482,122);
sss12ps = zeros(726,482,122);
sss12ns = zeros(726,482,122);

for ii=1:122
    sss12cs(:,:,ii) = mean(sss12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sss12ps(:,:,ii) = mean(sss12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sss12ns(:,:,ii) = mean(sss12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/12 SSS iteration %g \n',ii)
end

fprintf('1/12 SSS \n')
[lin_sss12,nonlin_sss12] = pert_response(sss12cs,...
    sss12ps,sss12ns,mask12,RAC12);

clear sss12*

%% NPP

load NPP3_100m

fprintf('1/3 NPP \n')
[lin_npp3,nonlin_npp3] = pert_response(npp3c,...
    npp3p,npp3n,mask3,RAC3);

clear npp3*

load NPP12_100m

fprintf('1/12 NPP \n')
[lin_npp12,nonlin_npp12] = pert_response(npp12c,...
    npp12p,npp12n,mask12,RAC12);

clear npp12*

%% NCP

load NCP3_100m

fprintf('1/3 NCP \n')
[lin_ncp3,nonlin_ncp3] = pert_response(ncp3c,...
    ncp3p,ncp3n,mask3,RAC3);

clear ncp3*

load NCP12_100m

fprintf('1/12 NCP \n')
[lin_ncp12,nonlin_ncp12] = pert_response(ncp12c,...
    ncp12p,ncp12n,mask12,RAC12);

clear ncp12*

%% CHL

load CHL3_100m

fprintf('1/3 CHL \n')
[lin_chl3,nonlin_chl3] = pert_response(chl3c,...
    chl3p,chl3n,mask3,RAC3);

clear chl3*

load CHL12_100m

fprintf('1/12 CHL \n')
[lin_chl12,nonlin_chl12] = pert_response(chl12c,...
    chl12p,chl12n,mask12,RAC12);

clear chl12*

%% POC

load POC3_100m

fprintf('1/3 POC \n')
[lin_poc3,nonlin_poc3] = pert_response(poc3c,...
    poc3p,poc3n,mask3,RAC3);

clear poc3*

load POC12_100m

fprintf('1/12 POC \n')
[lin_poc12,nonlin_poc12] = pert_response(poc12c,...
    poc12p,poc12n,mask12,RAC12);

clear poc12*

%% Date and Save

x = datenum('01012017','mmddyyyy');
y = datenum('05032017','mmddyyyy');

six_hours = x:0.25:y;
six_hours = six_hours(1:(end-1));

save PERT_RESPONSE_smooth_100m lin* nonlin* six_hours

toc()

clear
close all
clc
tic()

RAC12 = squeeze(rdmds('../MITgcm/verification/wAB12_01_init/run/RAC'));
hFacC12 = rdmds('../MITgcm/verification/wAB12_01_init/run/hFacC');

mask12 = hFacC12(16:741,16:497,1);
RAC12 = RAC12(16:741,16:497);
clear hFacC12

RAC3 = squeeze(rdmds('../MITgcm/verification/wAB3_01_init/run/RAC'));
hFacC3 = rdmds('../MITgcm/verification/wAB3_01_init/run/hFacC');

mask3 = hFacC3(6:187,6:127,1);
RAC3 = RAC3(6:187,6:127);
clear hFacC3

%% SST

load sSST3_100m

sst3cs = zeros(182,122,122);
sst3ps = zeros(182,122,122);
sst3ns = zeros(182,122,122);

for ii=1:122
    sst3cs(:,:,ii) = mean(sst3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst3ps(:,:,ii) = mean(sst3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst3ns(:,:,ii) = mean(sst3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/3 SST iteration %g \n',ii)
end

clear sst3c sst3p sst3n

fprintf('1/3 SST \n')
[lin_sst3,nonlin_sst3] = pert_response(sst3cs,...
    sst3ps,sst3ns,mask3,RAC3);

clear sst3*

load sSST12_100m

sst12cs = zeros(726,482,122);
sst12ps = zeros(726,482,122);
sst12ns = zeros(726,482,122);

for ii=1:122
    sst12cs(:,:,ii) = mean(sst12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst12ps(:,:,ii) = mean(sst12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst12ns(:,:,ii) = mean(sst12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/12 SST iteration %g \n',ii)
end

fprintf('1/12 SST \n')
[lin_sst12,nonlin_sst12] = pert_response(sst12cs,...
    sst12ps,sst12ns,mask12,RAC12);

clear sst12*

%% DIC

load sDIC3_100m

dic3cs = zeros(182,122,122);
dic3ps = zeros(182,122,122);
dic3ns = zeros(182,122,122);

for ii=1:122
    dic3cs(:,:,ii) = mean(dic3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic3ps(:,:,ii) = mean(dic3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic3ns(:,:,ii) = mean(dic3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/3 DIC iteration %g \n',ii)
end

clear dic3c dic3p dic3n

fprintf('1/3 DIC \n')
[lin_dic3,nonlin_dic3] = pert_response(dic3cs,...
    dic3ps,dic3ns,mask3,RAC3);

clear dic3*

load sDIC12_100m

dic12cs = zeros(726,482,122);
dic12ps = zeros(726,482,122);
dic12ns = zeros(726,482,122);

for ii=1:122
    dic12cs(:,:,ii) = mean(dic12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic12ps(:,:,ii) = mean(dic12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic12ns(:,:,ii) = mean(dic12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/12 DIC iteration %g \n',ii)
end

fprintf('1/12 DIC \n')
[lin_dic12,nonlin_dic12] = pert_response(dic12cs,...
    dic12ps,dic12ns,mask12,RAC12);

clear dic12*

%% DO

load sDO3_100m

do3cs = zeros(182,122,122);
do3ps = zeros(182,122,122);
do3ns = zeros(182,122,122);

for ii=1:122
    do3cs(:,:,ii) = mean(do3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    do3ps(:,:,ii) = mean(do3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    do3ns(:,:,ii) = mean(do3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/3 DO iteration %g \n',ii)
end

clear do3c do3p do3n

fprintf('1/3 DO \n')
[lin_do3,nonlin_do3] = pert_response(do3cs,...
    do3ps,do3ns,mask3,RAC3);

clear do3*

load sDO12_100m

do12cs = zeros(726,482,122);
do12ps = zeros(726,482,122);
do12ns = zeros(726,482,122);

for ii=1:122
    do12cs(:,:,ii) = mean(do12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    do12ps(:,:,ii) = mean(do12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    do12ns(:,:,ii) = mean(do12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/12 DO iteration %g \n',ii)
end

fprintf('1/12 DO \n')
[lin_do12,nonlin_do12] = pert_response(do12cs,...
    do12ps,do12ns,mask12,RAC12);

clear do12*

%% NO

load sNO3_100m

no3cs = zeros(182,122,122);
no3ps = zeros(182,122,122);
no3ns = zeros(182,122,122);

for ii=1:122
    no3cs(:,:,ii) = mean(no3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    no3ps(:,:,ii) = mean(no3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    no3ns(:,:,ii) = mean(no3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/3 NO3 iteration %g \n',ii)
end

clear no3c no3p no3n

fprintf('1/3 NO \n')
[lin_no3,nonlin_no3] = pert_response(no3cs,...
    no3ps,no3ns,mask3,RAC3);

clear no3*

load sNO12_100m

no12cs = zeros(726,482,122);
no12ps = zeros(726,482,122);
no12ns = zeros(726,482,122);

for ii=1:122
    no12cs(:,:,ii) = mean(no12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    no12ps(:,:,ii) = mean(no12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    no12ns(:,:,ii) = mean(no12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/12 NO3 iteration %g \n',ii)
end

fprintf('1/12 NO \n')
[lin_no12,nonlin_no12] = pert_response(no12cs,...
    no12ps,no12ns,mask12,RAC12);

clear no12*

%% SSS

load sSSS3_100m

sss3cs = zeros(182,122,122);
sss3ps = zeros(182,122,122);
sss3ns = zeros(182,122,122);

for ii=1:122
    sss3cs(:,:,ii) = mean(sss3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sss3ps(:,:,ii) = mean(sss3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sss3ns(:,:,ii) = mean(sss3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/3 SSS iteration %g \n',ii)
end

clear sss3c sss3p sss3n

fprintf('1/3 SSS \n')
[lin_sss3,nonlin_sss3] = pert_response(sss3cs,...
    sss3ps,sss3ns,mask3,RAC3);

clear sss3*

load sSSS12_100m

sss12cs = zeros(726,482,122);
sss12ps = zeros(726,482,122);
sss12ns = zeros(726,482,122);

for ii=1:122
    sss12cs(:,:,ii) = mean(sss12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sss12ps(:,:,ii) = mean(sss12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sss12ns(:,:,ii) = mean(sss12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    fprintf('Completed 1/12 SSS iteration %g \n',ii)
end

fprintf('1/12 SSS \n')
[lin_sss12,nonlin_sss12] = pert_response(sss12cs,...
    sss12ps,sss12ns,mask12,RAC12);

clear sss12*

%% NPP

load sNPP3_100m

fprintf('1/3 NPP \n')
[lin_npp3,nonlin_npp3] = pert_response(npp3c,...
    npp3p,npp3n,mask3,RAC3);

clear npp3*

load sNPP12_100m

fprintf('1/12 NPP \n')
[lin_npp12,nonlin_npp12] = pert_response(npp12c,...
    npp12p,npp12n,mask12,RAC12);

clear npp12*

%% NCP

load sNCP3_100m

fprintf('1/3 NCP \n')
[lin_ncp3,nonlin_ncp3] = pert_response(ncp3c,...
    ncp3p,ncp3n,mask3,RAC3);

clear ncp3*

load sNCP12_100m

fprintf('1/12 NCP \n')
[lin_ncp12,nonlin_ncp12] = pert_response(ncp12c,...
    ncp12p,ncp12n,mask12,RAC12);

clear ncp12*

%% CHL

load sCHL3_100m

fprintf('1/3 CHL \n')
[lin_chl3,nonlin_chl3] = pert_response(chl3c,...
    chl3p,chl3n,mask3,RAC3);

clear chl3*

load sCHL12_100m

fprintf('1/12 CHL \n')
[lin_chl12,nonlin_chl12] = pert_response(chl12c,...
    chl12p,chl12n,mask12,RAC12);

clear chl12*

%% POC

load sPOC3_100m

fprintf('1/3 POC \n')
[lin_poc3,nonlin_poc3] = pert_response(poc3c,...
    poc3p,poc3n,mask3,RAC3);

clear poc3*

load sPOC12_100m

fprintf('1/12 POC \n')
[lin_poc12,nonlin_poc12] = pert_response(poc12c,...
    poc12p,poc12n,mask12,RAC12);

clear poc12*

%% Date and Save

x = datenum('01012017','mmddyyyy');
y = datenum('05032017','mmddyyyy');

six_hours = x:0.25:y;
six_hours = six_hours(1:(end-1));

save sPERT_RESPONSE_smooth_100m lin* nonlin* six_hours

toc()

