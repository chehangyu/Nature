% Figure 4D
clear all;
close all;

% load data and plot 
load('Figure4D_SourceData.mat');
close all;
t=1:1:w+1;
t=2*(t-6);
plot(t,[I.bv],'r','linewidth',2); hold on;
plot(t,[I.nv],'b','linewidth',2);
xlim([-10 60]);
ylim([0.5 1.2]);
xlabel('Time(second)');
ylabel('Normalized fluorescence');
plot([0 0],[0.5 1.2],'k--','linewidth',2);