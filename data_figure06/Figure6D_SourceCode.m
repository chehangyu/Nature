% Figure 5D
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
plot(cutside(2).t-38,cutside(2).d,'color',[56 108 176]/255,'linewidth',2,'markersize',12); hold on;
plot(cutside(2).t(cutside(2).ix)-38,cutside(2).d(cutside(2).ix),'o','color',[56 108 176]/255,'linewidth',2,'markersize',12); hold on;

plot(cutside(3).t-26,cutside(3).d,'color',[56 108 176]/255,'linewidth',2,'markersize',12); hold on;
plot(cutside(3).t(cutside(3).ix)-26,cutside(3).d(cutside(3).ix),'o','color',[56 108 176]/255,'linewidth',2,'markersize',12); hold on;

plot(cutside(5).t-62,cutside(5).d,'color',[56 108 176]/255,'linewidth',2,'markersize',12); hold on;
plot(cutside(5).t(cutside(5).ix)-62,cutside(5).d(cutside(5).ix),'o','color',[56 108 176]/255,'linewidth',2,'markersize',12); hold on;

plot(cutside(7).t-20,cutside(7).d,'color',[56 108 176]/255,'linewidth',2,'markersize',12); hold on;
plot(cutside(7).t(cutside(7).ix)-20,cutside(7).d(cutside(7).ix),'o','color',[56 108 176]/255,'linewidth',2,'markersize',12); hold on;

plot(cutside(8).t-39,cutside(8).d,'color',[56 108 176]/255,'linewidth',2,'markersize',12); hold on;
plot(cutside(8).t(cutside(8).ix(2))-39,cutside(8).d(cutside(8).ix(2)),'o','color',[56 108 176]/255,'linewidth',2,'markersize',12); hold on


xlabel('Time(second)');
ylabel('Chromosome-to-chromosome distance(\mum)');
box on;