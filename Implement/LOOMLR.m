function [R2C,RMSEC,R2V,RMSEV]=LOOMLR(X,Y)

Xsel=[ones(size(X,1),1) X];
B=inv(Xsel'*Xsel)*(Xsel'*Y);

Yfit=Xsel*B;
[R2C,RMSEC]=R2RMSE(Y,Yfit);

YLOO=zeros(size(Y));


for i=1:size(Y,1)
    Xcal=Xsel;
    Ycal=Y;
    Xval=Xcal(i,:);
    Xcal(i,:)=[];
    Ycal(i,:)=[];
    
    B=inv(Xcal'*Xcal)*(Xcal'*Ycal);
    
    Yhat=Xval*B;
    
    YLOO(i,:)=Yhat;
end

[R2V,RMSEV]=R2RMSE(Y,YLOO);
plot(Y,YLOO,'r*');