% Figure 4A - plot
clear all;
close all;

load('Figure4A_SourceData_WT17um.mat');
errorbar(position_control,avg_control_17,str_control_17,'k.','markersize',10); hold on;
xlabel('Position(\mum)');
ylabel('Polarity');

load('Figure4A_SourceData_WT20um.mat');
errorbar(position_control,avg_control_20,str_control_20,'r.','markersize',10); hold on;
xlabel('Position(\mum)');
ylabel('Polarity');

load('Figure4A_SourceData_RNAidata.mat');
errorbar(position_gpr1_14,avg_gpr1_14,str_gpr1_14,'g.','markersize',10); hold on;
errorbar(position_gpr1_15,avg_gpr1_15,str_gpr1_15,'b.','markersize',10);
xlabel('Position(\mum)');
ylabel('Polarity');

alpha(0.1);
xlim([-6 6]);
ylim([0 1]);
legend('Wildtype: early anaphase','Wildtype: later anaphase', 'GPR-1/2(RNAi): early anaphase', 'GPR-1/2(RNAi): later anaphase', 'Location', 'southeast');