load('X1.mat');
load('X4.mat');
load('Y2.mat');
%%%%% Method PLS with validation (FOR Data X1):
 for i=1:29
     [R2C,RMSEC,R2V,RMSEV]=LOOPLS(X1,Y2,i);
     R2allc(i,1)=R2C;
     R2allv(i,1)=R2V;
 end
 %compare R2C & R2V
plot(R2allc)
hold on
plot(R2allv,'r*')
%%Best PCR is PLS with 1 components
[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats] = plsregress(X1,Y2,1,'cv',10);  %10 kfold cross validation
bar(BETA(2:end,1));
yfit = [ones(size(X1,1),1) X1]*BETA;
plot(Y2,yfit,'r*')
%Mean Square Error
bar(MSE(1,:))
bar(MSE(end,:))
%Calculate PLS Coeficiant
XS=[ones(size(XS,1),1) XS];
%calculate Coef
B=inv(XS'*XS)*(XS'*Y2);
bar(B(2:end,1))
%calculate Y^
Yhat=XS*B;
plot(Y2,Yhat,'r*');
R2=corrcoef(Y2,Yhat).^2;
R2=R2(1,2); %R2=0.3737
RMSE=sqrt([sum((Y2-Yhat).^2)]./(size(XS,1)-1)); %RMSE=0.4097



%%%%% Method PLS with validation (FOR Data X4):
 for i=1:29
     [R2C,RMSEC,R2V,RMSEV]=LOOPLS(X4,Y2,i);
     R2allc(i,1)=R2C;
     R2allv(i,1)=R2V;
 end
 %compare R2C & R2V
plot(R2allc)
hold on
plot(R2allv,'r*')
%%Best PCR is PLS with 1 components
[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats] = plsregress(X4,Y2,1,'cv',10);  %10 kfold cross validation
bar(BETA(2:end,1));
yfit = [ones(size(X4,1),1) X4]*BETA;
plot(Y2,yfit,'r*')
%Mean Square Error
bar(MSE(1,:))
bar(MSE(end,:))
%Calculate PLS Coeficiant
XS=[ones(size(XS,1),1) XS];
%calculate Coef
B=inv(XS'*XS)*(XS'*Y2);
bar(B(2:end,1))
%calculate Y^
Yhat=XS*B;
plot(Y2,Yhat,'r*');
R2=corrcoef(Y2,Yhat).^2;
R2=R2(1,2); %R2=0.3380
RMSE=sqrt([sum((Y2-Yhat).^2)]./(size(XS,1)-1)); %RMSE=0.4212

