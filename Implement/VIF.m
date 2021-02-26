function [vif, R2]=VIF(x)
size_matrix=size(x,2);
R2=0;
for i=1:size(x,2)
  new_matrix=x;
  %drop ith feature
  new_matrix(:,i)=[];
  new_matrix=[ones(size(new_matrix,1) ,1) new_matrix];
  %calculate Coefficiants
  B = inv(new_matrix' * new_matrix) * (new_matrix'* x(:,i)); 
  Yhat=new_matrix*B;
  R=corrcoef(x(:,i),Yhat);
  R=R(1,2);
  if isnan(R^2) ~= 1
    R2=R2+R^2;
  else
      size_matrix=size_matrix -1;
  end
end
%calculate vif
R2=sum(R2(:,1)) ./ size_matrix;
vif=1./(1-R2);
end

%VIF=1.0888