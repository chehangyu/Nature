% Figure 4C
close all;
clear all;

% load data and plot the bleached data
load('Figure4C_SourceData.mat');
for i=1:length(I)
    [v ind]=min(I(i).fivepix(1:40));
    I(i).normalized=I(i).fivepix(ind-5:ind+30)/I(i).fivepix(ind-1);
    if i==5
        I(i).normalized=I(i).fivepix(ind-6:ind+29)/I(i).fivepix(ind-2);
    end
    plot(t,I(i).normalized,'r-','linewidth',2); hold on;
end

% plot the control data
plot(t,y,'b','linewidth',2);
xlim([-10 60]);
ylim([0.5 1.2]);
plot([0 0],[0.5 1.2],'k--','linewidth',2);

xlabel('Time(second)');
ylabel('Normalized fluorescence');