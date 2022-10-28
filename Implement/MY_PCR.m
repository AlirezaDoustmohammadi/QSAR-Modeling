load('X1.mat');
load('X4.mat');
load('Y2.mat');
%%%%% Method PCR (FOR Data X1):
for i=1:34
    [Ssel,B,R2,RMSE]=PCR(X1,Y2,i); 
    R2all(i,1)=R2;
    RMSEall(i,1)=RMSE;
end
bar(R2all)
bar(RMSEall)

%%Best PCR is Using PCA with 27 components but we should validate
%LOOPCR
for i=1:34
   [R2t,RMSEt,R2CV,RMSECV]=LOOPCR(X1,Y2,i);
   R2tall(i,1)=R2t;
   R2vall(i,1)=R2CV;
end
plot(R2tall)
   hold on
plot(R2vall,'r*')
%MCC
for i=1:34
[R2t,RMSEt,R2CV,RMSECV]=MCCPCR(X1,Y2,i,1000);
   R2tall(i,1)=R2t;
   R2vall(i,1)=R2CV;
end
plot(R2tall)
   hold on
plot(R2vall,'r*')

%%Best PCR is Using PCA with 14 components
[Ssel1,B,R2,RMSE]=PCR(X1,Y2,14);
bar(B(2:end,1));
Yhat=Ssel1*B;
plot(Y2,Yhat,'r*');



%%%%% Method PCR (FOR Data X4):
for i=1:34
    [Ssel,B,R2,RMSE]=PCR(X4,Y2,i); 
    R2all(i,1)=R2;
    RMSEall(i,1)=RMSE;
end
bar(R2all)
bar(RMSEall)
%%Best PCR is Using PCA with 27 components but we should validate
%LOOPCR
for i=1:34
   [R2t,RMSEt,R2CV,RMSECV]=LOOPCR(X4,Y2,i);
   R2tall(i,1)=R2t;
   R2vall(i,1)=R2CV;
end
plot(R2tall)
   hold on
plot(R2vall,'r*')
%MCC
for i=1:34
[R2t,RMSEt,R2CV,RMSECV]=MCCPCR(X4,Y2,i,1000);
   R2tall(i,1)=R2t;
   R2vall(i,1)=R2CV;
end
plot(R2tall)
   hold on
plot(R2vall,'r*')

%%Best PCR is Using PCA with 14 components
[Ssel2,B,R2,RMSE]=PCR(X4,Y2,14);
bar(B(2:end,1));
Yhat=Ssel2*B;
plot(Y2,Yhat,'r*');


%save data
save X1PCR Ssel1;
save X4PCR Ssel2;
%save data in Excel
writetable(table(Xsel1),'X1PCR.xlsx','Sheet',1,'Range','A1');
writetable(table(Xsel2),'X4PCR.xlsx','Sheet',1,'Range','A1');