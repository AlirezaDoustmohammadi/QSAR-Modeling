function [R2,RMSE] = R2RMSE(Y1,Y2)
R=corrcoef(Y1,Y2);
R=R(1,2);
R2=R.^2;
RMSE=sqrt(sum((Y1-Y2).^2)./size(Y1,1));
end

