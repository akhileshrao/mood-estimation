function predicted_labels = predict_labels(train_features, train_labels, test_features)

[X Y]=size(test_features);

[M N]=size(train_features);

 for p=1:Y %test set
    B=test_features{1,p};
    [m n]=size(B);
for j=1:n %each second from test set
    maxi=0;
    index=0;
    set=0;k=0;
for i=1:N %compared to all train sets
A=train_features{1,i};
[mm nn]=size(A);

    
        for y=1:nn
   k=max(B(:,j)'*A(:,y));
   if(maxi<k)
       maxi=k;
       set=i;
       index=y;
       
        
   end
        end
        
  

end
if(set>0)
predicted_labels(p,j)=train_labels(set);
else
    predicted_labels(p,j)=0;
end


end
 end

predicted_labels;
