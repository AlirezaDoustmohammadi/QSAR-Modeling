function [R2C,RMSEC,R2V,RMSEV]=LOOPLS(X,Y,n,cv)

[XL,yl,XS,YS,beta,PCTVAR] = plsregress(X,Y,n,'cv',cv);

%calculate Yfit
Yfit=[ones(size(X,1),1) X]*beta;

[R2C,RMSEC]=R2RMSE(Y,Yfit);

YLOO=zeros(size(Y));

for i=1:size(Y,1) 
    Xcal=X;
    Ycal=Y;
    Xval=Xcal(i,:);
    Xcal(i,:)=[];
    Ycal(i,:)=[];
    
    [XL,yl,XS,YS,beta,PCTVAR] = plsregress(Xcal,Ycal,n,'cv',cv);
    
    %calculate Y^
    Yhat=[ones(size(Xval,1),1) Xval]*beta;
    
    YLOO(i,:)=Yhat;    
end

[R2V,RMSEV]=R2RMSE(Y,YLOO);
plot(Y,YLOO,'r*');
