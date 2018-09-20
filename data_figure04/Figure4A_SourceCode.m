clear all;
close all;

load('Figure3A_SourceData.mat')

ind_nocut=find(diff([data_nocut.data.tMTLSN])>3);
ind_cutfarpole=find(diff([data_cutfarpole.data.tMTLSN])>3);
close all;

plot([data_nocut.data.tMTLSN]-4,[data_nocut.data.chromosomedistance],'.','color',[253,184,99]/255,'markersize',28); hold on;
plot([data_cutfarpole.data.tMTLSN],[data_cutfarpole.data.chromosomedistance],'.','color',[230,97,1]/255,'markersize',28);
plot(data_cutfarpole.data(ind_cutfarpole).tMTLSN,data_cutfarpole.data(ind_cutfarpole).chromosomedistance,'.','color',[5,113,176]/255,'markersize',28);
xlim([0 240]);
ylim([0 7]);
legend('uncut','cut near chromosomes','cut applied','location','southeast');
x0=10;
y0=10;
width=550;
height=550;
set(gcf,'units','points','position',[x0,y0,width,height]);
ax = gca; % current axes
ax.FontSize = 24;
ax.FontWeight = 'bold';
ax.YTick=0:2:6;
ax.XTick=0:60:240;