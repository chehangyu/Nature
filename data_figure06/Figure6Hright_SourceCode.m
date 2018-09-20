%Figure 5H right
clear all;
close all;

%load data
load('Figure5Hright_SourceData.mat');

% bar plot
figure;
errorbar(1:3, mean(remat),std(remat,1)/sqrt(size(remat,1)),'k.'); hold on;
bar(1:3,mean(remat),0.3); hold on;
title('Mean Velocity');
ylabel('v(\mum/min)')
set(gca,'Xtick',[1:3]);
set(gca,'Ytick',[0:3]);
set(gca,'XtickLabel',{'Microtubule','Chromosome','Pole'});

%calculate the p-values
[Hmc Pmc]=ttest2(remat(:,1),remat(:,2))
[Hmp Pmp]=ttest2(remat(:,1),remat(:,3))