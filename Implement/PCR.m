function [Ssel,B,R2,RMSE]=PCR(X,Y,q)

[s,v,d]=svd(X);

S=s*v;
Ssel=S(:,1:q);

Ssel=[ones(size(Ssel,1),1) Ssel];

B=inv(Ssel'*Ssel)*(Ssel'*Y);

Yhat=Ssel*B;

R2=corrcoef(Y,Yhat).^2;

R2=R2(1,2);

RMSE=sqrt([sum((Y-Yhat).^2)]./(size(X,1)-1));


