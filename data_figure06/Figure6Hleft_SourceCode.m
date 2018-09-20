%Figure 5H left
clear all;
close all;

%load data
load('Figure5Hleft_SourceData.mat');

%normalize the data and align the data according to where the center is
tempy00=y00(45-20:45+20);
tempy16=y16(47-20:47+20);
tempy30=y30(48-20:48+20);
y00_normalized=(tempy00-min(tempy00))/(max(tempy00)-min(tempy00));
y16_normalized=(tempy16-min(tempy16))/(max(tempy16)-min(tempy16));
y30_normalized=(tempy30-min(tempy30))/(max(tempy30)-min(tempy30));
x=0.1739*([1:1:length(y00_normalized)]-21);

%plot
plot(x,y00_normalized); hold on;
plot(x,y16_normalized);hold on;
plot(x,y30_normalized);
xlim([-3 3]);
xlabel('Position(\mum)');
ylabel('Normalized intensity');