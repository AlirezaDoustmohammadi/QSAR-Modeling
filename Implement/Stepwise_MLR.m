load('X1.mat')
load('X4.mat')
load('Y2.mat')

%X1
%R2=0.7815 , RMSE=0.2384
stepwisefit(X1,Y2); % calculates features
Xsel1=X1(:,[929,958,294,799,841]);  
Xsel2=[ones(size(Xsel1,1),1) Xsel1];
%calculate Coefficiants
B=inv(Xsel2'*Xsel2)*(Xsel2'*Y2);
bar(B(2:end,1));
Yhat=Xsel2*B;
plot(Y2,Yhat,'r*');
%calculate R2&RMSE
[R2,RMSE] = R2RMSE(Y2,Yhat);

%X4
%R2=0.7815 , RMSE=0.2384
stepwisefit(X4,Y2); % calculates features
Xsel2=X4(:,[929,958,294,799,841]);  
Xsel2=[ones(size(Xsel2,1),1) Xsel2];
%calculate Coefficiants
B=inv(Xsel2'*Xsel2)*(Xsel2'*Y2);
bar(B(2:end,1));
Yhat=Xsel2*B;
plot(Y2,Yhat,'r*');
%calculate R2&RMSE
[R2,RMSE] = R2RMSE(Y2,Yhat);

%validation
%MCCV
[R2t,RMSEt,R2CV,RMSECV,MeanR2CV,MeanRMSEV]=MCCVMLR(Xsel1,Y2,1000);
[R2t,RMSEt,R2CV,RMSECV,MeanR2CV,MeanRMSEV]=MCCVMLR(Xsel2,Y2,1000);
%LOOMLR
[R2C,RMSEC,R2V,RMSEV]=LOOMLR(Xsel1,Y2);
[R2C,RMSEC,R2V,RMSEV]=LOOMLR(Xsel2,Y2);

%save matlab matrix
save MLR1 Xsel1;
save MLR4 Xsel2;
%save data in Excel
writetable(table(Xsel1),'MLR1.xlsx','Sheet',1,'Range','A1');
writetable(table(Xsel1),'MLR4.xlsx','Sheet',1,'Range','A1');