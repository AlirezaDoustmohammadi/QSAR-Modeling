function [R2t,RMSEt,R2CV,RMSECV]=MCCPCR(X,Y,q,n)

%PC components
[s,v,d]=svd(X);
S=s*v;
Ssel=S(:,1:q);

Ssel=[ones(size(Ssel,1),1) Ssel];


nVal=floor(size(Ssel,1)/3);

for i=1:n
    ind=randperm(size(Ssel,1))';
    ind=ind(1:nVal,:);
    Xcal=Ssel;
    Ycal=Y;
    Xval=Ssel(ind,:);
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
R2t=sum(R2t)/size(R2t,1);
RMSEt=sum(RMSEt)/size(RMSEt,1);

R2CV=sum(R2CV)/size(R2CV,1);
RMSECV=sum(RMSECV)/size(RMSECV,1);

