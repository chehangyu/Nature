%% Figure 3E right
clear all;
close all;

%loading data
load('Figure3Eright_SourceData.mat');

%calculate average velocity; the reference position is the spindle center
data.Microtubule=V_b_byfit_60sec';
data.Chromosome=V_c_60sec'; 
data.Pole=V_p_60sec'; 

%Calculate the mean and the SEM
f=fields(data); 

for ii=1:length(f)
    mu(ii)=mean( data.(f{ii}) ); 
    sem(ii)=std( data.(f{ii}),1,2)/sqrt(length(data.(f{ii})));
end

%Plot
H=bar(mu); 
set(H,'EdgeColor','b','FaceColor',[127/255,201/255,127/255],'LineWidth',0.5) 
set(gca,'XTickLabel',f)
ylabel('Velocity (\mum/min)');

hold on
for ii=1:length(f)
    errorbar(ii,mu(ii),sem(ii),'-k','MarkerSize',8,'LineWidth',2);
    plot([ii-0.15,ii+0.15],[mu(ii),mu(ii)],'-k','LineWidth',3);
end
hold off

%calculate the p-values
[H_1,P_1] =ttest2(V_b_byfit_60sec,V_c_60sec)
[H_2,P_2] =ttest2(V_b_byfit_60sec,V_p_60sec)