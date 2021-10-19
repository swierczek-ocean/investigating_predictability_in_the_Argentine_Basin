clear
close all
clc
tic()

str3c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB3_02_ctrl/';
str3p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB3_05_pert/';
str3n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB3_06_npert/';
hFacC = rdmds([str3c,'run/hFacC']);
RF = squeeze(rdmds([str3c,'run/RF']));

sst3c = zeros(192,132,488);
sst3p = zeros(192,132,488);
sst3n = zeros(192,132,488);
sss3c = zeros(192,132,488);
sss3p = zeros(192,132,488);
sss3n = zeros(192,132,488);
ssh3c = zeros(192,132,488);
ssh3p = zeros(192,132,488);
ssh3n = zeros(192,132,488);
tf3c = zeros(192,132,488);
tf3p = zeros(192,132,488);
tf3n = zeros(192,132,488);
cf3c = zeros(192,132,488);
cf3p = zeros(192,132,488);
cf3n = zeros(192,132,488);
dic3c = zeros(192,132,488);
dic3p = zeros(192,132,488);
dic3n = zeros(192,132,488);
do3c = zeros(192,132,488);
do3p = zeros(192,132,488);
do3n = zeros(192,132,488);
no3c = zeros(192,132,488);
no3p = zeros(192,132,488);
no3n = zeros(192,132,488);
mld3c = zeros(192,132,488);
mld3p = zeros(192,132,488);
mld3n = zeros(192,132,488);

for ii=1:488
    fprintf('1/3 iteration %g \n',ii)
    charstate = [str3c,'diag_state/diag_state.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst3c(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',2);
    sss3c(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',7);
    mld3c(:,:,ii) = get_mld(temp,RF,hFacC);
    clear temp
    charstate = [str3p,'diag_state/diag_state.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst3p(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',2);
    sss3p(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',7);
    mld3p(:,:,ii) = get_mld(temp,RF,hFacC);
    clear temp
    charstate = [str3n,'diag_state/diag_state.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst3n(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',2);
    sss3n(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',7);
    mld3n(:,:,ii) = get_mld(temp,RF,hFacC);
    clear temp
    
    charstate = [str3c,'diag_surf/diag_surf.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ssh3c(:,:,ii) = temp;
    clear temp
    charstate = [str3p,'diag_surf/diag_surf.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ssh3p(:,:,ii) = temp;
    clear temp
    charstate = [str3n,'diag_surf/diag_surf.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ssh3n(:,:,ii) = temp;
    clear temp
    
    charstate = [str3c,'diag_airsea/diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    tf3c(:,:,ii) = temp;
    clear temp
    charstate = [str3p,'diag_airsea/diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    tf3p(:,:,ii) = temp;
    clear temp
    charstate = [str3n,'diag_airsea/diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    tf3n(:,:,ii) = temp;
    clear temp
    
    charstate = [str3c,'diag_airsea/diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',3);
    cf3c(:,:,ii) = temp;
    clear temp
    charstate = [str3p,'diag_airsea/diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',3);
    cf3p(:,:,ii) = temp;
    clear temp
    charstate = [str3n,'diag_airsea/diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',3);
    cf3n(:,:,ii) = temp;
    clear temp
    
    charstate = [str3c,'diag_bgc/diag_bgc.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    dic3c(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',3);
    do3c(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',4);
    no3c(:,:,ii) = temp(:,:,1);
    clear temp
    charstate = [str3p,'diag_bgc/diag_bgc.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    dic3p(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',3);
    do3p(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',4);
    no3p(:,:,ii) = temp(:,:,1);
    clear temp
    charstate = [str3n,'diag_bgc/diag_bgc.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    dic3n(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',3);
    do3n(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',4);
    no3n(:,:,ii) = temp(:,:,1);
    clear temp
end

save wsSST3 sst3*
save wsSSS3 sss3*
save wsSSH3 ssh3*
save wsTF3 tf3*
save wsCF3 cf3*
save wsDIC3 dic3*
save wsDO3 do3*
save wsNO3 no3*
save wsMLD3 mld3*

str3c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB3_02_ctrl/';
str3p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB3_05_pert/';
str3n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB3_06_npert/';

chl3c = zeros(192,132,122);
chl3p = zeros(192,132,122);
chl3n = zeros(192,132,122);
poc3c = zeros(192,132,122);
poc3p = zeros(192,132,122);
poc3n = zeros(192,132,122);
ncp3c = zeros(192,132,122);
ncp3p = zeros(192,132,122);
ncp3n = zeros(192,132,122);
npp3c = zeros(192,132,122);
npp3p = zeros(192,132,122);
npp3n = zeros(192,132,122);

dd = 1;

for ii=1:122
    fprintf('1/3 bio iteration %g \n',ii)
    charstate = [str3c,'diag_bio/diag_bio.',num2str(48*ii+1440,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ncp3c(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',2);
    npp3c(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',3);
    chl3c(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',4);
    poc3c(:,:,ii) = temp(:,:,dd);
    clear temp
    charstate = [str3p,'diag_bio/diag_bio.',num2str(48*ii+1440,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ncp3p(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',2);
    npp3p(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',3);
    chl3p(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',4);
    poc3p(:,:,ii) = temp(:,:,dd);
    clear temp
    charstate = [str3n,'diag_bio/diag_bio.',num2str(48*ii+1440,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ncp3n(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',2);
    npp3n(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',3);
    chl3n(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',4);
    poc3n(:,:,ii) = temp(:,:,dd);
    clear temp
end

save wsCHL3 chl3*
save wsNCP3 ncp3*
save wsNPP3 npp3*
save wsPOC3 poc3*

clear

fprintf('finished 1/3 outputs \n')

%% SSH

str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_surf/';

ssh12c = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 control SSH iteration %g \n',ii)
    ssh12c(:,:,ii) = rdmds([str12c,'diag_surf.',num2str(180*ii+21780,'%010.f')],'rec',1);
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_surf/';

ssh12p = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 pert SSH iteration %g \n',ii)
    ssh12p(:,:,ii) = rdmds([str12p,'diag_surf.',num2str(180*ii+21780,'%010.f')],'rec',1);
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_surf/';

ssh12n = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 negative pert SSH iteration %g \n',ii)
    ssh12n(:,:,ii) = rdmds([str12n,'diag_surf.',num2str(180*ii+21780,'%010.f')],'rec',1);
end

save wsSSH12 ssh12*

clear
%% END SSH

%% TFLUX

str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_airsea/';

tf12c = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 control TF iteration %g \n',ii)
    tf12c(:,:,ii) = rdmds([str12c,'diag_airsea.',num2str(180*ii+21780,'%010.f')],'rec',1);
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_airsea/';

tf12p = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 pert TF iteration %g \n',ii)
    tf12p(:,:,ii) = rdmds([str12p,'diag_airsea.',num2str(180*ii+21780,'%010.f')],'rec',1);
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_airsea/';

tf12n = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 negative pert TF iteration %g \n',ii)
    tf12n(:,:,ii) = rdmds([str12n,'diag_airsea.',num2str(180*ii+21780,'%010.f')],'rec',1);
end

save wsTF12 tf12*

clear

%% END TFLUX

%% CFLUX

str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_airsea/';

cf12c = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 control CF iteration %g \n',ii)
    cf12c(:,:,ii) = rdmds([str12c,'diag_airsea.',num2str(180*ii+21780,'%010.f')],'rec',3);
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_airsea/';

cf12p = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 pert CF iteration %g \n',ii)
    cf12p(:,:,ii) = rdmds([str12p,'diag_airsea.',num2str(180*ii+21780,'%010.f')],'rec',3);
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_airsea/';

cf12n = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 negative pert CF iteration %g \n',ii)
    cf12n(:,:,ii) = rdmds([str12n,'diag_airsea.',num2str(180*ii+21780,'%010.f')],'rec',3);
end

save wsCF12 cf12*

clear

%% END CFLUX

%% SST

str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_state/';

sst12c = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 control SST iteration %g \n',ii) 
    charstate = [str12c,'diag_state.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst12c(:,:,ii) = single(temp(:,:,1));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_state/';

sst12p = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 pert SST iteration %g \n',ii) 
    charstate = [str12p,'diag_state.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst12p(:,:,ii) = single(temp(:,:,1));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_state/';

sst12n = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 negative pert SST iteration %g \n',ii)
    charstate = [str12n,'diag_state.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst12n(:,:,ii) = single(temp(:,:,1));
end

save wsSST12 sst12*

clear

%% END SST

%% DIC

str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_bgc/';

dic12c = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 control DIC iteration %g \n',ii) 
    charbgc = [str12c,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic12c(:,:,ii) = single(temp(:,:,1));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_bgc/';

dic12p = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 pert DIC iteration %g \n',ii) 
    charbgc = [str12p,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic12p(:,:,ii) = single(temp(:,:,1));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_bgc/';

dic12n = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 negative pert DIC iteration %g \n',ii)
    charbgc = [str12n,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic12n(:,:,ii) = single(temp(:,:,1));
end

save wsDIC12 dic12*

clear

%% END DIC

%% SSS

str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_state/';

sss12c = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 control SSS iteration %g \n',ii) 
    charstate = [str12c,'diag_state.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charstate,'rec',2);
    sss12c(:,:,ii) = single(temp(:,:,1));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_state/';

sss12p = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 pert SSS iteration %g \n',ii) 
    charstate = [str12p,'diag_state.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charstate,'rec',2);
    sss12p(:,:,ii) = single(temp(:,:,1));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_state/';

sss12n = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 negative pert SSS iteration %g \n',ii)
    charstate = [str12n,'diag_state.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charstate,'rec',2);
    sss12n(:,:,ii) = single(temp(:,:,1));
end

save wsSSS12 sss12*

clear

%% END SSS

%% DO

str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_bgc/';

do12c = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 control DO iteration %g \n',ii) 
    charbgc = [str12c,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',3);
    do12c(:,:,ii) = single(temp(:,:,1));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_bgc/';

do12p = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 pert DO iteration %g \n',ii) 
    charbgc = [str12p,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',3);
    do12p(:,:,ii) = single(temp(:,:,1));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_bgc/';

do12n = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 negative pert DO iteration %g \n',ii)
    charbgc = [str12n,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',3);
    do12n(:,:,ii) = single(temp(:,:,1));
end

save wsDO12 do12*

clear

%% END DO

%% NITRATE

str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_bgc/';

no12c = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 control NO iteration %g \n',ii) 
    charbgc = [str12c,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',4);
    no12c(:,:,ii) = single(temp(:,:,1));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_bgc/';

no12p = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 pert NO iteration %g \n',ii) 
    charbgc = [str12p,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',4);
    no12p(:,:,ii) = single(temp(:,:,1));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_bgc/';

no12n = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 negative pert NO iteration %g \n',ii)
    charbgc = [str12n,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',4);
    no12n(:,:,ii) = single(temp(:,:,1));
end

save wsNO12 no12*

clear

%% END NITRATE

%% MLD

str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_state/';
hFacC = rdmds([str12c,'../run/hFacC']);
RF = squeeze(rdmds([str12c,'../run/RF']));
mld12c = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 control MLD iteration %g \n',ii)
    mld12c(:,:,ii) = get_mld(rdmds([str12c,'diag_state.',...
        num2str(180*ii+21780,'%010.f')],'rec',7),RF,hFacC);
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_state/';

mld12p = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 pert MLD iteration %g \n',ii)
    mld12p(:,:,ii) = get_mld(rdmds([str12p,'diag_state.',...
        num2str(180*ii+21780,'%010.f')],'rec',7),RF,hFacC);
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_state/';

mld12n = single(zeros(756,512,488));

parfor ii=1:488
    fprintf('1/12 negative pert MLD iteration %g \n',ii)
    mld12n(:,:,ii) = get_mld(rdmds([str12n,'diag_state.',...
        num2str(180*ii+21780,'%010.f')],'rec',7),RF,hFacC);
end

save wsMLD12 mld12*

clear

%% END MLD

%% POC

str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_bio/';
dd = 1;
poc12c = single(zeros(756,512,122));

parfor ii=1:122
    fprintf('1/12 control POC iteration %g \n',ii)
    charbio = [str12c,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',4);
    poc12c(:,:,ii) = single(temp(:,:,dd));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_bio/';

poc12p = single(zeros(756,512,122));

parfor ii=1:122
    fprintf('1/12 pert POC iteration %g \n',ii)
    charbio = [str12p,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',4);
    poc12p(:,:,ii) = single(temp(:,:,dd));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_bio/';

poc12n = single(zeros(756,512,122));

parfor ii=1:122
    fprintf('1/12 negative pert POC iteration %g \n',ii)
    charbio = [str12n,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',4);
    poc12n(:,:,ii) = single(temp(:,:,dd));
end

save wsPOC12 poc12*

clear

%% END POC

%% CHL

str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_bio/';
dd = 1;
chl12c = single(zeros(756,512,122));

parfor ii=1:122
    fprintf('1/12 control CHL iteration %g \n',ii)
    charbio = [str12c,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',3);
    chl12c(:,:,ii) = single(temp(:,:,dd));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_bio/';

chl12p = single(zeros(756,512,122));

parfor ii=1:122
    fprintf('1/12 pert CHL iteration %g \n',ii)
    charbio = [str12p,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',3);
    chl12p(:,:,ii) = single(temp(:,:,dd));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_bio/';

chl12n = single(zeros(756,512,122));

parfor ii=1:122
    fprintf('1/12 negative pert CHL iteration %g \n',ii)
    charbio = [str12n,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',3);
    chl12n(:,:,ii) = single(temp(:,:,dd));
end

save wsCHL12 chl12*

clear

%% END CHL

%% NPP

str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_bio/';
dd = 1;
npp12c = single(zeros(756,512,122));

parfor ii=1:122
    fprintf('1/12 control NPP iteration %g \n',ii)
    charbio = [str12c,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',2);
    npp12c(:,:,ii) = single(temp(:,:,dd));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_bio/';

npp12p = single(zeros(756,512,122));

parfor ii=1:122
    fprintf('1/12 pert NPP iteration %g \n',ii)
    charbio = [str12p,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',2);
    npp12p(:,:,ii) = single(temp(:,:,dd));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_bio/';

npp12n = single(zeros(756,512,122));

parfor ii=1:122
    fprintf('1/12 negative pert NPP iteration %g \n',ii)
    charbio = [str12n,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',2);
    npp12n(:,:,ii) = single(temp(:,:,dd));
end

save wsNPP12 npp12*

clear

%% END NPP

%% NCP

str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_02_ctrl/diag_bio/';
dd = 1;
ncp12c = single(zeros(756,512,122));

parfor ii=1:122
    fprintf('1/12 control NCP iteration %g \n',ii)
    charbio = [str12c,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',1);
    ncp12c(:,:,ii) = single(temp(:,:,dd));
end

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_05_pert/diag_bio/';

ncp12p = single(zeros(756,512,122));

parfor ii=1:122
    fprintf('1/12 pert NCP iteration %g \n',ii)
    charbio = [str12p,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',1);
    ncp12p(:,:,ii) = single(temp(:,:,dd));
end

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/wAB12_06_npert/diag_bio/';

ncp12n = single(zeros(756,512,122));

parfor ii=1:122
    fprintf('1/12 negative pert NCP iteration %g \n',ii)
    charbio = [str12n,'diag_bio.',num2str(720*ii+21600,'%010.f')];
    temp = rdmds(charbio,'rec',1);
    ncp12n(:,:,ii) = single(temp(:,:,dd));
end

save wsNCP12 ncp12*

clear

%% END NCP

toc()
