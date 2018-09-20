% Figure 5E
clear all;
close all;

%load data and plot the control samples
load('Figure5DE_SourceData.mat');
box on;
for i =1 : length(control)
    [val ind]=min(abs(control(i).d-6));
    figure(1)
    plot(control(i).t-control(i).t(ind),control(i).d,'color',[127 201 127]/255,'linewidth',2,'markersize',15); hold on;
end

xlim([-10 50]);
ylim([5 10]);

% plot the cut samples
plot(cutcenter(3).t-76,cutcenter(3).d,'color',[217 95 2]/255,'linewidth',2,'markersize',15); hold on;
plot(cutcenter(3).t(cutcenter(3).ix)-76,cutcenter(3).d(cutcenter(3).ix),'o','color',[217 95 2]/255,'linewidth',2,'markersize',12); hold on;

plot(cutcenter(7).t-30,cutcenter(7).d,'color',[217 95 2]/255,'linewidth',2,'markersize',15); hold on;
plot(cutcenter(7).t(cutcenter(7).ix)-30,cutcenter(7).d(cutcenter(7).ix),'o','color',[217 95 2]/255,'linewidth',2,'markersize',12); hold on;

plot(cutcenter(8).t-26,cutcenter(8).d,'color',[217 95 2]/255,'linewidth',2,'markersize',15); hold on;
plot(cutcenter(8).t(cutcenter(8).ix)-26,cutcenter(8).d(cutcenter(8).ix),'o','color',[217 95 2]/255,'linewidth',2,'markersize',12); hold on;
 
plot(cutcenter(9).t-25,cutcenter(9).d,'color',[217 95 2]/255,'linewidth',2,'markersize',15); hold on;
plot(cutcenter(9).t(cutcenter(9).ix)-25,cutcenter(9).d(cutcenter(9).ix),'o','color',[217 95 2]/255,'linewidth',2,'markersize',12); hold on;

plot(cutcenter(10).t-20,cutcenter(10).d,'color',[217 95 2]/255,'linewidth',2,'markersize',15); hold on;
plot(cutcenter(10).t(cutcenter(10).ix)-20,cutcenter(10).d(cutcenter(10).ix),'o','color',[217 95 2]/255,'linewidth',2,'markersize',12); hold on;


xlabel('Time(second)');
ylabel('Chromosome-to-chromosome distance(\mum)');
box on;