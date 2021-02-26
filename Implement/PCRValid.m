load('X1.mat');
load('X4.mat');
load('Y2.mat');
%%%%% Method PCR with validation (FOR Data X1):
 for i=1:34
     [R2C,RMSEC,R2V,RMSEV]=LOOPCR(X1,Y2,i);
     R2allc(i,1)=R2C;
     R2allv(i,1)=R2V;
 end
 %compare R2C & R2V
plot(R2allc)
hold on
plot(R2allv,'r*')
 %%Best PCR is PCR with 5 components
[Ssel,B,R2,RMSE]=PCR(X1,Y2,5);
bar(B(2:end,1));
%calculate Y^
yfit =Ssel *B;
plot(Y2,yfit,'r*')

%%%%% Method PCR with validation (FOR Data X1):
 for i=1:34
     [R2C,RMSEC,R2V,RMSEV]=LOOPCR(X4,Y2,i);
     R2allc(i,1)=R2C;
     R2allv(i,1)=R2V;
 end
 %compare R2C & R2V
plot(R2allc)
hold on
plot(R2allv,'r*')
 %%Best PCR is PCR with 5 components
[R2C,RMSEC,R2V,RMSEV]=LOOPCR(X4,Y2,5);
 %%Best PCR is PCR with 5 components
[Ssel,B,R2,RMSE]=PCR(X4,Y2,5);
bar(B(2:end,1));
%calculate Y^
yfit =Ssel *B;
plot(Y2,yfit,'r*')