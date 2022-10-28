function e=GAMLR(ind)

load X1 X1 

load Y2 Y2 

ind=floor(ind);
for i=1:size(ind,2);
    if ind(1,i)==0;
        ind(1,i)=1;
    end
end
ind
Xsel=X1(:,ind);
Xsel=[ones(size(Xsel,1),1) Xsel];
B=inv(Xsel'*Xsel)*(Xsel'*Y2);
Yhat=Xsel*B;
R=corrcoef(Y2,Yhat);
R2=R(1,2).^2;
R2
e=1-R2;

%X1:
%Columns: 680 , 246 , 657 , 1280 , 792 , 667 , 116 , 1102 , 1018 , 598
%R2c=0.8461
%R2c=0.7464
%Objective function value: 0.11071731008694197
%[R2t,RMSEt,R2CV,RMSECV,MeanR2CV,MeanRMSEV]=MCCVMLR(X1(:,[680,246,657,1280,792,667,116,1102,1018,598]),Y2,1000);
%[R2C,RMSEC,R2V,RMSEV]=LOOMLR(X1(:,[680,246,657,1280,792,667,116,1102,1018,598]),Y2);
%writetable(table(X1(:,[680,246,657,1280,792,667,116,1102,1018,598])),'GA-MLR1.xlsx','Sheet',1,'Range','A1');

%X4:
%Best columns: 930,833,749,711,1276,1097,1019,680,1232 
%R2c=0.8626
%R2v=0.7464
%[R2t,RMSEt,R2CV,RMSECV,MeanR2CV,MeanRMSEV]=MCCVMLR(X4(:,[930,833,749,711,1276,1097,1019,680,1232]),Y2,1000);