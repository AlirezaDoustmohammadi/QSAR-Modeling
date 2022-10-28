function e=GAPLS(ind)

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
%%%%%%%%%%%%%%%  Building PLS Model %%%%%%%

[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats] = plsregress(Xsel,Y2,4);

Yhat = [ones(size(Xsel,1),1) Xsel]*BETA;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R=corrcoef(Y2,Yhat);
R2=R(1,2).^2;
R2
e=1-R2;

%X1
%Columns: 703 , 743 , 1104 , 808 , 281 , 330 , 680 , 159 , 1277 , 717
%R2c=0.8673
%R2v=1.6993
%Objective function value: 0.1327397793767937
%[R2C,RMSEC,R2V,RMSEV]=LOOPLS(X1(:,[703,743,1104,808,281,330,680,159,1277,717]),Y2,4,10);
%[R2t,RMSEt,R2CV,RMSECV]=MCCPLS(X1(:,[703,743,1104,808,281,330,680,159,1277,717]),Y2,4,1000,10)
%[XL,YL,XS1,YS,BETA,PCTVAR,MSE,stats] = plsregress(X1(:,[703,743,1104,808,281,330,680,159,1277,717]),Y2,4,'cv',10);
%writetable(table(XS1),'GA-PLS1.xlsx','Sheet',1,'Range','A1');

%X4
%Columns: 907 , 810 , 865 , 398 , 1019 , 535 , 719 , 351 , 716 , 772
%R2c=0.8756
%R2v=0.7464
%[R2C,RMSEC,R2V,RMSEV]=LOOPLS(X4(:,[907,810,865,398,1019,535,719,351,716,772]),Y2,4,10);
%[R2t,RMSEt,R2CV,RMSECV]=MCCPLS(X4(:,[907,810,865,398,1019,535,719,351,716,772]),Y2,4,1000,10)
%[XL,YL,XS2,YS,BETA,PCTVAR,MSE,stats] = plsregress(X4(:,[907,810,865,398,1019,535,719,351,716,772]),Y2,4,'cv',10);
%writetable(table(XS2),'GA-PLS2.xlsx','Sheet',1,'Range','A1');