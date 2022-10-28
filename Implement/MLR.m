load('X1.mat')
load('X4.mat')
load('Y2.mat')

%X1
%R2=0.7815 , RMSE=0.2384
Xsel1=X1;  
Xsel1=[ones(size(Xsel1,1),1) Xsel1];
%calculate Coefficiants
B=inv(Xsel1'*Xsel1)*(Xsel1'*Y2);
bar(B(2:end,1));
Yhat=Xsel1*B;
plot(Y2,Yhat,'r*');
%calculate R2&RMSE
[R2,RMSE] = R2RMSE(Y2,Yhat);

%X4
%R2=0.7815 , RMSE=0.2384
Xsel2=X4;  
Xsel2=[ones(size(Xsel2,1),1) Xsel2];
%calculate Coefficiants
B=inv(Xsel2'*Xsel2)*(Xsel2'*Y2);
bar(B(2:end,1));
Yhat=Xsel2*B;
plot(Y2,Yhat,'r*');
%calculate R2&RMSE
[R2,RMSE] = R2RMSE(Y2,Yhat);
