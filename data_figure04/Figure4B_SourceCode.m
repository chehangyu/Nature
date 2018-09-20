% Figre 3B
clear all;
close all;

% load data
load('Figure3B_SourceData.mat');
ind_once=find(diff([data_once.data.tMTLSN])>2.5);

%plot
plot([data_nocut.data.tMTLSN]-4,[data_nocut.data.chromosomedistance],'.','color',[127,201,127]/255,'markersize',28); hold on;
plot([data_once.data.tMTLSN],[data_once.data.chromosomedistance],'.','color',[217,95,2]/255,'markersize',28); hold on;
plot(data_once.data(ind_once).tMTLSN,data_once.data(ind_once).chromosomedistance,'.','color',[117,0,255]/255,'markersize',28);
xlim([0 240]);
ylim([0 7]);
x0=10;
y0=10;
width=550;
height=550;
set(gcf,'units','points','position',[x0,y0,width,height]);
legend('no cut','cut one time','location','northwest');
ax = gca; % current axes
ax.FontSize = 40;
ax.FontWeight = 'bold';
ax.YTick=0:2:6;
ax.XTick=0:60:240;
