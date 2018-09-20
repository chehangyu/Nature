% Figure 6C
clear all;
close all;

%load data
load('Figure6C_SourceData.mat');

%Plot
plot(tt(1).control,dd(1).control,'c-','linewidth',2,'markersize',15); hold on;
plot(tt(2).control,dd(2).control,'c-','linewidth',2,'markersize',15); hold on;
plot(tt(3).control,dd(3).control,'c-','linewidth',2,'markersize',15); hold on;

plot(tt(1).cut,dd(1).cut,'m-','linewidth',2,'markersize',15); hold on;
plot(tt(1).cut(tt(1).ind+1),dd(1).cut(tt(1).ind+1),'mo:','linewidth',2,'markersize',20);hold on;

plot(tt(2).cut,dd(2).cut,'m-','linewidth',2,'markersize',15); hold on;
plot(tt(2).cut(tt(2).ind+1),dd(2).cut(tt(2).ind+1),'mo:','linewidth',2,'markersize',20);hold on;

plot(tt(3).cut,dd(3).cut,'m-','linewidth',2,'markersize',15); hold on;
plot(tt(3).cut(tt(3).ind+1),dd(3).cut(tt(3).ind+1),'mo:','linewidth',2,'markersize',20);hold on;

xlabel('Time (second)');
ylabel('Chromosome distance (\mum)');
xlim([0 60]);
ylim([3 3.8]);
