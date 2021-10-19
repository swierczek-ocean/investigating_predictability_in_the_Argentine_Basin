clear
close all
clc
tic()

RAC12 = rdmds('RAC12');
hFacC12 = rdmds('hFacC12');

mask12 = hFacC12(16:741,16:497,1);
RAC12 = RAC12(16:741,16:497);
clear hFacC12

RAC3 = rdmds('RAC3');
hFacC3 = rdmds('hFacC3');

mask3 = hFacC3(6:187,6:127,1);
RAC3 = RAC3(6:187,6:127);
clear hFacC3

%% SST

load SST3

sst3cs = zeros(192,132,122);
sst3ps = zeros(192,132,122);
sst3ns = zeros(192,132,122);

for ii=1:122
    sst3cs(:,:,ii) = mean(sst3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst3ps(:,:,ii) = mean(sst3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst3ns(:,:,ii) = mean(sst3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sst3c sst3p sst3n

fprintf('1/3 SST \n')
[lin_sst3,nonlin_sst3] = pert_response(sst3cs(6:187,6:127,:),...
    sst3ps(6:187,6:127,:),sst3ns(6:187,6:127,:),mask3,RAC3);

clear sst3*

load SST12

sst12cs = zeros(756,512,122);
sst12ps = zeros(756,512,122);
sst12ns = zeros(756,512,122);

for ii=1:122
    sst12cs(:,:,ii) = mean(sst12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst12ps(:,:,ii) = mean(sst12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst12ns(:,:,ii) = mean(sst12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

fprintf('1/12 SST \n')
[lin_sst12,nonlin_sst12] = pert_response(sst12cs(16:741,16:497,:),...
    sst12ps(16:741,16:497,:),sst12ns(16:741,16:497,:),mask12,RAC12);

clear sst12*

% %% SSH
% 
% load SSH3
% 
% ssh3cs = zeros(192,132,122);
% ssh3ps = zeros(192,132,122);
% ssh3ns = zeros(192,132,122);
% 
% for ii=1:122
%     ssh3cs(:,:,ii) = mean(ssh3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     ssh3ps(:,:,ii) = mean(ssh3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     ssh3ns(:,:,ii) = mean(ssh3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% clear ssh3c ssh3p ssh3n
% 
% fprintf('1/3 SSH \n')
% [lin_ssh3,nonlin_ssh3] = pert_response(ssh3cs(6:187,6:127,:),...
%     ssh3ps(6:187,6:127,:),ssh3ns(6:187,6:127,:),mask3,RAC3);
% 
% clear ssh3*
% 
% load SSH12
% 
% ssh12cs = zeros(756,512,122);
% ssh12ps = zeros(756,512,122);
% ssh12ns = zeros(756,512,122);
% 
% for ii=1:122
%     ssh12cs(:,:,ii) = mean(ssh12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     ssh12ps(:,:,ii) = mean(ssh12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     ssh12ns(:,:,ii) = mean(ssh12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% fprintf('1/12 SSH \n')
% [lin_ssh12,nonlin_ssh12] = pert_response(ssh12cs(16:741,16:497,:),...
%     ssh12ps(16:741,16:497,:),ssh12ns(16:741,16:497,:),mask12,RAC12);
% 
% clear ssh12*
% 
% %% TF
% 
% load TF3
% 
% tf3cs = zeros(192,132,122);
% tf3ps = zeros(192,132,122);
% tf3ns = zeros(192,132,122);
% 
% for ii=1:122
%     tf3cs(:,:,ii) = mean(tf3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     tf3ps(:,:,ii) = mean(tf3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     tf3ns(:,:,ii) = mean(tf3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% clear tf3c tf3p tf3n
% 
% fprintf('1/3 TF \n')
% [lin_tf3,nonlin_tf3] = pert_response(tf3cs(6:187,6:127,:),...
%     tf3ps(6:187,6:127,:),tf3ns(6:187,6:127,:),mask3,RAC3);
% 
% clear tf3*
% 
% load TF12
% 
% tf12cs = zeros(756,512,122);
% tf12ps = zeros(756,512,122);
% tf12ns = zeros(756,512,122);
% 
% for ii=1:122
%     tf12cs(:,:,ii) = mean(tf12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     tf12ps(:,:,ii) = mean(tf12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     tf12ns(:,:,ii) = mean(tf12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% fprintf('1/12 TF \n')
% [lin_tf12,nonlin_tf12] = pert_response(tf12cs(16:741,16:497,:),...
%     tf12ps(16:741,16:497,:),tf12ns(16:741,16:497,:),mask12,RAC12);
% 
% clear tf12*
% 
% %% CF
% 
% load CF3
% 
% cf3cs = zeros(192,132,122);
% cf3ps = zeros(192,132,122);
% cf3ns = zeros(192,132,122);
% 
% for ii=1:122
%     cf3cs(:,:,ii) = mean(cf3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     cf3ps(:,:,ii) = mean(cf3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     cf3ns(:,:,ii) = mean(cf3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% clear cf3c cf3p cf3n
% 
% fprintf('1/3 CF \n')
% [lin_cf3,nonlin_cf3] = pert_response(cf3cs(6:187,6:127,:),...
%     cf3ps(6:187,6:127,:),cf3ns(6:187,6:127,:),mask3,RAC3);
% 
% clear cf3*
% 
% load CF12
% 
% cf12cs = zeros(756,512,122);
% cf12ps = zeros(756,512,122);
% cf12ns = zeros(756,512,122);
% 
% for ii=1:122
%     cf12cs(:,:,ii) = mean(cf12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     cf12ps(:,:,ii) = mean(cf12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     cf12ns(:,:,ii) = mean(cf12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% fprintf('1/12 CF \n')
% [lin_cf12,nonlin_cf12] = pert_response(cf12cs(16:741,16:497,:),...
%     cf12ps(16:741,16:497,:),cf12ns(16:741,16:497,:),mask12,RAC12);
% 
% clear cf12*

%% DIC

load DIC3

dic3cs = zeros(192,132,122);
dic3ps = zeros(192,132,122);
dic3ns = zeros(192,132,122);

for ii=1:122
    dic3cs(:,:,ii) = mean(dic3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic3ps(:,:,ii) = mean(dic3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic3ns(:,:,ii) = mean(dic3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear dic3c dic3p dic3n

fprintf('1/3 DIC \n')
[lin_dic3,nonlin_dic3] = pert_response(dic3cs(6:187,6:127,:),...
    dic3ps(6:187,6:127,:),dic3ns(6:187,6:127,:),mask3,RAC3);

clear dic3*

load DIC12

dic12cs = zeros(756,512,122);
dic12ps = zeros(756,512,122);
dic12ns = zeros(756,512,122);

for ii=1:122
    dic12cs(:,:,ii) = mean(dic12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic12ps(:,:,ii) = mean(dic12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic12ns(:,:,ii) = mean(dic12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

fprintf('1/12 DIC \n')
[lin_dic12,nonlin_dic12] = pert_response(dic12cs(16:741,16:497,:),...
    dic12ps(16:741,16:497,:),dic12ns(16:741,16:497,:),mask12,RAC12);

clear dic12*

% %% MLD
% 
% load MLD3
% 
% mld3cs = zeros(192,132,122);
% mld3ps = zeros(192,132,122);
% mld3ns = zeros(192,132,122);
% 
% for ii=1:122
%     mld3cs(:,:,ii) = mean(mld3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     mld3ps(:,:,ii) = mean(mld3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     mld3ns(:,:,ii) = mean(mld3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% clear mld3c mld3p mld3n
% 
% fprintf('1/3 MLD \n')
% [lin_mld3,nonlin_mld3] = pert_response(mld3cs(6:187,6:127,:),...
%     mld3ps(6:187,6:127,:),mld3ns(6:187,6:127,:),mask3,RAC3);
% 
% clear mld3*
% 
% load MLD12
% 
% mld12cs = zeros(756,512,122);
% mld12ps = zeros(756,512,122);
% mld12ns = zeros(756,512,122);
% 
% for ii=1:122
%     mld12cs(:,:,ii) = mean(mld12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     mld12ps(:,:,ii) = mean(mld12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     mld12ns(:,:,ii) = mean(mld12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% fprintf('1/12 MLD \n')
% [lin_mld12,nonlin_mld12] = pert_response(mld12cs(16:741,16:497,:),...
%     mld12ps(16:741,16:497,:),mld12ns(16:741,16:497,:),mask12,RAC12);
% 
% clear mld12*
% 
% %% DO
% 
% load DO3
% 
% do3cs = zeros(192,132,122);
% do3ps = zeros(192,132,122);
% do3ns = zeros(192,132,122);
% 
% for ii=1:122
%     do3cs(:,:,ii) = mean(do3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     do3ps(:,:,ii) = mean(do3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     do3ns(:,:,ii) = mean(do3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% clear do3c do3p do3n
% 
% fprintf('1/3 DO \n')
% [lin_do3,nonlin_do3] = pert_response(do3cs(6:187,6:127,:),...
%     do3ps(6:187,6:127,:),do3ns(6:187,6:127,:),mask3,RAC3);
% 
% clear do3*
% 
% load DO12
% 
% do12cs = zeros(756,512,122);
% do12ps = zeros(756,512,122);
% do12ns = zeros(756,512,122);
% 
% for ii=1:122
%     do12cs(:,:,ii) = mean(do12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     do12ps(:,:,ii) = mean(do12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     do12ns(:,:,ii) = mean(do12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% fprintf('1/12 DO \n')
% [lin_do12,nonlin_do12] = pert_response(do12cs(16:741,16:497,:),...
%     do12ps(16:741,16:497,:),do12ns(16:741,16:497,:),mask12,RAC12);
% 
% clear do12*
% 
% %% NO
% 
% load NO3
% 
% no3cs = zeros(192,132,122);
% no3ps = zeros(192,132,122);
% no3ns = zeros(192,132,122);
% 
% for ii=1:122
%     no3cs(:,:,ii) = mean(no3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     no3ps(:,:,ii) = mean(no3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     no3ns(:,:,ii) = mean(no3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% clear no3c no3p no3n
% 
% fprintf('1/3 NO \n')
% [lin_no3,nonlin_no3] = pert_response(no3cs(6:187,6:127,:),...
%     no3ps(6:187,6:127,:),no3ns(6:187,6:127,:),mask3,RAC3);
% 
% clear no3*
% 
% load NO12
% 
% no12cs = zeros(756,512,122);
% no12ps = zeros(756,512,122);
% no12ns = zeros(756,512,122);
% 
% for ii=1:122
%     no12cs(:,:,ii) = mean(no12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     no12ps(:,:,ii) = mean(no12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     no12ns(:,:,ii) = mean(no12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% fprintf('1/12 NO \n')
% [lin_no12,nonlin_no12] = pert_response(no12cs(16:741,16:497,:),...
%     no12ps(16:741,16:497,:),no12ns(16:741,16:497,:),mask12,RAC12);
% 
% clear no12*
% 
% %% SSS
% 
% load SSS3
% 
% sss3cs = zeros(192,132,122);
% sss3ps = zeros(192,132,122);
% sss3ns = zeros(192,132,122);
% 
% for ii=1:122
%     sss3cs(:,:,ii) = mean(sss3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     sss3ps(:,:,ii) = mean(sss3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     sss3ns(:,:,ii) = mean(sss3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% clear sss3c sss3p sss3n
% 
% fprintf('1/3 SSS \n')
% [lin_sss3,sssnlin_sss3] = pert_response(sss3cs(6:187,6:127,:),...
%     sss3ps(6:187,6:127,:),sss3ns(6:187,6:127,:),mask3,RAC3);
% 
% clear sss3*
% 
% load SSS12
% 
% sss12cs = zeros(756,512,122);
% sss12ps = zeros(756,512,122);
% sss12ns = zeros(756,512,122);
% 
% for ii=1:122
%     sss12cs(:,:,ii) = mean(sss12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     sss12ps(:,:,ii) = mean(sss12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     sss12ns(:,:,ii) = mean(sss12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% fprintf('1/12 SSS \n')
% [lin_sss12,sssnlin_sss12] = pert_response(sss12cs(16:741,16:497,:),...
%     sss12ps(16:741,16:497,:),sss12ns(16:741,16:497,:),mask12,RAC12);
% 
% clear sss12*

%% Date and Save

x = datenum('01012017','mmddyyyy');
y = datenum('05032017','mmddyyyy');

six_hours = x:0.25:y;
six_hours = six_hours(1:(end-1));

save PERT_RESPONSE_smooth lin* nonlin* six_hours

toc()

clear
close all
clc
tic()

RAC12 = rdmds('RAC12');
hFacC12 = rdmds('hFacC12');

mask12 = hFacC12(16:741,16:497,1);
RAC12 = RAC12(16:741,16:497);
clear hFacC12

RAC3 = rdmds('RAC3');
hFacC3 = rdmds('hFacC3');

mask3 = hFacC3(6:187,6:127,1);
RAC3 = RAC3(6:187,6:127);
clear hFacC3

%% SST

load sSST3

sst3cs = zeros(192,132,122);
sst3ps = zeros(192,132,122);
sst3ns = zeros(192,132,122);

for ii=1:122
    sst3cs(:,:,ii) = mean(sst3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst3ps(:,:,ii) = mean(sst3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst3ns(:,:,ii) = mean(sst3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear sst3c sst3p sst3n

fprintf('1/3 SST \n')
[lin_sst3,nonlin_sst3] = pert_response(sst3cs(6:187,6:127,:),...
    sst3ps(6:187,6:127,:),sst3ns(6:187,6:127,:),mask3,RAC3);

clear sst3*

load sSST12

sst12cs = zeros(756,512,122);
sst12ps = zeros(756,512,122);
sst12ns = zeros(756,512,122);

for ii=1:122
    sst12cs(:,:,ii) = mean(sst12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst12ps(:,:,ii) = mean(sst12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    sst12ns(:,:,ii) = mean(sst12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

fprintf('1/12 SST \n')
[lin_sst12,nonlin_sst12] = pert_response(sst12cs(16:741,16:497,:),...
    sst12ps(16:741,16:497,:),sst12ns(16:741,16:497,:),mask12,RAC12);

clear sst12*

% %% SSH
% 
% load sSSH3
% 
% ssh3cs = zeros(192,132,122);
% ssh3ps = zeros(192,132,122);
% ssh3ns = zeros(192,132,122);
% 
% for ii=1:122
%     ssh3cs(:,:,ii) = mean(ssh3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     ssh3ps(:,:,ii) = mean(ssh3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     ssh3ns(:,:,ii) = mean(ssh3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% clear ssh3c ssh3p ssh3n
% 
% fprintf('1/3 SSH \n')
% [lin_ssh3,nonlin_ssh3] = pert_response(ssh3cs(6:187,6:127,:),...
%     ssh3ps(6:187,6:127,:),ssh3ns(6:187,6:127,:),mask3,RAC3);
% 
% clear ssh3*
% 
% load sSSH12
% 
% ssh12cs = zeros(756,512,122);
% ssh12ps = zeros(756,512,122);
% ssh12ns = zeros(756,512,122);
% 
% for ii=1:122
%     ssh12cs(:,:,ii) = mean(ssh12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     ssh12ps(:,:,ii) = mean(ssh12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     ssh12ns(:,:,ii) = mean(ssh12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% fprintf('1/12 SSH \n')
% [lin_ssh12,nonlin_ssh12] = pert_response(ssh12cs(16:741,16:497,:),...
%     ssh12ps(16:741,16:497,:),ssh12ns(16:741,16:497,:),mask12,RAC12);
% 
% clear ssh12*
% 
% %% TF
% 
% load sTF3
% 
% tf3cs = zeros(192,132,122);
% tf3ps = zeros(192,132,122);
% tf3ns = zeros(192,132,122);
% 
% for ii=1:122
%     tf3cs(:,:,ii) = mean(tf3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     tf3ps(:,:,ii) = mean(tf3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     tf3ns(:,:,ii) = mean(tf3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% clear tf3c tf3p tf3n
% 
% fprintf('1/3 TF \n')
% [lin_tf3,nonlin_tf3] = pert_response(tf3cs(6:187,6:127,:),...
%     tf3ps(6:187,6:127,:),tf3ns(6:187,6:127,:),mask3,RAC3);
% 
% clear tf3*
% 
% load sTF12
% 
% tf12cs = zeros(756,512,122);
% tf12ps = zeros(756,512,122);
% tf12ns = zeros(756,512,122);
% 
% for ii=1:122
%     tf12cs(:,:,ii) = mean(tf12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     tf12ps(:,:,ii) = mean(tf12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     tf12ns(:,:,ii) = mean(tf12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% fprintf('1/12 TF \n')
% [lin_tf12,nonlin_tf12] = pert_response(tf12cs(16:741,16:497,:),...
%     tf12ps(16:741,16:497,:),tf12ns(16:741,16:497,:),mask12,RAC12);
% 
% clear tf12*
% 
% %% CF
% 
% load sCF3
% 
% cf3cs = zeros(192,132,122);
% cf3ps = zeros(192,132,122);
% cf3ns = zeros(192,132,122);
% 
% for ii=1:122
%     cf3cs(:,:,ii) = mean(cf3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     cf3ps(:,:,ii) = mean(cf3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     cf3ns(:,:,ii) = mean(cf3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% clear cf3c cf3p cf3n
% 
% fprintf('1/3 CF \n')
% [lin_cf3,nonlin_cf3] = pert_response(cf3cs(6:187,6:127,:),...
%     cf3ps(6:187,6:127,:),cf3ns(6:187,6:127,:),mask3,RAC3);
% 
% clear cf3*
% 
% load sCF12
% 
% cf12cs = zeros(756,512,122);
% cf12ps = zeros(756,512,122);
% cf12ns = zeros(756,512,122);
% 
% for ii=1:122
%     cf12cs(:,:,ii) = mean(cf12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     cf12ps(:,:,ii) = mean(cf12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     cf12ns(:,:,ii) = mean(cf12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% fprintf('1/12 CF \n')
% [lin_cf12,nonlin_cf12] = pert_response(cf12cs(16:741,16:497,:),...
%     cf12ps(16:741,16:497,:),cf12ns(16:741,16:497,:),mask12,RAC12);
% 
% clear cf12*

%% DIC

load sDIC3

dic3cs = zeros(192,132,122);
dic3ps = zeros(192,132,122);
dic3ns = zeros(192,132,122);

for ii=1:122
    dic3cs(:,:,ii) = mean(dic3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic3ps(:,:,ii) = mean(dic3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic3ns(:,:,ii) = mean(dic3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

clear dic3c dic3p dic3n

fprintf('1/3 DIC \n')
[lin_dic3,nonlin_dic3] = pert_response(dic3cs(6:187,6:127,:),...
    dic3ps(6:187,6:127,:),dic3ns(6:187,6:127,:),mask3,RAC3);

clear dic3*

load sDIC12

dic12cs = zeros(756,512,122);
dic12ps = zeros(756,512,122);
dic12ns = zeros(756,512,122);

for ii=1:122
    dic12cs(:,:,ii) = mean(dic12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic12ps(:,:,ii) = mean(dic12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
    dic12ns(:,:,ii) = mean(dic12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
end

fprintf('1/12 DIC \n')
[lin_dic12,nonlin_dic12] = pert_response(dic12cs(16:741,16:497,:),...
    dic12ps(16:741,16:497,:),dic12ns(16:741,16:497,:),mask12,RAC12);

clear dic12*

% %% MLD
% 
% load sMLD3
% 
% mld3cs = zeros(192,132,122);
% mld3ps = zeros(192,132,122);
% mld3ns = zeros(192,132,122);
% 
% for ii=1:122
%     mld3cs(:,:,ii) = mean(mld3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     mld3ps(:,:,ii) = mean(mld3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     mld3ns(:,:,ii) = mean(mld3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% clear mld3c mld3p mld3n
% 
% fprintf('1/3 MLD \n')
% [lin_mld3,nonlin_mld3] = pert_response(mld3cs(6:187,6:127,:),...
%     mld3ps(6:187,6:127,:),mld3ns(6:187,6:127,:),mask3,RAC3);
% 
% clear mld3*
% 
% load sMLD12
% 
% mld12cs = zeros(756,512,122);
% mld12ps = zeros(756,512,122);
% mld12ns = zeros(756,512,122);
% 
% for ii=1:122
%     mld12cs(:,:,ii) = mean(mld12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     mld12ps(:,:,ii) = mean(mld12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     mld12ns(:,:,ii) = mean(mld12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% fprintf('1/12 MLD \n')
% [lin_mld12,nonlin_mld12] = pert_response(mld12cs(16:741,16:497,:),...
%     mld12ps(16:741,16:497,:),mld12ns(16:741,16:497,:),mask12,RAC12);
% 
% clear mld12*
% 
% %% DO
% 
% load sDO3
% 
% do3cs = zeros(192,132,122);
% do3ps = zeros(192,132,122);
% do3ns = zeros(192,132,122);
% 
% for ii=1:122
%     do3cs(:,:,ii) = mean(do3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     do3ps(:,:,ii) = mean(do3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     do3ns(:,:,ii) = mean(do3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% clear do3c do3p do3n
% 
% fprintf('1/3 DO \n')
% [lin_do3,nonlin_do3] = pert_response(do3cs(6:187,6:127,:),...
%     do3ps(6:187,6:127,:),do3ns(6:187,6:127,:),mask3,RAC3);
% 
% clear do3*
% 
% load sDO12
% 
% do12cs = zeros(756,512,122);
% do12ps = zeros(756,512,122);
% do12ns = zeros(756,512,122);
% 
% for ii=1:122
%     do12cs(:,:,ii) = mean(do12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     do12ps(:,:,ii) = mean(do12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     do12ns(:,:,ii) = mean(do12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% fprintf('1/12 DO \n')
% [lin_do12,nonlin_do12] = pert_response(do12cs(16:741,16:497,:),...
%     do12ps(16:741,16:497,:),do12ns(16:741,16:497,:),mask12,RAC12);
% 
% clear do12*
% 
% %% NO
% 
% load sNO3
% 
% no3cs = zeros(192,132,122);
% no3ps = zeros(192,132,122);
% no3ns = zeros(192,132,122);
% 
% for ii=1:122
%     no3cs(:,:,ii) = mean(no3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     no3ps(:,:,ii) = mean(no3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     no3ns(:,:,ii) = mean(no3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% clear no3c no3p no3n
% 
% fprintf('1/3 NO \n')
% [lin_no3,nonlin_no3] = pert_response(no3cs(6:187,6:127,:),...
%     no3ps(6:187,6:127,:),no3ns(6:187,6:127,:),mask3,RAC3);
% 
% clear no3*
% 
% load sNO12
% 
% no12cs = zeros(756,512,122);
% no12ps = zeros(756,512,122);
% no12ns = zeros(756,512,122);
% 
% for ii=1:122
%     no12cs(:,:,ii) = mean(no12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     no12ps(:,:,ii) = mean(no12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     no12ns(:,:,ii) = mean(no12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% fprintf('1/12 NO \n')
% [lin_no12,nonlin_no12] = pert_response(no12cs(16:741,16:497,:),...
%     no12ps(16:741,16:497,:),no12ns(16:741,16:497,:),mask12,RAC12);
% 
% clear no12*
% 
% %% SSS
% 
% load sSSS3
% 
% sss3cs = zeros(192,132,122);
% sss3ps = zeros(192,132,122);
% sss3ns = zeros(192,132,122);
% 
% for ii=1:122
%     sss3cs(:,:,ii) = mean(sss3c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     sss3ps(:,:,ii) = mean(sss3p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     sss3ns(:,:,ii) = mean(sss3n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% clear sss3c sss3p sss3n
% 
% fprintf('1/3 SSS \n')
% [lin_sss3,nonlin_sss3] = pert_response(sss3cs(6:187,6:127,:),...
%     sss3ps(6:187,6:127,:),sss3ns(6:187,6:127,:),mask3,RAC3);
% 
% clear sss3*
% 
% load sSSS12
% 
% sss12cs = zeros(756,512,122);
% sss12ps = zeros(756,512,122);
% sss12ns = zeros(756,512,122);
% 
% for ii=1:122
%     sss12cs(:,:,ii) = mean(sss12c(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     sss12ps(:,:,ii) = mean(sss12p(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
%     sss12ns(:,:,ii) = mean(sss12n(:,:,(4*(ii-1)+1):(4*(ii-1)+4)),3);
% end
% 
% fprintf('1/12 SSS \n')
% [lin_sss12,nonlin_sss12] = pert_response(sss12cs(16:741,16:497,:),...
%     sss12ps(16:741,16:497,:),sss12ns(16:741,16:497,:),mask12,RAC12);
% 
% clear sss12*

%% Date and Save

x = datenum('01012017','mmddyyyy');
y = datenum('05032017','mmddyyyy');

six_hours = x:0.25:y;
six_hours = six_hours(1:(end-1));

save sPERT_RESPONSE_smooth lin* nonlin* six_hours

toc()

