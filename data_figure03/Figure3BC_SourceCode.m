%% Figure 1B
close all;
clear all;

%load data
load('Figure2BC_SourceData.mat');
t=datamatrixC(1).timeinterval_mcherry(datamatrixC(1).onsetofanaphase:datamatrixC(1).onsetofanaphase+49);

%calculate the mean and the standard deviation of the spindle elongation
pole_elongationC=pixelSize*spindlelengthC/2;
avg_elongationC=mean(pole_elongationC,2);
sem_elongationC=std(pole_elongationC,1,2)/sqrt(size(pole_elongationC,2));

pole_elongationR=pixelSize*spindlelengthR/2;
avg_elongationR=mean(pole_elongationR,2);
sem_elongationR=std(pole_elongationR,1,2)/sqrt(size(pole_elongationR,2));


%calculate the chromosome-to-chromosome distance
pole_chromo_disC=(pixelSize*spindlelengthC-chromo_elongationC)/2;
pole_chromo_disR=(pixelSize*spindlelengthR-chromo_elongationR)/2;

%calculate the mean and the standard deviation of the pole-to-chromosome
%distance
avg_pole_chromo_disC=mean(pole_chromo_disC,2);
avg_pole_chromo_disR=mean(pole_chromo_disR,2);
sem_pole_chromo_disC=std(pole_chromo_disC,1,2)/sqrt(size(pole_chromo_disC,2));
sem_pole_chromo_disR=std(pole_chromo_disR,1,2)/sqrt(size(pole_chromo_disR,2));

%plot the figure
figure;
subplot(1,2,1);
shadedErrorBar(t,avg_chromo_elongationC/2,str_chromo_elongationC/2,'lineprops','g'); hold on;
shadedErrorBar(t,avg_elongationC,sem_elongationC,'lineprops','b'); hold on;
shadedErrorBar(t,avg_pole_chromo_disC,sem_pole_chromo_disC,'lineprops','r'); hold on;
xlim([0 200]);
ylim([0 12]);
title('Control');

subplot(1,2,2);
shadedErrorBar(t,avg_chromo_elongationR/2,str_chromo_elongationR/2,'lineprops','g'); hold on;
shadedErrorBar(t,avg_elongationR,sem_elongationR,'lineprops','b'); hold on;
shadedErrorBar(t,avg_pole_chromo_disR,sem_pole_chromo_disR,'lineprops','r'); hold on;
xlim([0 200]);
ylim([0 12]);
title('gpr-1/2 (RNAi)');

%% Figure 1C
%calculate the average velocity during the first 180 seconds
v_pole_elongationC=(pole_elongationC(31,:)-pole_elongationC(1,:))/180*60;
v_chromo_elongationC=(chromo_elongationC(31,:)-chromo_elongationC(1,:))/180*60/2;

v_pole_elongationR=(pole_elongationR(31,:)-pole_elongationR(1,:))/180*60;
v_chromo_elongationR=(chromo_elongationR(31,:)-chromo_elongationR(1,:))/180*60/2;

data.v_chromo_elongationC=v_chromo_elongationC; 
data.v_pole_elongationC=v_pole_elongationC; 
data.v_chromo_elongationR=v_chromo_elongationR; 
data.v_pole_elongationR=v_pole_elongationR;

%Calculate means and SEM
f=fields(data); 

for ii=1:length(f)
    mu(ii)=mean( data.(f{ii}) ); 
    sem(ii)=std( data.(f{ii}),1,2)/sqrt(length(data.(f{ii})));
end

%Plot
figure;
H=bar(mu); 
set(H,'EdgeColor','b','FaceColor',[127/255,201/255,127/255],'LineWidth',0.5) 
set(gca,'XTickLabel',f)
ylabel('Velocity (\mum/min)');
ylim([0 1.4]);
hold on

for ii=1
    tmp=data.(f{ii}); %temporarily store data in variable "tmp"
    x = repmat(ii,1,length(tmp)); %the x axis location
    x = x+(rand(size(x))-0.5)*0.3; %add a little random "jitter" to aid visibility
    plot(x,tmp,'.','color',[0 128 0]/255,'markersize',20);
end

for ii=2
    tmp=data.(f{ii}); %temporarily store data in variable "tmp"
    x = repmat(ii,1,length(tmp)); %the x axis location
    x = x+(rand(size(x))-0.5)*0.3; %add a little random "jitter" to aid visibility
    plot(x,tmp,'.','color',[56 108 176]/255,'markersize',20);
end

for ii=3
    tmp=data.(f{ii}); %temporarily store data in variable "tmp"
    x = repmat(ii,1,length(tmp)); %the x axis location
    x = x+(rand(size(x))-0.5)*0.3; %add a little random "jitter" to aid visibility
    plot(x,tmp,'.','color',[0 128 0]/255,'markersize',20);
end

for ii=4
    tmp=data.(f{ii}); %temporarily store data in variable "tmp"
    x = repmat(ii,1,length(tmp)); %the x axis location
    x = x+(rand(size(x))-0.5)*0.3; %add a little random "jitter" to aid visibility
    plot(x,tmp,'.','color',[56 108 176]/255,'markersize',20);
end
hold off

hold on
for ii=1:length(f)
    errorbar(ii,mu(ii),sem(ii),'-k','MarkerSize',8,'LineWidth',2);
    plot([ii-0.15,ii+0.15],[mu(ii),mu(ii)],'-k','LineWidth',3);
end
hold off

% Calculate the p-value
[h_C,p_C]=ttest2(data.v_chromo_elongationC,data.v_pole_elongationC);
[h_R,p_R]=ttest2(data.v_chromo_elongationR,data.v_pole_elongationR);