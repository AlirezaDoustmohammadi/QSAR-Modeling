load('X1.mat');
load('X4.mat');
load('Y2.mat');

%%%%% Choose Best Pls components X1
%LOO
for i=1:29
   [R2C,RMSEC,R2V,RMSEV]=LOOPLS(X1,Y2,i,10);%10 kfold cross  validation
   R2tall(i,1)=R2C;
   R2vall(i,1)=R2V;
end
plot(R2tall)
   hold on
plot(R2vall,'r*')
%MCC
for i=1:22
   [R2t,RMSEt,R2CV,RMSECV]=MCCPLS(X1,Y2,i,1000,10);
   R2tall(i,1)=R2t;
   R2vall(i,1)=R2CV;
end
%R2
plot(R2tall)
   hold on
plot(R2vall,'r*')

%%%%Best PLS is PLS with 7 components
[XL,YL,XS1,YS,BETA,PCTVAR,MSE,stats] = plsregress(X1,Y2,7,'cv',10);  %10 kfold cross validation
XS1=[ones(size(XS1,1),1) XS1]
B=inv(XS1'*XS1)*(XS1'*Y2);
bar(B(2:end,1));
yfit = XS1*B;
plot(Y2,yfit,'r*')
%Mean Square Error
bar(MSE(1,:))
bar(MSE(end,:))


%%%%% Choose Best Pls components X4
%LOO
for i=1:29
   [R2C,RMSEC,R2V,RMSEV]=LOOPLS(X4,Y2,i,10);%10 kfold cross  validation
   R2tall(i,1)=R2C;
   R2vall(i,1)=R2V;
end
plot(R2tall)
   hold on
plot(R2vall,'r*')
%MCC
for i=1:22
   [R2t,RMSEt,R2CV,RMSECV]=MCCPLS(X4,Y2,i,1000,10);
   R2tall(i,1)=R2t;
   R2vall(i,1)=R2CV;
end
%R2
plot(R2tall)
   hold on
plot(R2vall,'r*')

%%%%Best PLS is PLS with 4 components
[XL,YL,XS4,YS,BETA,PCTVAR,MSE,stats] = plsregress(X4,Y2,4,'cv',10);  %10 kfold cross validation
XS4=[ones(size(XS4,1),1) XS4]
B=inv(XS4'*XS4)*(XS4'*Y2);
bar(B(2:end,1));
yfit = XS4*B;
plot(Y2,yfit,'r*')
%Mean Square Error
bar(MSE(1,:))
bar(MSE(end,:))

%save data
save X1PLS XS1;
save X4PLS XS4;
%save data in Excel
writetable(table(XS1),'X1PLS.xlsx','Sheet',1,'Range','A1');
writetable(table(XS4),'X4PLS.xlsx','Sheet',1,'Range','A1');