function [R2,a2]=EDANN(x,y)

[s,v,d]=svd(x);
S=s*v;

%X1:30 componrnt
%R2=0.86221
%X4 23 componrnt
%R2=0.7895
Ssel=S(:,1:30);

Ssel=Ssel';
y=y';

%[pn,ps1]=mapminmax(p);
%[tn,ts1]=mapminmax(t);

net=newff(minmax(Ssel),minmax(y),4,{'tansig','purelin'},'trainbr');

 net = train(net,Ssel,y);
 
 a2=sim(net,Ssel);

%a = mapminmax('reverse',a2,ts1);

a2=a2'
R2=corrcoef(a2,y');

R2=R2(1,2).^2;

RMSE=sqrt(sum((a2-y').^2)./size(a2,1));

R2
RMSE

plot(y,a2,'b*')

title(num2str(R2))