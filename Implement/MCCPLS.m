function [R2t,RMSEt,R2CV,RMSECV]=MCCPLS(X,Y,q,n,cv)

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
    
    [XL,yl,XS,YS,beta,PCTVAR] = plsregress(Xcal,Ycal,q,'cv',cv);    
    
    YhatCal=[ones(size(Xcal,1),1) Xcal]*beta;
    [R2,RMSE]=R2RMSE(YhatCal,Ycal);
    
    R2t(i,1)=R2;
    RMSEt(i,1)=RMSE;
    
    YhatVal=[ones(size(Xval,1),1) Xval]*beta;
    [R2,RMSE]=R2RMSE(YhatVal,Yval);
    
    R2CV(i,1)=R2;
    RMSECV(i,1)=RMSE;
    
end
R2t=sum(R2t)/size(R2t,1);
RMSEt=sum(RMSEt)/size(RMSEt,1);

R2CV=sum(R2CV)/size(R2CV,1);
RMSECV=sum(RMSECV)/size(RMSECV,1);