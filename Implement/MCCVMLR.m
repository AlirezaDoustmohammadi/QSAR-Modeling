function [R2t,RMSEt,R2CV,RMSECV,MeanR2CV,MeanRMSEV]=MCCVMLR(X,Y,n)
X=[ones(size(X,1),1) X];


nVal=floor(size(X,1)/3);

for i=1:n
    ind=randperm(size(X,1))';
    ind=ind(1:nVal,:);
    Xcal=X;
    Ycal=Y;
    Xval=X(ind,:);
    Yval=Y(ind,:);
    Xcal(ind,:)=[];
    Ycal(ind,:)=[];
    B=inv(Xcal'*Xcal)*(Xcal'*Ycal);
    
    YhatCal=Xcal*B;
    [R2,RMSE]=R2RMSE(YhatCal,Ycal);
    
    R2t(i,1)=R2;
    RMSEt(i,1)=RMSE;
    
    YhatVal=Xval*B;
    
    [R2,RMSE]=R2RMSE(YhatVal,Yval);
    
    R2CV(i,1)=R2;
    
    RMSECV(i,1)=RMSE;
    
end

MeanR2CV=sum(R2CV)/size(R2CV,1);
MeanRMSEV=sum(RMSECV)/size(RMSECV,1);

hist(R2t,50)
title('R2train')
figure
hist(RMSEt,50)
title('RMSEtrain')
figure
hist(R2CV,50)
title('R2CV')
figure
hist(RMSECV,50)
title('RMSECV')
