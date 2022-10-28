function [e]=GAANN(m)


m=round(m)

load X X 

load Y2 Y2

y=Y2;
x=X1(:,m);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p=x';
t=y';
[pn,ps1]=mapminmax(p);
[tn,ts1]=mapminmax(t);
net=newff(minmax(pn),minmax(tn),[6],{'tansig','purelin'},'trainbr');
 net.trainParam.showWindow=0;
 net = train(net,pn,tn);
 
 a2=sim(net,pn);

a = mapminmax('reverse',a2,ts1);

a=a';





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5




% Computing Error

W=zeros(size(y,2),1);
E=zeros(size(y,2),1);

for i=1:size(y,2)
    R2=corrcoef(y(:,i),a(:,i));
     R2=R2(1,2).^2;  
     W(i,1)=R2;
    e=y(:,i)-a(:,i);
    e=e.^2;
    e=sum(e);
    e=e./size(y,1);
    
    e=e.^0.5;
    
    E(i,1)=e;
    
end

E

R2=W

e=sum(E)

%Columns: 1242 , 772 , 185 , 882 , 313 , 1240 , 204 , 522 , 1145 , 741
%E=0.1549    R2=0.9089      e=0.1549
%Objective function value: 0.09590259589741738
