% Figure 5C
clear all;
close all;

%Load data
load('Figure5C_SourceData.mat');
yc=5.5;
t=4*((1:1:120)-41)';

%Aligned the curves and calculated the mean, SEM, and velocity
for i = 1:length(control)
    [val_control(i) ind_control(i)]=min(abs(control(i).d_chromtochrom-yc));
    mat_chromtochrom(:,i)=[NaN(50-ind_control(i),1); control(i).d_chromtochrom; NaN(120-length(control(i).d_chromtochrom)-(50-ind_control(i)),1)];
    mat_poletopole(:,i)=[NaN(50-ind_control(i),1); control(i).d_poletopole; NaN(120-length(control(i).d_poletopole)-(50-ind_control(i)),1)];
    mat_poletochrom_g1(:,i)=[NaN(50-ind_control(i),1); control(i).d_poletochrom_g1; NaN(120-length(control(i).d_poletochrom_g1)-(50-ind_control(i)),1)];
    mat_poletochrom_g2(:,i)=[NaN(50-ind_control(i),1); control(i).d_poletochrom_g2; NaN(120-length(control(i).d_poletochrom_g2)-(50-ind_control(i)),1)];
    
    [fitresult, gof] = Figure5C_SourceCode_fn_Linearfit(t(48:55),mat_chromtochrom(48:55,i));
    v_chromtochrom(i,1)=60*fitresult.p1;
    
    [fitresult, gof] = Figure5C_SourceCode_fn_Linearfit(t(48:55),mat_poletopole(48:55,i));
    v_poletopole(i,1)=60*fitresult.p1;
    
    [fitresult, gof] = Figure5C_SourceCode_fn_Linearfit(t(48:55),mat_poletochrom_g1(48:55,i));
    v_poletochrom_g1(i,1)=60*fitresult.p1;
    
    [fitresult, gof] = Figure5C_SourceCode_fn_Linearfit(t(48:55),mat_poletochrom_g2(48:55,i));
    v_poletochrom_g2(i,1)=60*fitresult.p1;

end

    
    mean_chromtochrom=mean(mat_chromtochrom,2,'omitnan');
    mean_poletopole=mean(mat_poletopole,2,'omitnan');
    mean_poletochrom=mean([mat_poletochrom_g1,mat_poletochrom_g2],2,'omitnan');
    mean_poletochrom_g1=mean(mat_poletochrom_g1,2,'omitnan');
    mean_poletochrom_g2=mean(mat_poletochrom_g2,2,'omitnan');
    
    sem_chromtochrom=std(mat_chromtochrom,1,2,'omitnan')/sqrt(length(control));
    sem_poletopole=std(mat_poletopole,1,2,'omitnan')/sqrt(length(control));
    sem_poletochrom=std([mat_poletochrom_g1,mat_poletochrom_g2],1,2,'omitnan')/(2*sqrt(length(control)));
    
    sem_poletochrom_g1=std(mat_poletochrom_g1,1,2,'omitnan')/sqrt(length(control));
    sem_poletochrom_g2=std(mat_poletochrom_g2,1,2,'omitnan')/sqrt(length(control));
    
    mean_v_chromtochrom=mean(v_chromtochrom);
    mean_v_poletopole=mean(v_poletopole);
    mean_v_poletochrom=mean([v_poletochrom_g1;v_poletochrom_g2]);
    
    sem_v_chromtochrom=std(v_chromtochrom)/sqrt(length(v_chromtochrom));
    sem_v_poletopole=std(v_poletopole)/sqrt(length(v_poletopole));
    sem_v_poletochrom=std([v_poletochrom_g1;v_poletochrom_g2])/sqrt(length([v_poletochrom_g1;v_poletochrom_g2]));
   

% Plot
    figure;
    Figure5C_SourceCode_shadedErrorBar(t,mean_chromtochrom/2, sem_chromtochrom/2,'lineprops','g'); hold on;
    Figure5C_SourceCode_shadedErrorBar(t,mean_poletopole/2, sem_poletopole/2,'lineprops','b'); hold on;
    Figure5C_SourceCode_shadedErrorBar(t,mean_poletochrom, sem_poletochrom,'lineprops','m'); hold on;
    xlim([-20 160]);
    ylim ([1 11]);
    xlabel('Time(sec)');
    ylabel('Distance(/mum)');
    