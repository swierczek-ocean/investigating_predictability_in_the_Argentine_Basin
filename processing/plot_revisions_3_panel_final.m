clear
close all
clc
tic()

% load sPERT_RESPONSE_smooth_100m *sst* *dic*
% 
% slin_dic12 = lin_dic12;
% slin_dic3 = lin_dic3;
% snonlin_dic12 = nonlin_dic12;
% snonlin_dic3 = nonlin_dic3;
% 
% slin_sst12 = lin_sst12;
% slin_sst3 = lin_sst3;
% snonlin_sst12 = nonlin_sst12;
% snonlin_sst3 = nonlin_sst3;
% 
% load PERT_RESPONSE_smooth_100m *sst* *dic* six_hours
% 
% 
% load sst100diff312d
% load dic100diff312d
% load persist/sst100pers
% load persist/dic100pers
% 
% sstlgskill = 1 - (sstdiff312.^2)./(sst12rms.^2);
% diclgskill = 1 - (dicdiff312.^2)./(dic12rms.^2);
% 
% %% 
% 
% acc_colors
% 
% lw = 3.6;
% c1 = 95; c5 = 50;
% c2 = 94;
% c3 = 93;
% c4 = 92;
% at = 1;
% 
% 
% dates2 = [datenum('20170101','yyyymmdd'),datenum('20170116','yyyymmdd'),...
%     datenum('20170131','yyyymmdd'),datenum('20170215','yyyymmdd'),...
%     datenum('20170302','yyyymmdd'),datenum('20170317','yyyymmdd'),...
%     datenum('20170401','yyyymmdd'),datenum('20170416','yyyymmdd'),...
%     datenum('20170501','yyyymmdd')];
% dates2 = dates2 - dates2(1);
% 
% days = 1:122;
% 
% figure();
% set(gcf, 'Position', [1, 1, 1700, 1800])
% subplot(3,1,1)
% h1 = semilogy(days,lin_sst3,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = semilogy(days,lin_sst12,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,nonlin_sst3,'--','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,nonlin_sst12,'--','LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,nonlin_sst3,':','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,nonlin_sst12,':','LineWidth',lw,'Color',at.*Color(c4,:));
% h5 = semilogy(days,slin_sst3,'LineWidth',lw,'Color',at.*Color(c2,:));
% h6 = semilogy(days,slin_sst12,'LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,snonlin_sst3,'--','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,snonlin_sst12,'--','LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,snonlin_sst3,':','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,snonlin_sst12,':','LineWidth',lw,'Color',at.*Color(c3,:));
% h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
% h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks(dates2)
% xlim([0 110])
% % ylim([5e-11 6e-7])
% ylabel('degrees C')
% acc_movie_wh
% acc_3_stack(1)
% title('summer upper 100m temperature response to wind perturbation','FontWeight','Normal','FontSize',23)
% legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
%     'large area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'small area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% subplot(3,1,2)
% h1 = semilogy(days,1000000.*lin_dic3./1035,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = semilogy(days,1000000.*lin_dic12./1035,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,1000000.*nonlin_dic3./1035,'--','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,1000000.*nonlin_dic12./1035,'--','LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,1000000.*nonlin_dic3./1035,':','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,1000000.*nonlin_dic12./1035,':','LineWidth',lw,'Color',at.*Color(c4,:));
% h5 = semilogy(days,1000000.*slin_dic3./1035,'LineWidth',lw,'Color',at.*Color(c2,:));
% h6 = semilogy(days,1000000.*slin_dic12./1035,'LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,1000000.*snonlin_dic3./1035,'--','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,1000000.*snonlin_dic12./1035,'--','LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,1000000.*snonlin_dic3./1035,':','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,1000000.*snonlin_dic12./1035,':','LineWidth',lw,'Color',at.*Color(c3,:));
% h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
% h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks(dates2)
% xlabel('days')
% xlim([0 110])
% % ylim([0 0.006/1035])
% ylabel('\mumol/kg')
% acc_movie_wh
% acc_3_stack(2)
% title('summer upper 100m DIC response to wind perturbation','FontWeight','Normal','FontSize',23)
% legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
%     'large area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'small area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% subplot(3,1,3)
% h1 = plot(days,sstlgskill,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = plot(days,diclgskill,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = plot(days,sstpers,'LineWidth',lw,'Color',at.*Color(c5,:));
% h4 = plot(days,dicpers,'--','LineWidth',lw,'Color',at.*Color(c5,:));
% h5 = plot(days,dicpers,':','LineWidth',lw,'Color',at.*Color(c5,:));
% yline(0,'LineWidth',lw-1,'Color','k');
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks([0:5:30])
% yticks([-0.5:0.25:1])
% xlim([0 34])
% ylim([-0.25 1])
% acc_movie_wh
% xlabel('days')
% ylabel('skill')
% acc_3_stack(3,5)
% title('proportion of upper 100m variance explained','FontWeight','Normal','FontSize',23)
% legend([h1(1),h2(1),h3(1),h4(1)],...
%     '1/3\circ T','1/3\circ DIC','1/12\circ T persistence','1/12\circ DIC persistence',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% set(gcf,'InvertHardCopy','off'); 
% print('-r300','plots6/summer100m_TDIC','-dpng')
% 
% 
% close all
% 
% clear 
% 
% 
% load wsPERT_RESPONSE_smooth_100m *sst* *dic*
% 
% slin_dic12 = lin_dic12;
% slin_dic3 = lin_dic3;
% snonlin_dic12 = nonlin_dic12;
% snonlin_dic3 = nonlin_dic3;
% 
% slin_sst12 = lin_sst12;
% slin_sst3 = lin_sst3;
% snonlin_sst12 = nonlin_sst12;
% snonlin_sst3 = nonlin_sst3;
% 
% load wPERT_RESPONSE_smooth_100m *sst* *dic* six_hours
% 
% load persist/w100sstpers
% load persist/w100dicpers
% load w100sstdiff312d
% load w100dicdiff312d
% 
% sstlgskill = 1 - (sstdiff312.^2)./(sst12rms.^2);
% diclgskill = 1 - (dicdiff312.^2)./(dic12rms.^2);
% 
% %% 
% 
% acc_colors
% lw = 3.6;
% c1 = 95; c5 = 50;
% c2 = 94;
% c3 = 93;
% c4 = 92;
% at = 1;
% 
% dates2 = [datenum('20170101','yyyymmdd'),datenum('20170116','yyyymmdd'),...
%     datenum('20170131','yyyymmdd'),datenum('20170215','yyyymmdd'),...
%     datenum('20170302','yyyymmdd'),datenum('20170317','yyyymmdd'),...
%     datenum('20170401','yyyymmdd'),datenum('20170416','yyyymmdd'),...
%     datenum('20170501','yyyymmdd')];
% dates2 = dates2 - dates2(1);
% 
% days = 1:122;
% 
% figure();
% set(gcf, 'Position', [1, 1, 1700, 1800])
% subplot(3,1,1)
% h1 = semilogy(days,lin_sst3,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = semilogy(days,lin_sst12,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,nonlin_sst3,'--','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,nonlin_sst12,'--','LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,nonlin_sst3,':','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,nonlin_sst12,':','LineWidth',lw,'Color',at.*Color(c4,:));
% h5 = semilogy(days,slin_sst3,'LineWidth',lw,'Color',at.*Color(c2,:));
% h6 = semilogy(days,slin_sst12,'LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,snonlin_sst3,'--','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,snonlin_sst12,'--','LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,snonlin_sst3,':','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,snonlin_sst12,':','LineWidth',lw,'Color',at.*Color(c3,:));
% h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
% h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks(dates2)
% xlim([0 110])
% % ylim([5e-11 6e-7])
% ylabel('degrees C')
% acc_movie_wh
% acc_3_stack(1)
% title('winter upper 100m temperature response to wind perturbation','FontWeight','Normal','FontSize',23)
% legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
%     'large area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'small area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% subplot(3,1,2)
% h1 = semilogy(days,1000000.*lin_dic3./1035,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = semilogy(days,1000000.*lin_dic12./1035,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,1000000.*nonlin_dic3./1035,'--','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,1000000.*nonlin_dic12./1035,'--','LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,1000000.*nonlin_dic3./1035,':','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,1000000.*nonlin_dic12./1035,':','LineWidth',lw,'Color',at.*Color(c4,:));
% h5 = semilogy(days,1000000.*slin_dic3./1035,'LineWidth',lw,'Color',at.*Color(c2,:));
% h6 = semilogy(days,1000000.*slin_dic12./1035,'LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,1000000.*snonlin_dic3./1035,'--','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,1000000.*snonlin_dic12./1035,'--','LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,1000000.*snonlin_dic3./1035,':','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,1000000.*snonlin_dic12./1035,':','LineWidth',lw,'Color',at.*Color(c3,:));
% h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
% h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks(dates2)
% xlabel('days')
% xlim([0 110])
% % ylim([0 0.006/1035])
% ylabel('\mumol/kg')
% acc_movie_wh
% acc_3_stack(2)
% title('winter upper 100m DIC response to wind perturbation','FontWeight','Normal','FontSize',23)
% legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
%     'large area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'small area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% subplot(3,1,3)
% h1 = plot(days,sstlgskill,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = plot(days,diclgskill,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = plot(days,sstpers,'LineWidth',lw,'Color',at.*Color(c5,:));
% h4 = plot(days,dicpers,'--','LineWidth',lw,'Color',at.*Color(c5,:));
% h5 = plot(days,dicpers,':','LineWidth',lw,'Color',at.*Color(c5,:));
% yline(0,'LineWidth',lw-1,'Color','k');
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks([0:5:30])
% yticks([-0.5:0.25:1])
% xlim([0 34])
% ylim([-0.25 1])
% acc_movie_wh
% xlabel('days')
% ylabel('skill')
% acc_3_stack(3,5)
% title('proportion of upper 100m variance explained','FontWeight','Normal','FontSize',23)
% legend([h1(1),h2(1),h3(1),h4(1)],...
%     '1/3\circ T','1/3\circ DIC','1/12\circ T persistence','1/12\circ DIC persistence',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% set(gcf,'InvertHardCopy','off'); 
% print('-r300','plots6/winter100m_TDIC','-dpng')
% 
% 
% close all

clear


load wsPERT_RESPONSE_smooth *sst* *dic*

slin_dic12 = lin_dic12;
slin_dic3 = lin_dic3;
snonlin_dic12 = nonlin_dic12;
snonlin_dic3 = nonlin_dic3;

slin_sst12 = lin_sst12;
slin_sst3 = lin_sst3;
snonlin_sst12 = nonlin_sst12;
snonlin_sst3 = nonlin_sst3;

load wPERT_RESPONSE_smooth *sst* *dic* six_hours

load persist/wsstpers
load persist/wdicpers
load wsstdiff312d
load wdicdiff312d

sstlgskill = 1 - (sstdiff312.^2)./(sst12rms.^2);
diclgskill = 1 - (dicdiff312.^2)./(dic12rms.^2);

%% 

acc_colors
lw = 3.6;
c1 = 95; c5 = 50;
c2 = 94;
c3 = 93;
c4 = 92;
at = 1;

dates2 = [datenum('20170101','yyyymmdd'),datenum('20170116','yyyymmdd'),...
    datenum('20170131','yyyymmdd'),datenum('20170215','yyyymmdd'),...
    datenum('20170302','yyyymmdd'),datenum('20170317','yyyymmdd'),...
    datenum('20170401','yyyymmdd'),datenum('20170416','yyyymmdd'),...
    datenum('20170501','yyyymmdd')];
dates2 = dates2 - dates2(1);

days = 1:122;

figure();
set(gcf, 'Position', [1, 1, 1700, 1800])
subplot(3,1,1)
h1 = semilogy(days,lin_sst3,'LineWidth',lw,'Color',at.*Color(c1,:));
hold on
h2 = semilogy(days,lin_sst12,'LineWidth',lw,'Color',at.*Color(c4,:));
h3 = semilogy(days,nonlin_sst3,'--','LineWidth',lw,'Color',at.*Color(c1,:));
h4 = semilogy(days,nonlin_sst12,'--','LineWidth',lw,'Color',at.*Color(c4,:));
h3 = semilogy(days,nonlin_sst3,':','LineWidth',lw,'Color',at.*Color(c1,:));
h4 = semilogy(days,nonlin_sst12,':','LineWidth',lw,'Color',at.*Color(c4,:));
h5 = semilogy(days,slin_sst3,'LineWidth',lw,'Color',at.*Color(c2,:));
h6 = semilogy(days,slin_sst12,'LineWidth',lw,'Color',at.*Color(c3,:));
h7 = semilogy(days,snonlin_sst3,'--','LineWidth',lw,'Color',at.*Color(c2,:));
h8 = semilogy(days,snonlin_sst12,'--','LineWidth',lw,'Color',at.*Color(c3,:));
h7 = semilogy(days,snonlin_sst3,':','LineWidth',lw,'Color',at.*Color(c2,:));
h8 = semilogy(days,snonlin_sst12,':','LineWidth',lw,'Color',at.*Color(c3,:));
h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
xlim([0 110])
ylim([5e-11 6e-7])
ylabel('degrees C')
acc_movie_wh
acc_3_stack(1)
title('winter SST response to wind perturbation','FontWeight','Normal','FontSize',23)
legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
    'large area','perturbation',...
    '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
    'small area','perturbation',...
    '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
    'Location','eastoutside','FontSize',23)
hold off

subplot(3,1,2)
h1 = semilogy(days,1000000.*lin_dic3./1035,'LineWidth',lw,'Color',at.*Color(c1,:));
hold on
h2 = semilogy(days,1000000.*lin_dic12./1035,'LineWidth',lw,'Color',at.*Color(c4,:));
h3 = semilogy(days,1000000.*nonlin_dic3./1035,'--','LineWidth',lw,'Color',at.*Color(c1,:));
h4 = semilogy(days,1000000.*nonlin_dic12./1035,'--','LineWidth',lw,'Color',at.*Color(c4,:));
h3 = semilogy(days,1000000.*nonlin_dic3./1035,':','LineWidth',lw,'Color',at.*Color(c1,:));
h4 = semilogy(days,1000000.*nonlin_dic12./1035,':','LineWidth',lw,'Color',at.*Color(c4,:));
h5 = semilogy(days,1000000.*slin_dic3./1035,'LineWidth',lw,'Color',at.*Color(c2,:));
h6 = semilogy(days,1000000.*slin_dic12./1035,'LineWidth',lw,'Color',at.*Color(c3,:));
h7 = semilogy(days,1000000.*snonlin_dic3./1035,'--','LineWidth',lw,'Color',at.*Color(c2,:));
h8 = semilogy(days,1000000.*snonlin_dic12./1035,'--','LineWidth',lw,'Color',at.*Color(c3,:));
h7 = semilogy(days,1000000.*snonlin_dic3./1035,':','LineWidth',lw,'Color',at.*Color(c2,:));
h8 = semilogy(days,1000000.*snonlin_dic12./1035,':','LineWidth',lw,'Color',at.*Color(c3,:));
h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
xlabel('days')
xlim([0 110])
ylim([0 0.006/1035])
ylabel('\mumol/kg')
acc_movie_wh
acc_3_stack(2)
title('winter surface DIC response to wind perturbation','FontWeight','Normal','FontSize',23)
legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
    'large area','perturbation',...
    '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
    'small area','perturbation',...
    '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
    'Location','eastoutside','FontSize',23)
hold off

subplot(3,1,3)
h1 = plot(days,sstlgskill,'LineWidth',lw,'Color',at.*Color(c1,:));
hold on
h2 = plot(days,diclgskill,'LineWidth',lw,'Color',at.*Color(c4,:));
h3 = plot(days,sstpers,'LineWidth',lw,'Color',at.*Color(c5,:));
h4 = plot(days,dicpers,'--','LineWidth',lw,'Color',at.*Color(c5,:));
h5 = plot(days,dicpers,':','LineWidth',lw,'Color',at.*Color(c5,:));
yline(0,'LineWidth',lw-1,'Color','k');
grid on
ax = gca;
ax.GridAlpha = 1;
xticks([0:5:30])
yticks([-0.5:0.25:1])
xlim([0 34])
ylim([-0.25 1])
acc_movie_wh
xlabel('days')
ylabel('skill')
acc_3_stack(3,5)
title('proportion of variance explained','FontWeight','Normal','FontSize',23)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3\circ T','1/3\circ DIC','1/12\circ T persistence','1/12\circ DIC persistence',...
    'Location','eastoutside','FontSize',23)
hold off

set(gcf,'InvertHardCopy','off'); 
print('-r300','plots6/winter_surf_TDIC','-dpng')


% close all
% 
% load ../2020_11_November_analysis/sPERT_RESPONSE_smooth *sst* *dic*
% 
% slin_dic12 = lin_dic12;
% slin_dic3 = lin_dic3;
% snonlin_dic12 = nonlin_dic12;
% snonlin_dic3 = nonlin_dic3;
% 
% slin_sst12 = lin_sst12;
% slin_sst3 = lin_sst3;
% snonlin_sst12 = nonlin_sst12;
% snonlin_sst3 = nonlin_sst3;
% 
% load ../2020_11_November_analysis/PERT_RESPONSE_smooth *sst* *dic* six_hours
% 
% load persist/sstpers
% load persist/dicpers
% load ../2020_11_November_analysis/sstdiff312d
% load ../2020_11_November_analysis/dicdiff312d
% 
% sstlgskill = 1 - (sstdiff312.^2)./(sst12rms.^2);
% diclgskill = 1 - (dicdiff312.^2)./(dic12rms.^2);
% 
% %% 
% 
% acc_colors
% lw = 3.6;
% c1 = 95; c5 = 50;
% c2 = 94;
% c3 = 93;
% c4 = 92;
% at = 1;
% 
% dates2 = [datenum('20170101','yyyymmdd'),datenum('20170116','yyyymmdd'),...
%     datenum('20170131','yyyymmdd'),datenum('20170215','yyyymmdd'),...
%     datenum('20170302','yyyymmdd'),datenum('20170317','yyyymmdd'),...
%     datenum('20170401','yyyymmdd'),datenum('20170416','yyyymmdd'),...
%     datenum('20170501','yyyymmdd')];
% dates2 = dates2 - dates2(1);
% 
% days = 1:122;
% 
% figure();
% set(gcf, 'Position', [1, 1, 1700, 1800])
% subplot(3,1,1)
% h1 = semilogy(days,lin_sst3,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = semilogy(days,lin_sst12,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,nonlin_sst3,'--','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,nonlin_sst12,'--','LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,nonlin_sst3,':','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,nonlin_sst12,':','LineWidth',lw,'Color',at.*Color(c4,:));
% h5 = semilogy(days,slin_sst3,'LineWidth',lw,'Color',at.*Color(c2,:));
% h6 = semilogy(days,slin_sst12,'LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,snonlin_sst3,'--','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,snonlin_sst12,'--','LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,snonlin_sst3,':','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,snonlin_sst12,':','LineWidth',lw,'Color',at.*Color(c3,:));
% h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
% h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks(dates2)
% xlim([0 110])
% ylim([5e-11 6e-7])
% ylabel('degrees C')
% acc_movie_wh
% acc_3_stack(1)
% title('summer SST response to wind perturbation','FontWeight','Normal','FontSize',23)
% legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
%     'large area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'small area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% subplot(3,1,2)
% h1 = semilogy(days,1000000.*lin_dic3./1035,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = semilogy(days,1000000.*lin_dic12./1035,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,1000000.*nonlin_dic3./1035,'--','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,1000000.*nonlin_dic12./1035,'--','LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,1000000.*nonlin_dic3./1035,':','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,1000000.*nonlin_dic12./1035,':','LineWidth',lw,'Color',at.*Color(c4,:));
% h5 = semilogy(days,1000000.*slin_dic3./1035,'LineWidth',lw,'Color',at.*Color(c2,:));
% h6 = semilogy(days,1000000.*slin_dic12./1035,'LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,1000000.*snonlin_dic3./1035,'--','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,1000000.*snonlin_dic12./1035,'--','LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,1000000.*snonlin_dic3./1035,':','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,1000000.*snonlin_dic12./1035,':','LineWidth',lw,'Color',at.*Color(c3,:));
% h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
% h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks(dates2)
% xlabel('days')
% xlim([0 110])
% ylim([0 0.006/1035])
% ylabel('\mumol/kg')
% acc_movie_wh
% acc_3_stack(2)
% title('summer surface DIC response to wind perturbation','FontWeight','Normal','FontSize',23)
% legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
%     'large area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'small area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% subplot(3,1,3)
% h1 = plot(days,sstlgskill,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = plot(days,diclgskill,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = plot(days,sstpers,'LineWidth',lw,'Color',at.*Color(c5,:));
% h4 = plot(days,dicpers,'--','LineWidth',lw,'Color',at.*Color(c5,:));
% h5 = plot(days,dicpers,':','LineWidth',lw,'Color',at.*Color(c5,:));
% yline(0,'LineWidth',lw-1,'Color','k');
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks([0:5:30])
% yticks([-0.5:0.25:1])
% xlim([0 34])
% ylim([-0.25 1])
% acc_movie_wh
% xlabel('days')
% ylabel('skill')
% acc_3_stack(3,5)
% title('proportion of variance explained','FontWeight','Normal','FontSize',23)
% legend([h1(1),h2(1),h3(1),h4(1)],...
%     '1/3\circ T','1/3\circ DIC','1/12\circ T persistence','1/12\circ DIC persistence',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% set(gcf,'InvertHardCopy','off'); 
% print('-r300','plots6/summer_surf_TDIC','-dpng')
% 
% 
% close all
% 
% clear
% 
% toc()
% 
% clear
% close all
% clc
% tic()
% 
% load sPERT_RESPONSE_smooth_100m *do* *chl*
% 
% slin_chl12 = lin_chl12;
% slin_chl3 = lin_chl3;
% snonlin_chl12 = nonlin_chl12;
% snonlin_chl3 = nonlin_chl3;
% 
% slin_do12 = lin_do12;
% slin_do3 = lin_do3;
% snonlin_do12 = nonlin_do12;
% snonlin_do3 = nonlin_do3;
% 
% load PERT_RESPONSE_smooth_100m *do* *chl* six_hours
% 
% load persist/do100pers
% load persist/chl100pers
% load extras/do100diff312d
% load extras/chl100diff312d
% 
% dolgskill = 1 - (dodiff312.^2)./(do12rms.^2);
% chllgskill = 1 - (chldiff312.^2)./(chl12rms.^2);
% 
% %% 
% 
% acc_colors
% lw = 3.6;
% c1 = 95; c5 = 50;
% c2 = 94;
% c3 = 93;
% c4 = 92;
% at = 1;
% 
% dates2 = [datenum('20170101','yyyymmdd'),datenum('20170116','yyyymmdd'),...
%     datenum('20170131','yyyymmdd'),datenum('20170215','yyyymmdd'),...
%     datenum('20170302','yyyymmdd'),datenum('20170317','yyyymmdd'),...
%     datenum('20170401','yyyymmdd'),datenum('20170416','yyyymmdd'),...
%     datenum('20170501','yyyymmdd')];
% dates2 = dates2 - dates2(1);
% 
% days = 1:122;
% 
% figure();
% set(gcf, 'Position', [1, 1, 1700, 1800])
% subplot(3,1,1)
% h1 = semilogy(days,1000000.*lin_do3./1035,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = semilogy(days,1000000.*lin_do12./1035,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,1000000.*nonlin_do3./1035,'--','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,1000000.*nonlin_do12./1035,'--','LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,1000000.*nonlin_do3./1035,':','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,1000000.*nonlin_do12./1035,':','LineWidth',lw,'Color',at.*Color(c4,:));
% h5 = semilogy(days,1000000.*slin_do3./1035,'LineWidth',lw,'Color',at.*Color(c2,:));
% h6 = semilogy(days,1000000.*slin_do12./1035,'LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,1000000.*snonlin_do3./1035,'--','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,1000000.*snonlin_do12./1035,'--','LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,1000000.*snonlin_do3./1035,':','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,1000000.*snonlin_do12./1035,':','LineWidth',lw,'Color',at.*Color(c3,:));
% h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
% h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks(dates2)
% xlim([0 110])
% % ylim([5e-11 6e-7])
% ylabel('\mumol/kg')
% acc_movie_wh
% acc_3_stack(1)
% title('summer upper 100m oxygen response to wind perturbation','FontWeight','Normal','FontSize',23)
% legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
%     'large area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'small area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% subplot(3,1,2)
% h1 = semilogy(days,lin_chl3./1035,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = semilogy(days,lin_chl12./1035,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,nonlin_chl3./1035,'--','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,nonlin_chl12./1035,'--','LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,nonlin_chl3./1035,':','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,nonlin_chl12./1035,':','LineWidth',lw,'Color',at.*Color(c4,:));
% h5 = semilogy(days,slin_chl3./1035,'LineWidth',lw,'Color',at.*Color(c2,:));
% h6 = semilogy(days,slin_chl12./1035,'LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,snonlin_chl3./1035,'--','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,snonlin_chl12./1035,'--','LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,snonlin_chl3./1035,':','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,snonlin_chl12./1035,':','LineWidth',lw,'Color',at.*Color(c3,:));
% h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
% h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks(dates2)
% xlabel('days')
% xlim([0 110])
% % ylim([0 0.006/1035])
% ylabel('mg/kg')
% acc_movie_wh
% acc_3_stack(2)
% title('summer upper 100m chlorophyll response to wind perturbation','FontWeight','Normal','FontSize',23)
% legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
%     'large area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'small area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% subplot(3,1,3)
% h1 = plot(days,dolgskill,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = plot(days,chllgskill,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = plot(days,dopers,'LineWidth',lw,'Color',at.*Color(c5,:));
% h4 = plot(days,chlpers,'--','LineWidth',lw,'Color',at.*Color(c5,:));
% h5 = plot(days,chlpers,':','LineWidth',lw,'Color',at.*Color(c5,:));
% yline(0,'LineWidth',lw-1,'Color','k');
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks([0:5:30])
% yticks([-0.5:0.25:1])
% xlim([0 33.75])
% ylim([-0.25 1])
% acc_movie_wh
% xlabel('days')
% ylabel('skill')
% acc_3_stack(3,6)
% title('proportion of upper 100m variance explained','FontWeight','Normal','FontSize',23)
% legend([h1(1),h2(1),h3(1),h4(1)],...
%     '1/3\circ O_2','1/3\circ chl','1/12\circ O_2 persistence','1/12\circ chl persistence',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% set(gcf,'InvertHardCopy','off'); 
% print('-r300','plots6/summer100m_DOCHL','-dpng')
% 
% 
% close all
% 
% clear 
% 
% 
% load wsPERT_RESPONSE_smooth_100m *do* *chl*
% 
% slin_chl12 = lin_chl12;
% slin_chl3 = lin_chl3;
% snonlin_chl12 = nonlin_chl12;
% snonlin_chl3 = nonlin_chl3;
% 
% slin_do12 = lin_do12;
% slin_do3 = lin_do3;
% snonlin_do12 = nonlin_do12;
% snonlin_do3 = nonlin_do3;
% 
% load wPERT_RESPONSE_smooth_100m *do* *chl* six_hours
% 
% 
% load persist/w100dopers
% load persist/w100chlpers
% load extras/w100dodiff312d
% load extras/w100chldiff312d
% 
% dolgskill = 1 - (dodiff312.^2)./(do12rms.^2);
% chllgskill = 1 - (chldiff312.^2)./(chl12rms.^2);
% 
% %% 
% 
% acc_colors
% lw = 3.6;
% c1 = 95; c5 = 50;
% c2 = 94;
% c3 = 93;
% c4 = 92;
% at = 1;
% 
% dates2 = [datenum('20170101','yyyymmdd'),datenum('20170116','yyyymmdd'),...
%     datenum('20170131','yyyymmdd'),datenum('20170215','yyyymmdd'),...
%     datenum('20170302','yyyymmdd'),datenum('20170317','yyyymmdd'),...
%     datenum('20170401','yyyymmdd'),datenum('20170416','yyyymmdd'),...
%     datenum('20170501','yyyymmdd')];
% dates2 = dates2 - dates2(1);
% 
% days = 1:122;
% 
% figure();
% set(gcf, 'Position', [1, 1, 1700, 1800])
% subplot(3,1,1)
% h1 = semilogy(days,1000000.*lin_do3./1035,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = semilogy(days,1000000.*lin_do12./1035,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,1000000.*nonlin_do3./1035,'--','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,1000000.*nonlin_do12./1035,'--','LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,1000000.*nonlin_do3./1035,':','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,1000000.*nonlin_do12./1035,':','LineWidth',lw,'Color',at.*Color(c4,:));
% h5 = semilogy(days,1000000.*slin_do3./1035,'LineWidth',lw,'Color',at.*Color(c2,:));
% h6 = semilogy(days,1000000.*slin_do12./1035,'LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,1000000.*snonlin_do3./1035,'--','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,1000000.*snonlin_do12./1035,'--','LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,1000000.*snonlin_do3./1035,':','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,1000000.*snonlin_do12./1035,':','LineWidth',lw,'Color',at.*Color(c3,:));
% h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
% h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks(dates2)
% xlim([0 110])
% % ylim([5e-11 6e-7])
% ylabel('\mumol/kg')
% acc_movie_wh
% acc_3_stack(1)
% title('winter upper 100m oxygen response to wind perturbation','FontWeight','Normal','FontSize',23)
% legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
%     'large area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'small area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% subplot(3,1,2)
% h1 = semilogy(days,lin_chl3./1035,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = semilogy(days,lin_chl12./1035,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,nonlin_chl3./1035,'--','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,nonlin_chl12./1035,'--','LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,nonlin_chl3./1035,':','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,nonlin_chl12./1035,':','LineWidth',lw,'Color',at.*Color(c4,:));
% h5 = semilogy(days,slin_chl3./1035,'LineWidth',lw,'Color',at.*Color(c2,:));
% h6 = semilogy(days,slin_chl12./1035,'LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,snonlin_chl3./1035,'--','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,snonlin_chl12./1035,'--','LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,snonlin_chl3./1035,':','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,snonlin_chl12./1035,':','LineWidth',lw,'Color',at.*Color(c3,:));
% h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
% h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks(dates2)
% xlabel('days')
% xlim([0 110])
% % ylim([0 0.006/1035])
% ylabel('mg/kg')
% acc_movie_wh
% acc_3_stack(2)
% title('winter upper 100m chlorophyll response to wind perturbation','FontWeight','Normal','FontSize',23)
% legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
%     'large area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'small area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% subplot(3,1,3)
% h1 = plot(days,dolgskill,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = plot(days,chllgskill,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = plot(days,dopers,'LineWidth',lw,'Color',at.*Color(c5,:));
% h4 = plot(days,chlpers,'--','LineWidth',lw,'Color',at.*Color(c5,:));
% h5 = plot(days,chlpers,':','LineWidth',lw,'Color',at.*Color(c5,:));
% yline(0,'LineWidth',lw-1,'Color','k');
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks([0:5:30])
% yticks([-0.5:0.25:1])
% xlim([0 33.75])
% ylim([-0.25 1])
% acc_movie_wh
% xlabel('days')
% ylabel('skill')
% acc_3_stack(3,6)
% title('proportion of upper 100m variance explained','FontWeight','Normal','FontSize',23)
% legend([h1(1),h2(1),h3(1),h4(1)],...
%     '1/3\circ O_2','1/3\circ chl','1/12\circ O_2 persistence','1/12\circ chl persistence',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% set(gcf,'InvertHardCopy','off'); 
% print('-r300','plots6/winter100m_DOCHL','-dpng')
% 
% 
% close all
% 
% clear
% 
% 
% load wsPERT_RESPONSE_smooth *do* *chl*
% 
% slin_chl12 = lin_chl12;
% slin_chl3 = lin_chl3;
% snonlin_chl12 = nonlin_chl12;
% snonlin_chl3 = nonlin_chl3;
% 
% slin_do12 = lin_do12;
% slin_do3 = lin_do3;
% snonlin_do12 = nonlin_do12;
% snonlin_do3 = nonlin_do3;
% 
% load wPERT_RESPONSE_smooth *do* *chl* six_hours
% 
% 
% load persist/wdopers
% load persist/wchlpers
% load extras/wdodiff312d
% load extras/wchldiff312d
% 
% dolgskill = 1 - (dodiff312.^2)./(do12rms.^2);
% chllgskill = 1 - (chldiff312.^2)./(chl12rms.^2);
% 
% %% 
% 
% acc_colors
% lw = 3.6;
% c1 = 95; c5 = 50;
% c2 = 94;
% c3 = 93;
% c4 = 92;
% at = 1;
% 
% dates2 = [datenum('20170101','yyyymmdd'),datenum('20170116','yyyymmdd'),...
%     datenum('20170131','yyyymmdd'),datenum('20170215','yyyymmdd'),...
%     datenum('20170302','yyyymmdd'),datenum('20170317','yyyymmdd'),...
%     datenum('20170401','yyyymmdd'),datenum('20170416','yyyymmdd'),...
%     datenum('20170501','yyyymmdd')];
% dates2 = dates2 - dates2(1);
% 
% days = 1:122;
% 
% figure();
% set(gcf, 'Position', [1, 1, 1700, 1800])
% subplot(3,1,1)
% h1 = semilogy(days,1000000.*lin_do3./1035,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = semilogy(days,1000000.*lin_do12./1035,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,1000000.*nonlin_do3./1035,'--','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,1000000.*nonlin_do12./1035,'--','LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,1000000.*nonlin_do3./1035,':','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,1000000.*nonlin_do12./1035,':','LineWidth',lw,'Color',at.*Color(c4,:));
% h5 = semilogy(days,1000000.*slin_do3./1035,'LineWidth',lw,'Color',at.*Color(c2,:));
% h6 = semilogy(days,1000000.*slin_do12./1035,'LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,1000000.*snonlin_do3./1035,'--','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,1000000.*snonlin_do12./1035,'--','LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,1000000.*snonlin_do3./1035,':','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,1000000.*snonlin_do12./1035,':','LineWidth',lw,'Color',at.*Color(c3,:));
% h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
% h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks(dates2)
% xlim([0 110])
% % ylim([5e-11 6e-7])
% ylabel('\mumol/kg')
% acc_movie_wh
% acc_3_stack(1)
% title('winter oxygen response to wind perturbation','FontWeight','Normal','FontSize',23)
% legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
%     'large area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'small area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% subplot(3,1,2)
% h1 = semilogy(days,lin_chl3./1035,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = semilogy(days,lin_chl12./1035,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,nonlin_chl3./1035,'--','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,nonlin_chl12./1035,'--','LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = semilogy(days,nonlin_chl3./1035,':','LineWidth',lw,'Color',at.*Color(c1,:));
% h4 = semilogy(days,nonlin_chl12./1035,':','LineWidth',lw,'Color',at.*Color(c4,:));
% h5 = semilogy(days,slin_chl3./1035,'LineWidth',lw,'Color',at.*Color(c2,:));
% h6 = semilogy(days,slin_chl12./1035,'LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,snonlin_chl3./1035,'--','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,snonlin_chl12./1035,'--','LineWidth',lw,'Color',at.*Color(c3,:));
% h7 = semilogy(days,snonlin_chl3./1035,':','LineWidth',lw,'Color',at.*Color(c2,:));
% h8 = semilogy(days,snonlin_chl12./1035,':','LineWidth',lw,'Color',at.*Color(c3,:));
% h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
% h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks(dates2)
% xlabel('days')
% xlim([0 110])
% % ylim([0 0.006/1035])
% ylabel('mg/kg')
% acc_movie_wh
% acc_3_stack(2)
% title('winter surface chlorophyll response to wind perturbation','FontWeight','Normal','FontSize',23)
% legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
%     'large area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'small area','perturbation',...
%     '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% subplot(3,1,3)
% h1 = plot(days,dolgskill,'LineWidth',lw,'Color',at.*Color(c1,:));
% hold on
% h2 = plot(days,chllgskill,'LineWidth',lw,'Color',at.*Color(c4,:));
% h3 = plot(days,dopers,'LineWidth',lw,'Color',at.*Color(c5,:));
% h4 = plot(days,chlpers,'--','LineWidth',lw,'Color',at.*Color(c5,:));
% h5 = plot(days,chlpers,':','LineWidth',lw,'Color',at.*Color(c5,:));
% yline(0,'LineWidth',lw-1,'Color','k');
% grid on
% ax = gca;
% ax.GridAlpha = 1;
% xticks([0:5:30])
% yticks([-0.5:0.25:1])
% xlim([0 33.75])
% ylim([-0.25 1])
% acc_movie_wh
% xlabel('days')
% ylabel('skill')
% acc_3_stack(3,6)
% title('proportion of variance explained','FontWeight','Normal','FontSize',23)
% legend([h1(1),h2(1),h3(1),h4(1)],...
%     '1/3\circ O_2','1/3\circ chl','1/12\circ O_2 persistence','1/12\circ chl persistence',...
%     'Location','eastoutside','FontSize',23)
% hold off
% 
% set(gcf,'InvertHardCopy','off'); 
% print('-r300','plots6/winter_surf_DOCHL','-dpng')
% 
% 
% close all

load sPERT_RESPONSE_smooth *do* *chl*

slin_chl12 = lin_chl12;
slin_chl3 = lin_chl3;
snonlin_chl12 = nonlin_chl12;
snonlin_chl3 = nonlin_chl3;

slin_do12 = lin_do12;
slin_do3 = lin_do3;
snonlin_do12 = nonlin_do12;
snonlin_do3 = nonlin_do3;

load PERT_RESPONSE_smooth *do* *chl* six_hours


load persist/dopers
load persist/chlpers
load extras/dodiff312d
load extras/chldiff312d

dolgskill = 1 - (dodiff312.^2)./(do12rms.^2);
chllgskill = 1 - (chldiff312.^2)./(chl12rms.^2);

%% 

acc_colors
lw = 3.6;
c1 = 95; c5 = 50;
c2 = 94;
c3 = 93;
c4 = 92;
at = 1;

dates2 = [datenum('20170101','yyyymmdd'),datenum('20170116','yyyymmdd'),...
    datenum('20170131','yyyymmdd'),datenum('20170215','yyyymmdd'),...
    datenum('20170302','yyyymmdd'),datenum('20170317','yyyymmdd'),...
    datenum('20170401','yyyymmdd'),datenum('20170416','yyyymmdd'),...
    datenum('20170501','yyyymmdd')];
dates2 = dates2 - dates2(1);

days = 1:122;

figure();
set(gcf, 'Position', [1, 1, 1700, 1800])
subplot(3,1,1)
h1 = semilogy(days,1000000.*lin_do3./1035,'LineWidth',lw,'Color',at.*Color(c1,:));
hold on
h2 = semilogy(days,1000000.*lin_do12./1035,'LineWidth',lw,'Color',at.*Color(c4,:));
h3 = semilogy(days,1000000.*nonlin_do3./1035,'--','LineWidth',lw,'Color',at.*Color(c1,:));
h4 = semilogy(days,1000000.*nonlin_do12./1035,'--','LineWidth',lw,'Color',at.*Color(c4,:));
h3 = semilogy(days,1000000.*nonlin_do3./1035,':','LineWidth',lw,'Color',at.*Color(c1,:));
h4 = semilogy(days,1000000.*nonlin_do12./1035,':','LineWidth',lw,'Color',at.*Color(c4,:));
h5 = semilogy(days,1000000.*slin_do3./1035,'LineWidth',lw,'Color',at.*Color(c2,:));
h6 = semilogy(days,1000000.*slin_do12./1035,'LineWidth',lw,'Color',at.*Color(c3,:));
h7 = semilogy(days,1000000.*snonlin_do3./1035,'--','LineWidth',lw,'Color',at.*Color(c2,:));
h8 = semilogy(days,1000000.*snonlin_do12./1035,'--','LineWidth',lw,'Color',at.*Color(c3,:));
h7 = semilogy(days,1000000.*snonlin_do3./1035,':','LineWidth',lw,'Color',at.*Color(c2,:));
h8 = semilogy(days,1000000.*snonlin_do12./1035,':','LineWidth',lw,'Color',at.*Color(c3,:));
h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
xlim([0 110])
% ylim([5e-11 6e-7])
ylabel('\mumol/kg')
acc_movie_wh
acc_3_stack(1)
title('summer oxygen response to wind perturbation','FontWeight','Normal','FontSize',23)
legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
    'large area','perturbation',...
    '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
    'small area','perturbation',...
    '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
    'Location','eastoutside','FontSize',23)
hold off

subplot(3,1,2)
h1 = semilogy(days,lin_chl3./1035,'LineWidth',lw,'Color',at.*Color(c1,:));
hold on
h2 = semilogy(days,lin_chl12./1035,'LineWidth',lw,'Color',at.*Color(c4,:));
h3 = semilogy(days,nonlin_chl3./1035,'--','LineWidth',lw,'Color',at.*Color(c1,:));
h4 = semilogy(days,nonlin_chl12./1035,'--','LineWidth',lw,'Color',at.*Color(c4,:));
h3 = semilogy(days,nonlin_chl3./1035,':','LineWidth',lw,'Color',at.*Color(c1,:));
h4 = semilogy(days,nonlin_chl12./1035,':','LineWidth',lw,'Color',at.*Color(c4,:));
h5 = semilogy(days,slin_chl3./1035,'LineWidth',lw,'Color',at.*Color(c2,:));
h6 = semilogy(days,slin_chl12./1035,'LineWidth',lw,'Color',at.*Color(c3,:));
h7 = semilogy(days,snonlin_chl3./1035,'--','LineWidth',lw,'Color',at.*Color(c2,:));
h8 = semilogy(days,snonlin_chl12./1035,'--','LineWidth',lw,'Color',at.*Color(c3,:));
h7 = semilogy(days,snonlin_chl3./1035,':','LineWidth',lw,'Color',at.*Color(c2,:));
h8 = semilogy(days,snonlin_chl12./1035,':','LineWidth',lw,'Color',at.*Color(c3,:));
h9 = plot(1:10,NaN.*ones(10,1),'w','LineWidth',lw);
h10 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
h11 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
h12 = plot(11:20,NaN.*ones(10,1),'w','LineWidth',lw);
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
xlabel('days')
xlim([0 110])
% ylim([0 0.006/1035])
ylabel('mg/kg')
acc_movie_wh
acc_3_stack(2)
title('summer surface chlorophyll response to wind perturbation','FontWeight','Normal','FontSize',23)
legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
    'large area','perturbation',...
    '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
    'small area','perturbation',...
    '1/3\circ  linear','1/12\circ  linear','1/3\circ  nonlinear','1/12\circ  nonlinear',...
    'Location','eastoutside','FontSize',23)
hold off

subplot(3,1,3)
h1 = plot(days,dolgskill,'LineWidth',lw,'Color',at.*Color(c1,:));
hold on
h2 = plot(days,chllgskill,'LineWidth',lw,'Color',at.*Color(c4,:));
h3 = plot(days,dopers,'LineWidth',lw,'Color',at.*Color(c5,:));
h4 = plot(days,chlpers,'--','LineWidth',lw,'Color',at.*Color(c5,:));
h5 = plot(days,chlpers,':','LineWidth',lw,'Color',at.*Color(c5,:));
yline(0,'LineWidth',lw-1,'Color','k');
grid on
ax = gca;
ax.GridAlpha = 1;
xticks([0:5:30])
yticks([-0.5:0.25:1])
xlim([0 33.75])
ylim([-0.25 1])
acc_movie_wh
xlabel('days')
ylabel('skill')
acc_3_stack(3,6)
title('proportion of variance explained','FontWeight','Normal','FontSize',23)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3\circ O_2','1/3\circ chl','1/12\circ O_2 persistence','1/12\circ chl persistence',...
    'Location','eastoutside','FontSize',23)
hold off

set(gcf,'InvertHardCopy','off'); 
print('-r300','plots6/summer_surf_DOCHL','-dpng')


close all

clear

toc()
