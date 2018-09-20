% Figure 3E left
clear all;
close all;

S18=importdata('Figure3Eleft_SourceData.tif');
S18=double(S18);
pixelsize=0.1739;
mat(1,:)=S18(40,33:33+11);
mat(2,:)=S18(47,33:33+11);
mat(3,:)=S18(55,33:33+11);

x=pixelsize*(1:1:size(mat,2));
x=x-x(1);
xq=1:0.5:size(mat,2);

maxmat=[40,40,41];
for i = 1:3
    normmat(i,:)=smooth(mat(i,:));
    normmat(i,:)=(normmat(i,:)-min(normmat(i,:)))/(maxmat(i)-min(normmat(i,:)));
    vq(i,:)=interp1(x,mat(i,:),xq,'spline');
end


plot(x,normmat');
ylim([-0.1,1]);
xlabel('Position(/mum)');
ylabel('Normalized intensity');

