% Figure 3BC inserts
clear all;
close all;

% load data
load('Figure3BC_SourceData_inserts.mat');
close all;

% plot data: cutting microtubules between chromosomes and poles
subplot(1,2,1)
for i = 1:length(sidechromo)
   plot(sidechromo(i).t-sidechromo(i).t(sidechromo(i).ix(1)+1),sidechromo(i).chromodistance-sidechromo(i).chromodistance(sidechromo(i).ix(1)+1),'r'); hold on;
   sidechromocut(:,i)=sidechromo(i).chromodistance(sidechromo(i).ix(1)+1-15:sidechromo(i).ix(1)+1+15)-sidechromo(i).chromodistance(sidechromo(i).ix(1)+1);
end
for i = 1:length(control)
   plot(control(i).t-control(i).t(control(i).ix(1)+1),control(i).chromodistance-control(i).chromodistance(control(i).ix(1)+1),'b'); hold on;
end
xlim([-15 30]);
ylim([-1.2 1.2]);
xlabel('Time(sec)');
ylabel('Chromosome distance(\mum)');

% plot data: cutting microtubules between separating chromosomes
subplot(1,2,2)
for i = 1:length(central)
   plot(central(i).t-central(i).t(central(i).ix(1)+1),central(i).chromodistance-central(i).chromodistance(central(i).ix(1)+1),'r'); hold on;
end
for i = 1:length(control)
   plot(control(i).t-control(i).t(control(i).ix(1)+1),control(i).chromodistance-control(i).chromodistance(control(i).ix(1)+1),'b'); hold on;
end
xlim([-15 30]);
ylim([-1.2 1.2]);
xlabel('Time(sec)');
ylabel('Chromosome distance(\mum)');
