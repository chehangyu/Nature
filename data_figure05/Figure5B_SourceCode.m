%Figure 4B
close all;
clear all;

load('Figure4B_SourceData.mat');
pixelsize=0.1739; 

yavg=mean([y1,smooth(y2(2:end)-670),y3(1:end-1)-250],2);
str=std([y1,smooth(y2(2:end)-670),y3(1:end-1)-250],1,2)/sqrt(3);
x=(x1-x1(4))*pixelsize;

errorbar(x-4.8,yavg,str,'g.','markersize',20);
xlim([-5 5]);
xlabel('Positioin (\mum)');
ylabel('EB1::GFP (count)');


