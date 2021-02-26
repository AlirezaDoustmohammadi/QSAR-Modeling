%%Read molecules features from Excel file
[X]=xlsread('molecules.xlsx');

%remove 'No' and 'MolId' col
X=X(:,3:size(X,2));
%%read IC50 from Excel file
Y=xlsread('IC50.xlsx');

%define matrixes
X1=X;
X2=X;
X3=X;
X4=X;

%%%%%%%%OutoScale Features
for col=1:size(X,2)
    %Basic Parameters
    maxVal=max(X(:,col));
    minVal=min(X(:,col));
    meanVal=mean(X(:,col));
    stdVal=std(X(:,col));
    %Method1: outosacle values to be in range [-1,1]
    sum=maxVal+minVal;
    mine=maxVal-minVal;
    X1(:,col)=((X(:,col)*2)/mine)-(sum/mine);
    %Method2: value / max value in col
    X2(:,col)=X(:,col)/maxVal;
    %Method3: value-mean value in col
    X3(:,col)=X(:,col)-meanVal;
    %Method4: (value - mean value)/std
    X4(:,col)=(X(:,col)-meanVal)/stdVal;
end

%%Compute Corrolation Coefficiant
corcoef1=corrcoef(X1);
corcoef4=corrcoef(X4);

%Calculate -log10(IC50)
Y2=-log10(Y);

%save matrixes
save X X;
save X1 X1;
save X2 X2;
save X3 X3;
save X4 X4;
save Y Y;
save Y2 Y2;

%save to Excell
writetable(table(Y2),'f_IC50.xlsx','Sheet',1,'Range','A1');
writetable(table(X1),'AutoScale1.xlsx','Sheet',1,'Range','A1');
writetable(table(X2),'AutoScale2.xlsx','Sheet',1,'Range','A1');
writetable(table(X3),'AutoScale3.xlsx','Sheet',1,'Range','A1');
writetable(table(X4),'AutoScale4.xlsx','Sheet',1,'Range','A1');